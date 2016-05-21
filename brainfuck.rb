require 'csv'
x = 0
current_cell = 0
arr = {}
file = {}
loopPoint = 0
ignore = false
puts("Drag and drop your brainfuck file to the console and press enter")
puts("Remember to remove the semicolons around the file path")
filepath = gets.chomp
bfF = File.open(filepath, "r")
while(line = bfF.gets)
   line.split(%r{\s*}).each do |y| 
   arr[x] = y
   end
   x += 1
end
x = 0
bfF.close()
csv = CSV.open("output.csv", "wb")
arr.each do |z|
     case z
       when ">"
         if ignore == false
         current_cell += 1
         end
       when "<"
         if ignore == false
         current_cell -= 1
         end
       when "+"
         if ignore == false
           if file[current_cell] == nil || file[current_cell] == 0
             file[current_cell] = 1
           else
             file[current_cell] += 1
           end
         end
       when "-"
         if ignore == false
           if file[current_cell] == nil || file[current_cell] == 0
             file[current_cell] = -1
           else
             file[current_cell] -= 1
           end
         end
       when "."
         if ignore == false
           puts file[current_cell]
         end
       when ","
         if ignore == false
           gets file[current_cell]
         end
       when "["
         if file[current_cell] == 0
           ignore = true
         else
           loopPoint = x + 1
         end
       when "]"
         if file[current_cell] != 0
          until file[x] == 0
           cmd = arr[loopPoint]
           case cmd
             when ">"
                 current_cell += 1
             when "<"
                 current_cell -= 1
             when "+"
                 if file[current_cell] == nil || file[current_cell] == 0
                   file[current_cell] = 1
                 else
                   file[current_cell] += 1
                 end
             when "-"
                 if file[current_cell] == nil || file[current_cell] == 0
                   file[current_cell] = -1
                 else
                   file[current_cell] -= 1
                 end
             when "."
                 puts file[current_cell]

             when ","
                 gets file[current_cell]
           end
            loopPoint += 1
          end
         elsif ignore == true
           ignore = false
         end
     x += 1
     end
end
csv << (file.to_a)
csv.close()
