puts "gimme a sentence"
x = gets.chomp
puts "how many times do you want me to randomize it"
t = gets.chomp.to_i
y = 0
c = 0
h = {}
a = []
a2 = []
x = x.split(" ")
max = x.length
x.each do |z|
h[y] = z
y += 1
end
while t > 0
while c < max
r = rand(max)
a2 << h[r]
if (a & a2).length == a2.length
else
a << h[r]
end
a.each do |v|
print v +" "
end
puts ""
c += 1
end
t -= 1
end
