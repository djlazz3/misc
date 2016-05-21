while 1 == 1
val = ""
input = ""
puts "Are you going to give me a percent or sample"
input = gets.chomp.downcase
if input == "cls"
system('cls')
elsif input != "percent" && input != "sample"
system('cls')
else
puts "Ok give me the value"
val = gets.chomp.to_f
if input == "percent"
n = ((100/val)**2).to_f
puts n
elsif input == "sample"
p = 100.to_f/Math.sqrt(val).to_f
puts p
end
end
end