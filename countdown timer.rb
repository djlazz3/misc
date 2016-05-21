time_final = Time.new(2016, 2, 24, 15, 0, 0, "+05:00")
while(true)
time_initial = Time.now
day_difference = time_final.day - time_initial.day
hour_difference = time_final.hour - time_initial.hour
minute_difference = time_final.min - time_initial.min
second_difference = time_final.sec - time_initial.sec
if hour_difference <= 0
	day_difference -= 1
	hour_difference += 24
end
if minute_difference <= 0
	hour_difference -= 1
	minute_difference += 60
end
if second_difference <= 0
	minute_difference -= 1
	second_difference += 60
end
else

end
puts day_difference.to_s.rjust(2,"0") + ":" + hour_difference.to_s.rjust(2,"0") + ":" + minute_difference.to_s.rjust(2, "0") + ":" + second_difference.to_s.rjust(2 , "0")
sleep(12.0/24.0)
system('cls')
end
