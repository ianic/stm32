#!/usr/bin/env ruby
require 'erb'
require 'nokogiri'
dir = File.dirname(__FILE__)
require "#{dir}/common.rb"
require "#{dir}/svd_parser.rb"

if ARGV[0].nil?
  print "Usage: #{__FILE__} [chip-name]\n"
  exit 1
end

def open_doc(chip)
  filename = "svd/stm32f#{chip[0..2]}.svd"
  @doc = File.open(filename) { |f| Nokogiri::XML(f) }
end

device = Device.new(open_doc(ARGV[0])) # used in template binding
device.calc_enum_redirect_to

puts "// this file was generated by cgen/#{File.basename(__FILE__)}"
puts ERB.new(File.read('registers.erb'), trim_mode: '-').result(binding)
puts File.read('data/registers_with_enums_footer.zig')
