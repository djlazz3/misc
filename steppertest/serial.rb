require 'rubyserial'
require 'io/console'
baud_rate = 9600
port_file = "COM4"

port = Serial.new port_file, baud_rate

# read a character without pressing enter and without printing to the screen
def read_char
  begin
    # save previous state of stty
    old_state = `stty -g`
    # disable echoing and enable raw (not having to press enter)
    system "stty raw -echo"
    c = STDIN.getc.chr
    # gather next two characters of special keys
    if(c=="\e")
      extra_thread = Thread.new{
        c = c + STDIN.getc.chr
        c = c + STDIN.getc.chr
      }
      # wait just long enough for special keys to get swallowed
      extra_thread.join(0.00001)
      # kill thread so not-so-long special keys don't wait on getc
      extra_thread.kill
    end
  rescue => ex
    puts "#{ex.class}: #{ex.message}"
    puts ex.backtrace
  ensure
    # restore previous state of stty
    system "stty #{old_state}"
  end
  return c
end

while 1 == 1
input = read_char
    case input
    when "w"
        sleep(1)
        port.write("up")
        puts "Going up"
    when "s"
        sleep(1)
        port.write("down")
        puts "Going Down"
    when "d"
        sleep(1)
        port.write("right")
        puts "Turning Right"
    when "a"
        sleep(1)
        port.write("left")
        puts "Turning Left"
    end
end
