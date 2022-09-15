require 'nokogiri'
require 'ostruct'
require File.dirname(__FILE__) + '/common.rb'

class Document
  attr_reader :parent

  def initialize(doc, parent = nil)
    @doc = doc
    @parent = parent
  end

  def attribute(name)
    d = @doc.attribute(doc_path(name))
    d.nil? ? nil : d.text
  end

  def doc_path(name)
    name = :description if name.to_sym == :desc
    path = name.to_s.camelcase
  end

  def element(name)
    path = doc_path(name)
    return nil if @doc.xpath(path).empty?

    text = @doc.xpath(path).text
    text = text.delete("\n").squeeze(' ') if name == :desc # remove newline in description
    return text.to_i(16) if text.start_with?('0X') or text.start_with?('0x') # hex string to int

    text.is_integer? ? text.to_i : text
  end

  def doc_to_vars(*names)
    names.each do |name|
      instance_variable_set("@#{name}", element(name))
    end
  end
end

class XmlDocument < Document
  def method_missing(method, *_args)
    element(method) || attribute(method)
  end
end

class Field < Document
  attr_reader :name, :desc, :bit_offset, :bit_width, :enum

  def initialize(doc, parent)
    super doc, parent
    doc_to_vars :name, :desc, :bit_offset, :bit_width
    @enum = begin
      evs = doc.xpath('enumeratedValues')
      return nil if evs.empty?

      name = if evs.attribute('derivedFrom')
               evs.map { |e| e.attribute('derivedFrom').value }.join('_')
             else
               evs.map { |e| e.xpath('name').text }.join('_')
             end
      Enum.new(name, evs.xpath('enumeratedValue'), self)
    end
  end

  private

  def initialize_dup(orig)
    @enum = orig.enum.dup
    super
  end
end

class Enum
  attr_accessor :redirect_to
  attr_reader :name, :field, :values, :key

  def initialize(name, doc, field)
    @field = field
    @name = shorten(name)
    collect_values(doc) unless doc.empty?
  end

  def bit_width
    @field.bit_width
  end

  def path
    "#{@field.parent.parent.name}.#{@field.parent.name}"
  end

  def fields
    @values.select { |v| !v.alias }
  end

  def aliases
    @values.select { |v| v.alias }
  end

  private

  def collect_values(doc)
    @values = doc.map { |xd| EnumValue.new(xd, self) }
    # mark repeating value as alias
    # in zig we can not have two items with the same value in enum
    @values.each_with_index do |v, i|
      is_alias = !@values.find.with_index { |v2, j| j < i and v.value == v2.value }.nil?
      v.instance_variable_set('@alias', true) if is_alias
    end
    # for matching equal enums calculate hash of all fields
    @key = @values.inject(@name) { |key, v| key + " #{v.name} #{v.value} #{v.desc}" }.hash
  end

  # shorten composite read/write enum name
  # for example: PR0R_PR0W => PR0
  def shorten(name)
    if name.include?('_')
      parts = name.split('_')
      if parts.size == 2 and parts[0].size > 1 and parts[1].size > 1 && (parts[0][0..-2] == parts[1][0..-2])
        return parts[0][0..-2]
      end
    end
    name
  end
end

class EnumValue < Document
  attr_reader :name, :desc, :alias

  def initialize(doc, parent)
    super doc, parent
    doc_to_vars :name, :desc, :value
    @alias = false
  end

  def value
    return @value if @parent.bit_width == 1

    fmt = "0b%0#{@parent.bit_width}b"
    fmt % @value
  end
end

class PaddingField
  attr_reader :name, :bit_offset, :bit_width, :desc, :enum

  def initialize(name, bit_offset, bit_width)
    @name = name
    @bit_offset = bit_offset
    @bit_width = bit_width
    @desc = nil
    @enum = nil
  end
end

class Register < Document
  attr_reader  :name, :desc, :address_offset, :size, :reset_value, :fields,
               :dim, :dim_increment, :dim_index,
               :bit_width, :type

  def initialize(doc, parent)
    super doc, parent
    doc_to_vars :name, :desc, :address_offset, :size, :reset_value, :dim, :dim_increment, :dim_index
    @dim = (@dim || 0).to_i
    @size = (@size.to_i == 0 ? 32 : @size).to_i
    @fields = add_reserved_padding(collect_fields)
  end

  def address(base)
    base + address_offset
  end

  def enums
    @fields.map { |f| f.enum if f.enum and f.enum.values }.compact
  end

  private

  def collect_fields
    @doc.xpath('fields/field').map { |fd| Field.new(fd, self) }
  end

  def calc_type(fields)
    if fields.length == 1 and fields.first.bit_offset == 0 and fields.first.name == name
      @bit_width = fields.first.bit_width
      @type = bit_width == 32 ? :int : :mmio_int
      return
    end
    @bit_width = size
    @type = :mmio
  end

  def add_reserved_padding(fields)
    calc_type fields
    fields.sort_by!(&:bit_offset)
    fields_with_padding = []
    bit_offset = 0
    for f in fields do
      if f.bit_offset != bit_offset
        fields_with_padding << PaddingField.new("reserved_#{bit_offset}_#{f.bit_offset - 1}",
                                                bit_offset,
                                                f.bit_offset - bit_offset)
      end
      fields_with_padding << f
      bit_offset = f.bit_offset + f.bit_width
    end
    if bit_offset < size
      fields_with_padding << PaddingField.new("padding_#{bit_offset}_#{size - 1}",
                                              bit_offset,
                                              size - bit_offset)
    end
    fields_with_padding
  end

  def initialize_dup(orig)
    @fields = orig.fields.map { |f| f.dup } if orig.fields
    super
  end

  public

  def derived(name, address_offset, desc, parent)
    d = dup
    d.instance_variable_set(:@name, name)
    d.instance_variable_set(:@address_offset, address_offset)
    d.instance_variable_set(:@desc, desc) if desc
    d.instance_variable_set(:@parent, parent)
    d
  end
end

class Peripheral < Document
  attr_reader :name, :desc, :base_address, :registers

  def initialize(doc)
    super doc, nil
    doc_to_vars :name, :desc, :base_address
    @registers = collect_registers
  end

  private

  def collect_registers
    regs = @doc.xpath('registers/register').map do |d|
      Register.new(d, self) if d.attribute('derivedFrom').nil? # skip derived
    end.compact
    ((regs + cluster_registers).flatten
      .map { |r| r.dim > 0 ? dim_duplicate(r) : r }.flatten +
      derived_registers(regs)
    ).compact
  end

  def derived_registers(regs)
    @doc.xpath('registers/register').map do |xd|
      d = XmlDocument.new(xd)
      next if d.derived_from.nil? # only derived

      orig = regs.find { |r| r.name == d.derived_from }
      raise "orig #{d.derived_from} not found for #{d.name}" unless orig

      orig.derived(d.name, d.address_offset, d.desc, self)
    end.compact
  end

  def dim_duplicate(r)
    subs = r.dim_index.split(',')
    (0..r.dim - 1).map do |i|
      sub = subs[i].split('-')[0] # fix for "1-1" string for TIM10.CCR
      r.derived(r.name.sub('%s', sub), r.address_offset + r.dim_increment * i, nil, self)
    end
  end

  def cluster_registers
    xd = @doc.xpath('registers/cluster')
    return [] if xd.empty?

    regs = xd.xpath('register').map { |d| Register.new(d, self) }
    d = XmlDocument.new(xd)
    dim = d.dim
    increment = d.dim_increment
    address_offset = d.address_offset
    indexes = d.dim_index.split(',')
    name = d.name

    (0..dim - 1).map do |i|
      prefix = name.sub('%s', indexes[i])
      regs.map do |r|
        r.derived(prefix + r.name, r.address_offset + address_offset + increment * i, nil, self)
      end
    end.flatten
  end

  def initialize_dup(orig)
    @registers = orig.registers.map { |r| r.dup }
    super
  end

  public

  def derived(name, base_address)
    d = dup
    d.instance_variable_set(:@name, name)
    d.instance_variable_set(:@base_address, base_address)
    d
  end
end

class Device < Document
  def peripherals
    @peripherals ||= collect_peripherals
  end

  def calc_enum_redirect_to
    keys = {}
    enums.each do |e|
      if keys[e.key].nil?
        keys[e.key] = e
      else
        e.redirect_to = keys[e.key]
      end
    end
  end

  private

  def enums
    return @enums if @enums

    @enums = []
    peripherals.each do |per|
      per.registers.each do |reg|
        reg.instance_variable_set(:@parent, per)
        next if reg.fields.nil?

        reg.fields.each do |fld|
          fld.instance_variable_set(:@parent, reg)
          next unless fld.enum

          fld.enum.instance_variable_set(:@field, fld)
          next unless fld.enum.values

          @enums << fld.enum
        end
      end
    end
    @enums
  end

  def collect_peripherals
    regular = @doc.xpath('//peripheral').map do |d|
      Peripheral.new(d) if d.attribute('derivedFrom').nil? # skip derived
    end.compact
    (regular + derived_peripherals(regular)).flatten
  end

  # if derivedFrom is defined on peripheral
  # copy from orig except name and base_address
  def derived_peripherals(regular)
    @doc.xpath('//peripheral').map do |xd|
      d = XmlDocument.new(xd)
      next if d.derived_from.nil? # only derived

      orig = regular.find { |p| p.name == d.derived_from }
      raise "orig #{d.derived_from} not found for #{d.name}" unless orig

      orig.derived(d.name, d.base_address)
    end.compact
  end
end
