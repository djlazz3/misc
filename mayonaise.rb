puts "Write a question relating two entities using is."
puts "Exaple: Is this like this? or is chocolate green?."
x = gets.chomp.downcase.split(" ")
x.delete("a")
y = x.index("is")
x[y + 1] = "mayonaise"
puts x.join(" ").capitalize + "?"
