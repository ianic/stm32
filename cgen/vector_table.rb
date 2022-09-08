#!/usr/bin/env ruby

require 'erb'
require 'json'
require 'nokogiri'

if ARGV[0].nil?
	print "Usage: vector_table.rb [chip-name]\n"
	exit 1
end

def read_data(chip)
	filename = "data/STM32F#{chip.upcase}.json"
	file = File.read(filename)

	data = JSON.parse(file, object_class: OpenStruct)
	interrupts = data.cores[0].interrupts

    filename = "data/STM32F#{chip[0..2].upcase}.svd"
    doc = File.open(filename) { |f| Nokogiri::XML(f) }
    descriptions = {}
    for i in doc.xpath("//interrupt") do
        name = i.xpath("name").text
        desc = i.xpath("description").text.delete("\n").squeeze(" ")
        val = i.xpath("value").text.to_i
        descriptions[val] = {"desc" => desc, "name" => name}
    end

	return interrupts, descriptions
end

interrupts, descriptions = read_data(ARGV[0])

j = 0
data = []
for i in interrupts do
  if i.number != j
    spec = OpenStruct.new
    spec.name = "reserved_#{j}_#{i.number-1}"
    spec.padding = i.number - j
    data << spec
  end
  spec = OpenStruct.new
  spec.name = i.name
  spec.number = i.number
  spec.desc = descriptions[i.number] ? descriptions[i.number]["desc"] : ""
  data << spec
  j = i.number+1
end

def generate(data)
  tmpl = <<-EOF

// this file was generated by cgen/vector_table.rb
pub const VectorTable = extern struct {
    // zig fmt: off
    initial_stack_pointer: u32,
    // Cortex-M4 Processor Exceptions
    Reset               : InterruptVector = unhandled,
    NMI                 : InterruptVector = unhandled, // -14 Non Maskable Interrupt
    HardFault           : InterruptVector = unhandled, // -13 All class of fault
    MemManage           : InterruptVector = unhandled, // -12 Memory Management Interrupt
    BusFault            : InterruptVector = unhandled, // -11 Bus Fault Interrupt
    UsageFault          : InterruptVector = unhandled, // -10 Usage Fault Interrupt
    reserved0           : [4]u32 = undefined,
    SVCall              : InterruptVector = unhandled, // -5  SV Call Interrupt
    DebugMonitor        : InterruptVector = unhandled, // -4  Pend SV Interrupt
    reserved1           : [1]u32 = undefined,
    PendSV              : InterruptVector = unhandled, // -2  Pend SV Interrupt
    SysTick             : InterruptVector = unhandled, // -1  System Tick Interrupt
    // STM32 specific Interrupts
    <%- for i in data -%>
    <%- if i.padding -%>
    <%= i.name.ljust(20) %>: [<%= i.padding %>]u32 = undefined,
    <%- else -%>
    <%= i.name.ljust(20) %>: InterruptVector = unhandled, // <%= i.number.to_s.ljust(2) %>  <%= i.desc %>
    <%- end -%>
    <%- end -%>
    // zig fmt: on
};

pub const InterruptVector = extern union {
    C: fn () callconv(.C) void,
    Naked: fn () callconv(.Naked) void,
    // Interrupt is not supported on arm
};

const unhandled = InterruptVector{
    .C = struct {
        fn tmp() callconv(.C) noreturn {
            @panic("unhandled interrupt");
        }
    }.tmp,
};

  EOF
  puts ERB.new(tmpl, trim_mode: '-').result(binding)
end

generate data


# #pp doc.xpath("//peripherals/peripheral")[0].name

# pp doc.cpu.name.content


# doc = Nokogiri::Slop <<-EOXML
# <employees>
#   <employee status="active">
#     <fullname>Dean Martin</fullname>
#   </employee>
#   <employee status="inactive">
#     <fullname>Jerry Lewis</fullname>
#   </employee>
# </employees>
# EOXML

# pp doc.employees.employee.last.fullname.content
