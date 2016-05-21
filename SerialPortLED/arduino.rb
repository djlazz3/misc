require 'rubyserial'
baud_rate = 9600
port_file = "COM4"

port = Serial.new port_file, baud_rate

#for an infinite amount of time
while 1 == 1
input = gets.chomp
if input == "cls"
system 'cls'
else
  port.write "#{input}"
end
end