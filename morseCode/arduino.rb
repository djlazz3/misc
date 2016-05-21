require 'rubyserial'
baud_rate = 9600
port_file = "COM4"

port = Serial.new port_file, baud_rate

morsecode = ""
def convert(x)
    equivalent = {"a" => ".-","b" => "-...","c" => "-.-.","d" => "-..","e" => ".","f" => "..-.","g" => "--.","h" => "....","i" => "..",
        "j" => ".---","k" => "-.-","l" => ".-..","m" => "--","n" => "-.","o" => "---","p" => ".--.","q" => "--.-","r" => ".-.","s" => "...",
        "t" => "-","u" => "..-","v" => "...-","w" => ".--","x" => "-..-","y" => "-.--","z" => "--.."," " => ";", "1" => ".----", "2" => "..---",
         "3" => "...--", "4" => "....-", "5" => ".....", "6" => "-....", "7" => "--...", "8" => "---..", "9" => "----.", "0" => "-----",
          "." => "..--..", "," => ".-.-", ";" => ".-.-.", '"' => ".-.-.-.-", "(" => "---.", ")" => "---.", "?" => "-..-.", "/" => "-..-.", "@" => ".--.-."}
    if x == " "
        return equivalent[x]
    else
        return equivalent[x] + ":"
    end
end

while 1 == 1
    input = gets.chomp.downcase
        if input == "cls"
            system 'cls'
        elsif input != nil
            input = input.split("")
            input.each do |letter|
                port.write(convert(letter))
		sleep(1.0/1000000.0)
                morsecode = morsecode + convert(letter)
            end
            puts "The morsecode for #{input.join("").upcase} is #{morsecode.gsub(':', ' ').gsub(';','')}"
            morsecode = ""
    end

end
