require File.dirname(__FILE__) + '/svd_parser.rb'
require "test/unit"

class TestSvdParser < Test::Unit::TestCase

  def setup
    filename = "data/test.svd"
    @doc = File.open(filename) { |f| Nokogiri::XML(f) }
  end

  def test_fix_hex
    assert_equal "0x1234", "0x1234".fix_hex
    assert_equal "0x1234", "0X1234".fix_hex
    assert_equal "0xabcd", "0XABCD".fix_hex
    t = "0XABCD".fix_hex
    assert_equal "0xabcd", t
  end

  def test_field
    field = Field.new @doc.xpath("//peripheral/registers/register/fields/field").first

    assert_equal "TSVREFE", field.name
    assert_equal "Temperature sensor and VREFINT enable", field.desc
    assert_equal 23, field.bit_offset
    assert_equal 1, field.bit_width
  end

  def test_register
    reg = Register.new @doc.xpath("//peripheral/registers/register").first

    assert_equal "CCR", reg.name
    assert_equal "ADC common control register", reg.desc
    assert_equal "0x20", reg.size
    assert_equal "0x4", reg.address_offset
    assert_equal 6, reg.fields.size
    assert_equal "TSVREFE", reg.fields.first.name
    assert_equal "0x20", reg.size
  end

  def test_peripheral
    per = Peripheral.new @doc.xpath("//peripheral").first
    assert_equal "ADC_Common", per.name
    assert_equal "0x40012300", per.base_address
    assert_equal 5, per.registers.size
  end

  def test_register_dim
    per = Peripheral.new @doc.xpath("//peripheral").first
    assert_equal "ADC_Common", per.name
    assert_equal "0x40012300", per.base_address
    assert_equal 5, per.registers.size

    assert_equal "JOFR1", per.registers[1].name
    assert_equal "JOFR2", per.registers[2].name
    assert_equal "JOFR3", per.registers[3].name
    assert_equal "JOFR4", per.registers[4].name

    assert_equal "0x14", per.registers[1].address_offset
    assert_equal "0x18", per.registers[2].address_offset
    assert_equal "0x1c", per.registers[3].address_offset
    assert_equal "0x20", per.registers[4].address_offset

  end

  def test_register_cluster
    per = Peripheral.new @doc.xpath("//peripheral").select{ |d| d.xpath("name").text == "DMA1" }.first
    assert_equal "DMA1", per.name
    assert_equal "0x40026000", per.base_address
    assert_dma_registers(per)

    per = Peripheral.new @doc.xpath("//peripheral").select{ |d| d.xpath("name").text == "DMA2" }.first
    assert_equal "DMA2", per.name
    assert_equal "0x40026400", per.base_address
  end

  def assert_dma_registers(per)
    assert_equal 1 + 8, per.registers.size
    assert_equal "LISR",  per.registers.first.name # this one is not from cluster

    (1..8).each do |i|
      reg = per.registers[i]
      assert_equal "ST#{i-1}CR",  reg.name
      assert_equal 3, reg.fields.size
      assert_equal "CHSEL", reg.fields.first.name
    end
    assert_equal "0x10", per.registers[1].address_offset
    assert_equal "0x28", per.registers[2].address_offset
    assert_equal "0x40", per.registers[3].address_offset
    assert_equal "stream x configuration register", per.registers[3].desc
  end

  def test_derived_peripheral
    dev = Device.new(@doc)
    assert_equal 4, dev.peripherals.size

    per = dev.peripherals.find{ |p| p.name == "DMA2" }
    assert_equal "DMA2", per.name
    assert_equal "0x40026400", per.base_address
    assert_dma_registers(per)
  end

  def test_derived_register
    dev = Device.new(@doc)
    assert_equal 4, dev.peripherals.size

    per = dev.peripherals.find{ |p| p.name == "RTC" }
    assert_equal 39, per.registers.size
    tr = per.registers.find{ |r|  r.name == "TSTR"}
    assert_equal 7, tr.fields.size
    assert_equal "time stamp time register", tr.desc
    assert_equal "0x30", tr.address_offset
    assert_equal "0x20", tr.size
  end

end
