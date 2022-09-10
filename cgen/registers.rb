#!/usr/bin/env ruby

require 'erb'
require 'json'
require 'nokogiri'
require 'csv'
require File.dirname(__FILE__) + '/common.rb'
require File.dirname(__FILE__) + '/svd_parser.rb'

if ARGV[0].nil?
  print "Usage: registers.rb [chip-name]\n"
  exit 1
end

def read_data(chip)
  filename = "data/STM32F#{chip[0..2].upcase}.svd"
  doc = File.open(filename) { |f| Nokogiri::XML(f) }
  peripherals = []
  for pd in doc.xpath("//peripheral") do
    # if derivedFrom is defined on peripheral
    # copy from parent except name and base_address
    unless pd.attribute("derivedFrom").nil?
      from_name = pd.attribute("derivedFrom").text
      parent = peripherals.find{ |p| p["name"] == from_name }
      unless parent
        #print "parent #{from_name} not found for #{pd.xpath('name').text}"
        next
      end
      p = parent.clone.merge({
                               "name" => pd.xpath("name").text,
                               "base_address" => pd.xpath("baseAddress").text.sub("0X", "0x").downcase,
                             })
      peripherals << p
      next
    end

    p = {
      "name" => pd.xpath("name").text,
      "desc" => pd.xpath("description").text.delete("\n").squeeze(" "),
      "group" => pd.xpath("groupName").text,
      "base_address" => pd.xpath("baseAddress").text.sub("0X", "0x").downcase,
    }
    registers = []
    for rd in pd.xpath("registers/register") do
      r = {
        "name" => rd.xpath("name").text,
        "desc" => rd.xpath("description").text.delete("\n").squeeze(" "),
        "address_offset" => rd.xpath("addressOffset").text.sub("0X", "0x").downcase,
        "access" => rd.xpath("access").text,
        "size" => rd.xpath("size").text.to_i(16),
        "reset_value" => rd.xpath("resetValue").text,
      }
      fields = []
      for fd in rd.xpath("fields/field") do
        fields << {
          "name" => fd.xpath("name").text,
          "desc" => fd.xpath("description").text.delete("\n").squeeze(" "),
          "bit_offset" => fd.xpath("bitOffset").text.to_i,
          "bit_width" => fd.xpath("bitWidth").text.to_i,
        }
      end
      r["fields"] = fields
      registers << r
      p["registers"] = registers
    end
    peripherals << p
  end
  peripherals
end

def add_reserved_padding(r)
  if r.fields.length == 1  and r.fields.first.bit_offset == 0 and r.fields.first.name == r.name
    r.bit_width = r.fields.first.bit_width
    r.type = r.bit_width == 32 ? :int : :mmio_int
    return
  end

  r.fields.sort_by!(&:bit_offset)
  fields = []
  reserved = 0
  bit_offset = 0
  for f in r.fields do
    if f.bit_offset != bit_offset
      # bit by bit version
      # (bit_offset..(f.bit_offset-1)).each_with_index do |b, i|
      #   fields << OpenStruct.new({
      #                            "name" => "reserved#{reserved}",
      #                            "bit_offset" => b,
      #                            "bit_width" => 1,
      #                          })
      #   reserved += 1
      # end
      # compact version
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
    # bit by bit version
    # (bit_offset..(r.size-1)).each_with_index do |b, i|
    #   fields << OpenStruct.new({
    #                              "name" => "padding#{i}",
    #                              "bit_offset" => b,
    #                              "bit_width" => 1,
    #                            })
    # end
    fields << OpenStruct.new({
                               "name" => "padding_#{bit_offset}_#{r.size-1}",
                               "bit_offset" => bit_offset,
                               "bit_width" => r.size - bit_offset,
                             })
  end
  r.fields = fields
end

def fix_adc_smpr(peripherals)
  peripherals.select{ |p| p.group == "ADC" }.each do |adc|
    r = adc.registers.find{ |r| r.name == "SMPR2" }
    if r and r.fields.length == 1
      r.fields = []
      (0..9).each do |i|
        r.fields << OpenStruct.new({
                                     "name" => "SMP#{i}",
                                     "bit_offset" => i+3,
                                     "bit_width" => 3,
                                   })
      end
      r.fields << OpenStruct.new({
                                   "name" => "padding",
                                   "bit_offset" => 27,
                                   "bit_width" => 2,
                                 })
    end

    r = adc.registers.find{ |r| r.name == "SMPR1" }
    if r and r.fields.length == 1
      r.fields = []
      (10..18).each do |i|
        r.fields << OpenStruct.new({
                                     "name" => "SMP#{i}",
                                     "bit_offset" => i+3,
                                     "bit_width" => 3,
                                   })
      end
      r.fields << OpenStruct.new({
                                   "name" => "padding",
                                   "bit_offset" => 30,
                                   "bit_width" => 5,
                                 })
    end
  end
end

peripherals = read_data ARGV[0]
peripherals = peripherals.map do |p|
  p = OpenStruct.new(p)
  p.registers.map! do |r|
    r = OpenStruct.new(r)
    r.address = "0x" + (p.base_address.to_i(16) + r.address_offset.to_i(16)).to_s(16)
    r.fields.map! do |f|
      OpenStruct.new(f)
    end
    add_reserved_padding(r)
    r
  end
  p
end

peripherals = SvdParser.new(ARGV[0]).parse
fix_adc_smpr(peripherals)

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
            <%- if f.desc -%>
            /// <%= f.desc %>
            <%- end -%>
            <%= f.name %>: u<%= f.bit_width %>,
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

puts File.read("data/registers_footer.zig")
