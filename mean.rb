system("cls")
while(1 == 1)
puts "Print the values of the data set."
values1 = []
values2 = []
values3 = []
x = 0
mean = 0
mad = 0
stat = 0
count = 0
while (x != "")
x = gets.chomp
	if x == "del"
		values1.pop
		system("cls")
		puts values1
		count -= 1
		x = 0
	else
		values1.push(x.to_f)
		count += 1
	end
end
count -= 1
values1.pop
system("cls")
puts values1
puts ""
values1.each do |x|
	mean += x
end
mean = mean.to_f/count
puts "Mean: #{mean}"
puts ""
values1.each do |x|
	values2.push((x - mean).abs.to_f)
end
values2.each do |x|
	mad += x
end
puts values2
puts ""
mad = mad/count
puts "Mean Absolute Value: #{mad}"
puts ""
values2.each do |x|
values3.push(x ** 2)	
end
puts values3
puts ""
values3.each do |x|
stat += x
end
stat = Math.sqrt(stat/count)
puts "Standard Deviation: #{stat}"
y = gets.chomp
system("cls")
if y == "end"
abort()
end
end