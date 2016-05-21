motorType = "tmotorVex393HighSpeed_"
groups = []
button = ""
control = []
buttonif = "if(vexRT[Btn#{button}] == 1){"
puts "What is the name of the robot program?"
filename = gets.chomp
system('cls')
f = File.new(filename + ".c", "w")
puts "What ports do you have motors on?"
ports = gets.chomp.split(" ")
system('cls')
ports.each do |port|
	puts "What motor is on port #{port}"
	description = gets.chomp
	if port == 1 || port == 10
		motorType += "HBridge"
	else
		motorType += "MC29"
	end
	puts "Is motor reversed? (y/n)"
	reversed = gets.chomp
	cfg = "#pragma config(Motor, port#{port}, #{description}, #{motorType}, openLoop"
	if reversed == "y"
		cfg += ", reversed)"
	else
		cfg += ")"
	end
	f.puts(cfg)
	motorType = "tmotorVex393HighSpeed_"
	system('cls')
end
f.puts("")
f.puts("task main(){")
f.puts("while(true){")
puts "What buttons will you be using"
buttons = gets.chomp.split(" ")
buttons.each do |button|
	puts "what is Btn#{button} used for"
	group = gets.chomp
	if group == groups.pop
		f.puts ("else " + buttonif)
	else
		groups << group
		if groups.count() >= 1
			f.puts("else{")
			control.each do |motor|
			f.puts ("motor[port#{motor}] = 0;")
			end
			f.puts("}")
		end
		f.puts (buttonif)
	end
	puts "What motor/s does Btn#{button} control?"
	control = gets.chomp.split(" ")
	puts "What speed do these motors need to go at? (-127..127)"
	speed = gets.chomp
	control.each do |motor|
		f.puts ("motor[port#{motor}] = #{speed};")
	end
	f.puts("}")
end
f.puts("}")
f.puts("}")
