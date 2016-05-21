This program is supposed to search through a directory looking for files of a specific 
type(extention). For example all .txt files or all .zip files it also has the option of deleting
folders. However you should be careful while deleting folders as this deletes all of their
contents. To tell the program what to look for you need to specify it in the first line of the
settings.cfg file.

What a settings.cfg file should contain:
Extention of file(s) you want to delete(without the period in front) For example to look for .txt files you put txt. This line may also be used to specify folder names if you are trying to delete folders. However do not try to do both at the same time. (first line)
The directory which you would like the computer to search. For example C:/ or F:/ (second line) Note. All the slashes must be foward slashes(/)
Weather or not you want to delete folder that contain what you put on the first line. This line is optional and defaults to no, to change this write in "true" without the quotation marks. (third line) Note: if you dont want to add a third line it is best to leave it as two lines. 

Sample settings.cfg file:
txt
F:/
true

Another possible sample:
tmp
C:/