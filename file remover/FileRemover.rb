require 'fileutils'
num = 0
lines = {}
File.open("settings.cfg").each do |line|
lines[num] = line
num += 1
end
z = lines[0].chomp
y = lines[1].chomp
delfolders = lines[2]
x = Dir["#{y}/**/*.#{z}"]
folders = Dir["#{y}/**/"]
x.each do |file|
    File.delete(file)
end
if delfolders == "true"
folders.each do |folder|
if folder.include?(z)
    FileUtils.rm_rf(folder)
end
end
puts "succefully deleted all .#{z} files and folders containing #{z}."
else
puts "succefully deleted all .#{z} files."
end