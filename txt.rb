require 'literate_randomizer'
x = 0
while 1 == 1
z = File.new "#{x}.txt","w"
z.print LiterateRandomizer.sentence
x += 1
z.close()
puts x
end
