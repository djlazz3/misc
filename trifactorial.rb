max = 0
def cubert(max)
	return max**(1.0/3.0)
end
def trifactorial(max)
	puts cubert(max)
	if cubert(max).to_i.to_f == cubert(max)
		
		puts cubert(max).to_i
		return cubert(max).to_i
	else
		puts cubert(max).to_i + 1
		return cubert(max).to_i + 1
	end
end

puts "What is the limit for the function?"
max = gets.chomp.to_i
puts trifactorial(max)