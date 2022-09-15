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
    d = @doc.attribute(name.to_s)
    return nil if d.nil?

    d.text
  end

  def element(name)
    name = :description if name.to_sym == :desc
    path = name.to_s.camelcase
    return nil if @doc.xpath(path).empty?

    text = @doc.xpath(path).text
    text = text.delete("\n").squeeze(' ') if name == :description
    text.fix_hex
    text.is_integer? ? text.to_i : text
  end

  def doc_to_vars(*names)
    names.each do |name|
      instance_variable_set("@#{name}", element(name))
    end
  end

  # def respond_to_missing?(m, stuff)
  #   return false if m == :to_ary
  #   super
  # end

  # def method_missing(m, *args, &block)
  #   m = :description if m.to_sym == :desc
  #   path = m.to_s.camelcase
  #   raise "#{path} xpath not found in #{self.class} #{self.name}" if @doc.xpath(path).empty?
  #   text = @doc.xpath(path).text

  #   text = text.delete("\n").squeeze(" ") if m == :description
  #   text.fix_hex
  #   return text.to_i if text.is_integer?
  #   text
  # end
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

  private

  def collect_values(doc)
    key = name
    @values = doc.map do |ev|
      e = OpenStruct.new({
                           'name' => ev.xpath('name').text,
                           'desc' => ev.xpath('description').text.delete("\n").squeeze(' '),
                           'value' => ev.xpath('value').text.to_i,
                           'alias' => false
                         })
      key += " #{e.name} #{e.value} #{e.desc}"
      e
    end
    @key = key.hash # for matching equal enums
    # mark repeating value as alias
    # in zig we can not have two items with the same value in enum
    @values.each_with_index do |v, i|
      v.alias = !@values.find.with_index { |v2, j| j < i and v.value == v2.value }.nil?
    end
  end

  # shorten composite read/write enum name
  # for example: PR0R_PR0W => PR0
  def shorten(name)
    if name.include?('_')
      parts = name.split('_')
      if parts.size == 2 and parts[0].size > 1 and parts[1].size > 1 && (parts[0][0..-2] == parts[1][0..-2])
        return parts[0][0..-2] #+ parts[0][-1] + parts[1][-1]
      end
    end
    name
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

  private

  def collect_fields
    @doc.xpath('fields/field').map { |fd| Field.new(fd, self) }
  end

  def add_reserved_padding(fields)
    if fields.length == 1 and fields.first.bit_offset == 0 and fields.first.name == name
      @bit_width = fields.first.bit_width
      @type = bit_width == 32 ? :int : :mmio_int
      return
    end
    @bit_width = size
    @type = :mmio

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

def as_int(str)
  return str if str.is_a?(Integer)
  return str.to_i(16) if str.is_hexadecimal_literal?

  str.to_i
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
      next unless d.attribute('derivedFrom').nil? # skip derived

      Register.new(d, self)
    end.compact
    ((regs + cluster_registers).flatten
      .map { |r| r.dim > 0 ? dim_duplicate(r) : r }.flatten +
      derived_registers(regs)
    ).compact
  end

  def derived_registers(regs)
    @doc.xpath('registers/register').map do |d|
      next if d.attribute('derivedFrom').nil? # only derived

      from_name = d.attribute('derivedFrom').text
      orig = regs.find { |p| p.name == from_name }
      raise "orig #{from_name} not found for #{d.xpath('name').text}" unless orig

      orig.derived(
        d.xpath('name').text,
        d.xpath('addressOffset').text.fix_hex,
        d.xpath('description').text,
        self
      )
    end.compact
  end

  def dim_duplicate(r)
    dim = r.dim
    increment = r.dim_increment.to_i(16)
    subs = r.dim_index.split(',')
    (0..dim - 1).map do |i|
      sub = subs[i].split('-')[0] # fix for "1-1" string for TIM10.CCR
      r.derived(
        r.name.sub('%s', sub),
        address_offset_append(r.address_offset, increment * i),
        nil,
        self
      )
    end
  end

  def cluster_registers
    return [] if @doc.xpath('registers/cluster').empty?

    cd = @doc.xpath('registers/cluster')
    dim = cd.xpath('dim').text.to_i
    increment = cd.xpath('dimIncrement').text.to_i(16)
    address_offset = cd.xpath('addressOffset').text.to_i(16)
    index = cd.xpath('dimIndex').text.split(',')
    name = cd.xpath('name').text
    regs = cd.xpath('register').map { |d| Register.new(d, self) }

    (0..dim - 1).map do |i|
      prefix = name.sub('%s', index[i])
      regs.map do |r|
        r.derived(
          prefix + r.name,
          address_offset_append(r.address_offset, address_offset + increment * i),
          nil,
          self
        )
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

def address_offset_append(address_offset, offset)
  '0x' + (address_offset.to_i(16) + offset).to_s(16)
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
      next unless d.attribute('derivedFrom').nil? # skip derived

      Peripheral.new(d)
    end.compact
    (regular + derived_peripherals(regular)).flatten
  end

  # if derivedFrom is defined on peripheral
  # copy from orig except name and base_address
  def derived_peripherals(regular)
    @doc.xpath('//peripheral').map do |d|
      next if d.attribute('derivedFrom').nil? # only derived

      from_name = d.attribute('derivedFrom').text
      orig = regular.find { |p| p.name == from_name }
      raise "orig #{from_name} not found for #{d.xpath('name').text}" unless orig

      orig.derived(d.xpath('name').text, d.xpath('baseAddress').text.fix_hex)
    end.compact
  end
end
