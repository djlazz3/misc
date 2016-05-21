def fibo_iter(loc)
  var1 = 0
  var2 = 1
  var3 = 1
if loc == 2
  return 1
elsif loc <= 2
  return loc
else
  for i in 1...loc
    var3 = var1 + var2
    var1 = var2
    var2 = var3
  end
  end
  return var3
end
while true
system("cls")
x = gets.chomp
puts fibo_iter(x.to_i)
z = gets.chomp
end