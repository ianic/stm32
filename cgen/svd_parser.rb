require 'nokogiri'
require 'ostruct'
require File.dirname(__FILE__) + '/common.rb'

class Document
  def initialize(doc)
    @doc = doc
  end

  def respond_to_missing?(m, stuff)
    return false if m == :to_ary
    super
  end

  def attr(name)
    pd.attribute(name.to_s).text
  end

  def method_missing(m, *args, &block)
    m = :description if m.to_sym == :desc
    path = m.to_s.camelcase
    raise "#{path} xpath not found in #{self.class} #{self.name}" if @doc.xpath(path).empty?
    text = @doc.xpath(path).text

    text = text.delete("\n").squeeze(" ") if m == :description
    text.fix_hex
    return text.to_i if text.is_integer?
    text
  end
end

class Field < Document
  def enum
    evs = @doc.xpath("enumeratedValues")
    return nil if evs.empty?

    name = if evs.attribute("derivedFrom")
             evs.map{ |e| e.attribute("derivedFrom").value}.join("_")
           else
             evs.map{ |e| e.xpath("name").text}.join("_")
           end
    Enum.new(name, evs.xpath("enumeratedValue"))
  end
end

class Enum
  attr_reader :name, :values

  def initialize(name, doc)
    @name = name
    return if doc.empty?
    @values = doc.map do |ev|
        OpenStruct.new({
          "name" => ev.xpath("name").text,
          "desc" => ev.xpath("description").text.delete("\n").squeeze(" "),
          "value" => ev.xpath("value").text.to_i,
          "alias" => false,
        })
    end
    @values.each_with_index do |v, i|
      v.alias = !@values.find.with_index{ |v2, j| j < i and v.value == v2.value }.nil?
    end
  end
end

class PaddingField
  attr_reader :name, :bit_offset, :bit_width, :desc

  def initialize(name, bit_offset, bit_width)
    @name = name
    @bit_offset = bit_offset
    @bit_width = bit_width
    @desc = nil
  end

  def enum
    return nil
  end
end

class Register < Document
  attr_reader :address, :bit_width, :type

  def initialize(doc)
    super(doc)
    self.fields
  end

  def fields
    @fields ||= add_reserved_padding(@doc.xpath("fields/field").map{ |fd| Field.new(fd) })
  end

  def add_reserved_padding(fields)
    if fields.length == 1  and fields.first.bit_offset == 0 and fields.first.name == self.name
      @bit_width = fields.first.bit_width
      @type = self.bit_width == 32 ? :int : :mmio_int
      return
    end
    @bit_width = self.size
    @type = :mmio

    fields.sort_by!(&:bit_offset)
    fields_with_padding = []
    bit_offset = 0
    for f in fields do
      if f.bit_offset != bit_offset
        fields_with_padding << PaddingField.new("reserved_#{bit_offset}_#{f.bit_offset-1}",
                                                bit_offset,
                                                f.bit_offset - bit_offset)
      end
      fields_with_padding << f
      bit_offset = f.bit_offset + f.bit_width
    end
    if bit_offset < self.size
      fields_with_padding << PaddingField.new("padding_#{bit_offset}_#{self.size-1}",
                                              bit_offset,
                                              self.size - bit_offset)
    end
    return fields_with_padding
  end

  def dim
    d = @doc.xpath("dim")
    return 0 if d.empty?
    d.text.to_i
  end

  def size
    return 32 if @doc.xpath("size").empty?
    as_int(@doc.xpath("size").text.fix_hex)
  end
end

def as_int(str)
  return str if str.is_a?(Integer)
  return str.to_i(16) if str.is_hexadecimal_literal?
  str.to_i
end

class Child
  def method_missing(m, *args, &block)
    @parent.send m, *args
  end

  def respond_to_missing?(m, stuff)
    return false if m == :to_ary
    super
  end
end

class ClusterRegister < Child
  attr_reader :name, :address_offset, :address

  def initialize(parent, name, offset)
    @parent = parent
    @name = name
    @address_offset = "0x" + (parent.address_offset.to_i(16) + offset).to_s(16)
  end
end

class DerivedRegister < Child
  attr_reader :name, :address_offset, :desc, :address

  def initialize(parent, name, address_offset, desc)
    @parent = parent
    @name = name
    @address_offset = address_offset
    @desc = desc
  end
end

class Peripheral < Document
  def registers
    @registers ||= all_registers
  end

  private
  def all_registers
    regs = @doc.xpath("registers/register").map do |d|
      next unless d.attribute("derivedFrom").nil? # only derived
      Register.new(d)
    end.compact
    ((regs + cluster_registers).flatten.
      map{ |r| r.dim > 0 ? dim_duplicate(r) : r }.flatten +
      derived(regs)
    ).compact
  end

  def derived(regs)
    @doc.xpath("registers/register").map do |rd|
      next if rd.attribute("derivedFrom").nil? # only derived
      from_name = rd.attribute("derivedFrom").text
      parent = regs.find{ |p| p.name == from_name }
      pp regs.map{ |r| r.name } unless parent
      raise "parent #{from_name} not found for #{rd.xpath('name').text}" unless parent
      DerivedRegister.new(parent,
                          rd.xpath("name").text,
                          rd.xpath("addressOffset").text.fix_hex,
                          rd.xpath("description").text,
                         )
    end.compact
  end

  def dim_duplicate(r)
    dim = r.dim
    increment = r.dim_increment.to_i(16)
    subs = r.dim_index.split(",")
    (0..dim-1).map do |i|
      sub = subs[i].split("-")[0] # fix for "1-1" string for TIM10.CCR
      ClusterRegister.new r, r.name.sub("%s", sub), increment * i
    end
  end

  def cluster_registers
    return [] if @doc.xpath("registers/cluster").empty?
    cd = @doc.xpath("registers/cluster")
    dim = cd.xpath("dim").text.to_i
    increment = cd.xpath("dimIncrement").text.to_i(16)
    address_offset = cd.xpath("addressOffset").text.to_i(16)
    index = cd.xpath("dimIndex").text.split(",")
    name = cd.xpath("name").text
    regs = cd.xpath("register").map{ |d| Register.new(d) }

    (0..dim-1).map do |i|
      prefix = name.sub("%s", index[i])
      regs.map{ |r| ClusterRegister.new(r, prefix + r.name, address_offset + increment * i) }
    end.flatten
  end
end

class DerivedPeripheral < Child
  attr_reader :name, :base_address

  def initialize(parent, name, base_address)
    @parent = parent
    @name = name
    @base_address = base_address
  end
end

class Device < Document
  def peripherals
    @peripherals ||= all_peripherals
  end

  private
  def all_peripherals
    regular = @doc.xpath("//peripheral").map do |d|
      next unless d.attribute("derivedFrom").nil? # skip derived
      Peripheral.new(d)
    end.compact
    (regular + derived(regular)).flatten
  end

  # if derivedFrom is defined on peripheral
  # copy from parent except name and base_address
  def derived(regular)
    @doc.xpath("//peripheral").map do |pd|
      next if pd.attribute("derivedFrom").nil? # only derived
      from_name = pd.attribute("derivedFrom").text
      parent = regular.find{ |p| p.name == from_name }
      raise "parent #{from_name} not found for #{pd.xpath('name').text}" unless parent
      DerivedPeripheral.new(parent, pd.xpath("name").text, pd.xpath("baseAddress").text.fix_hex)
    end.compact
  end
end


class SvdParser

  def initialize(chip)
    filename = "data/stm32f#{chip[0..2].upcase}.svd"
    filename = "data/test.svd" if $is_test
    #filename = "data/STM32F#{chip[0..2].upcase}.svd"
    @doc = File.open(filename) { |f| Nokogiri::XML(f) }
    @peripherals = []

    Device.new(@doc)
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
    # evs = fd.xpath("enumeratedValues")
    # unless evs.empty?
    #   f["enum"] = self.enum(evs)
    # end
    f
  end

  def enum(evs)
    return nil if evs.nil?
    if evs.attribute("derivedFrom")
      return {
        "name" => evs.map{ |e| e.attribute("derivedFrom").value}.join("_"),
      }
    end
    {
      "name" => evs.map{ |e| e.xpath("name").text}.join("_"),
      "values" => evs.xpath("enumeratedValue").map do |ev|
        {
          "name" => ev.xpath("name").text,
          "desc" => ev.xpath("description").text.delete("\n").squeeze(" "),
          "value" => ev.xpath("value").text.to_i,
        }
      end,
    }
  end

  def registers(rp)
    rp.map do |rd|
      r = self.register(rd)
      r["fields"] = rd.xpath("fields/field").map{ |fd| self.field(fd) }
      r["dim"] == 0 ? r : self.dim_duplicate(r)
    end.flatten
  end

  def cluster(pd)
    return [] if pd.xpath("registers/cluster").empty?
    cd = pd.xpath("registers/cluster")
    dim = cd.xpath("dim").text.to_i
    increment = cd.xpath("dimIncrement").text.to_i(16)
    address_offset = cd.xpath("addressOffset").text.to_i(16)
    index = cd.xpath("dimIndex").text.split(",")
    name = cd.xpath("name").text
    regs = registers(cd.xpath("register"))
    cluster_regs = []
    (0..dim-1).map do |i|
      prefix = name.sub("%s", index[i])
      cluster_regs << regs.map{ |r|
        r = r.clone()
        r["name"] = prefix + r["name"]
        r["address_offset"] = "0x" + (r["address_offset"].to_i(16) + address_offset + increment * i).to_s(16)
        r
      }
    end
    cluster_regs.flatten
  end

  def regular
    @peripherals = @doc.xpath("//peripheral").map do |pd|
      next unless pd.attribute("derivedFrom").nil? # skip derived
      p = self.peripheral(pd)
      p["registers"] = (registers(pd.xpath("registers/register")) + cluster(pd)).flatten
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
