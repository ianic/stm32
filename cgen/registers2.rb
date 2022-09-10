#!/usr/bin/env ruby

require 'erb'
require 'json'
require 'nokogiri'
require 'csv'

# extend string
class String
  def titlecase()
    self.split('_').collect(&:capitalize).join
  end

  def identifier()
    return "@\"#{self}\"" if ["error", "break"].include?(self)
    self
  end
end

class Hash
  def to_o
    JSON.parse to_json, object_class: OpenStruct
  end
end

class Array
  def to_o
    JSON.parse to_json, object_class: OpenStruct
  end
end

if ARGV[0].nil?
  print "Usage: registers.rb [chip-name]\n"
  exit 1
end

$is_test = ARGV[0] == "test"

class SvdParser

  def initialize(chip)
    filename = "../tmp/stm32-svd/svd/stm32f#{chip[0..2].upcase}.svd"
    filename = "data/test.svd" if $is_test
    @doc = File.open(filename) { |f| Nokogiri::XML(f) }
    @peripherals = []
  end

  # xml doc to hash
  def peripheral(pd)
    {
      "name" => pd.xpath("name").text,
      "desc" => pd.xpath("description").text.delete("\n").squeeze(" "),
      "group" => pd.xpath("groupName").text,
      "base_address" => pd.xpath("baseAddress").text.sub("0X", "0x").downcase,
    }
  end

  def register(rd)
    {
      "name" => rd.xpath("name").text,
      "desc" => rd.xpath("description").text.delete("\n").squeeze(" "),
      "address_offset" => rd.xpath("addressOffset").text.sub("0X", "0x").downcase,
      "access" => rd.xpath("access").text,
      "size" => rd.xpath("size").text.to_i(16),
      "reset_value" => rd.xpath("resetValue").text,

      "dim" => rd.xpath("dim").text.to_i,
      "dim_increment" => rd.xpath("dimIncrement").text.to_i(16),
      "dim_index" => rd.xpath("dimIndex").text
    }
  end

  def field(fd)
    f  = {
      "name" => fd.xpath("name").text,
      "desc" => fd.xpath("description").text.delete("\n").squeeze(" "),
      "bit_offset" => fd.xpath("bitOffset").text.to_i,
      "bit_width" => fd.xpath("bitWidth").text.to_i,
    }
    evs = fd.xpath("enumeratedValues")
    unless evs.empty?
      f["enum"] = self.enum(evs)
    end
    f
  end

  def enum(evs)
    return nil if evs.nil?
    if evs.attribute("derivedFrom")
      return {
        "name" => evs.attribute("derivedFrom").value,
      }
    end
    {
      "name" => evs.xpath("name").text,
      "values" => evs.xpath("enumeratedValue").map do |ev|
        {
          "name" => ev.xpath("name").text,
          "desc" => ev.xpath("description").text.delete("\n").squeeze(" "),
          "value" => ev.xpath("value").text.to_i,
        }
      end,
    }
  end

  def regular
    @peripherals = @doc.xpath("//peripheral").map do |pd|
      next unless pd.attribute("derivedFrom").nil? # skip derived
      p = self.peripheral(pd)
      p["registers"] = pd.xpath("registers/register").map do |rd|
        r = self.register(rd)
        r["fields"] = rd.xpath("fields/field").map{ |fd| self.field(fd) }
        r["dim"] == 0 ? r : self.dim_duplicate(r)
      end.flatten
      p
    end.compact
  end

  def dim_duplicate(r)
    dim = r["dim"]
    increment = r["dim_increment"]
    subs = r["dim_index"].split(",")

    (0..dim-1).map do |i|
      c = r.clone
      sub = subs[i].split("-")[0] # fix for "1-1" string for TIM10.CCR
      c["name"] = c["name"].sub("%s", sub)
      c["address_offset"] = "0x" + (c["address_offset"].to_i(16) + increment * i).to_s(16)
      c.delete "dim"
      c.delete "dim_increment"
      c.delete "dim_index"
      c
    end
  end

  def derived
    for pd in @doc.xpath("//peripheral") do
      # if derivedFrom is defined on peripheral
      # copy from parent except name and base_address
      next if pd.attribute("derivedFrom").nil? # only derived
      from_name = pd.attribute("derivedFrom").text
      parent = @peripherals.find{ |p| p["name"] == from_name }
      raise "parent #{from_name} not found for #{pd.xpath('name').text}" unless parent
      p = parent.clone.merge({
                               "name" => pd.xpath("name").text,
                               "base_address" => pd.xpath("baseAddress").text.sub("0X", "0x").downcase,
                             })
      @peripherals << p
    end
  end

  def parse
    self.regular
    self.derived
    add_calulated_fields @peripherals.to_o
    #@po
    #add_calulated_fields
    #self.hash_to_object
  end

  def add_calulated_fields(peripherals)
    peripherals.map do |p|
      p.registers.map! do |r|
        r.address = "0x" + (p.base_address.to_i(16) + r.address_offset.to_i(16)).to_s(16)
        self.add_reserved_padding(r)
        r
      end
      p
    end
  end

  def add_reserved_padding(r)
    if r.fields.length == 1  and r.fields.first.bit_offset == 0 and r.fields.first.name == r.name
      r.bit_width = r.fields.first.bit_width
      r.type = r.bit_width == 32 ? :int : :mmio_int
      return
    end

    r.fields.sort_by!(&:bit_offset)
    fields = []
    bit_offset = 0
    for f in r.fields do
      if f.bit_offset != bit_offset
        fields << OpenStruct.new({
                                   "name" => "reserved_#{bit_offset}_#{f.bit_offset-1}",
                                   "bit_offset" => bit_offset,
                                   "bit_width" => f.bit_offset - bit_offset,
                                 })
      end
      fields << f
      bit_offset = f.bit_offset + f.bit_width
    end
    if bit_offset < r.size
      fields << OpenStruct.new({
                                 "name" => "padding_#{bit_offset}_#{r.size-1}",
                                 "bit_offset" => bit_offset,
                                 "bit_width" => r.size - bit_offset,
                               })
    end
    r.fields = fields
  end

end

peripherals = SvdParser.new(ARGV[0]).parse

#pp peripherals.select{ |p| p.name == "ADC_Common" }
#exit

def generate(peripherals)
  tmpl = <<-EOF
pub const registers = struct {
    <%- for p in peripherals %>
    /// <%= p.desc %>
    pub const <%= p.name %> = struct {
        pub const base_address = <%= p.base_address %>;

        <%- for r in p.registers %>
        /// address: <%= r.address %>
        /// <%= r.desc %>
        <%- case r.type -%>
        <%- when :int -%>
        pub const <%= r.name %> = @intToPtr(*volatile u<%= r.size %>, base_address + <%= r.address_offset %>);
        <%- when :mmio_int -%>
        pub const <%= r.name %> = @intToPtr(*volatile MmioInt(<%= r.size %>, u<%= r.bit_width %>), base_address + <%= r.address_offset %>);
        <%- else -%>
        pub const <%= r.name %> = @intToPtr(*volatile Mmio(<%= r.size %>, packed struct {
            <%- for f in r.fields -%>
            <%- if (f.enum and f.enum.values and f.enum.values.length > 0) -%>
            pub const <%= f.enum.name.titlecase %> = enum(u<%= f.bit_width %>) {
                <%- for v in f.enum.values -%>
                <%= v.name.downcase.identifier %> = <%= v.value %>, // <%= v.desc %>
                <%- end -%>
            };
            <%- end -%>
            <%- end -%>

            <%- for f in r.fields -%>
            <%- if f.desc -%>
            /// <%= f.desc %>
            <%- end -%>
            <%= f.name %>: <%- if f.enum -%><%= f.enum.name.titlecase %><%- else -%>u<%= f.bit_width %><%- end -%>,
            <%- end -%>
        }), base_address + <%= r.address_offset %>);
        <%- end -%>
        <%- end -%>
    };
    <%- end -%>
};

  EOF
  puts ERB.new(tmpl, trim_mode: '-').result(binding)
end

puts "// this file was generated by cgen/registers.rb"
generate peripherals

# experiment with zig naming convention for registers
# peripherals.map do |p|
#   p.name.downcase!
#   p.registers.map do |r|
#     r.name.downcase! unless r.name == "OR"
#     r.fields.map { |f| f.name.downcase! unless f.name == "ALIGN" }
#   end
# end
# generate peripherals

puts File.read("data/registers_footer.zig") unless $is_test


    # <%- for p in peripherals -%>
    # <%- for r in p.registers -%>
    # <%- for f in r.fields -%>
    # <%- next unless (f.enum and f.enum.values and f.enum.values.length > 0) -%>
    # pub const <%= f.enum.name %> = enum {
    #     <%- for v in f.enum.values -%>
    #     <%= v.name %> = <%= v.value %>,
    #     <%- end -%>
    # };
    # <%- end -%>
    # <%- end -%>
    # <%- end -%>
