void setup() {
  Serial.begin(9600);
  //Set pin 11 to be output pin (connect LED here)
  pinMode(13, OUTPUT);
 
  //set pin 11 to be high initially; LED is usually on, but, not blinking
  digitalWrite(13, LOW);
}
 
//this procedure is called if we need to blink the LED
void blink_led(int x) {
 
  //we can't just blink it once, because that wouldn't be noticeable
  //so, we blink it three times
  while (x > 0)
  {
    x = x - 1;
    digitalWrite(13, HIGH);
    delay(200);
    digitalWrite(13, LOW);
    delay(200);  
  }
}
void party(){
 digitalWrite(13, HIGH);
 delay(50);
 digitalWrite(13, LOW);
 delay(50);
 digitalWrite(13, HIGH);
 delay(50);
 digitalWrite(13, HIGH);
 delay(50);
 digitalWrite(13, LOW);
 delay(50);
 digitalWrite(13, HIGH);
 delay(50);
 digitalWrite(13, HIGH);
 delay(50);
 digitalWrite(13, LOW);
 
}

void got_char(String x) {
 int t = 0;
  //if we get b over Serial
  if(x == "blink") {
    blink_led(1);
  }
    else if (x == "on")
  {
    digitalWrite(13, HIGH);
  }
    else if (x == "off")
  {
    digitalWrite(13, LOW);
  }
  else if(x == "party")
  {
    party();
  }
  else if(x == "fade")
  {
    t = 255;
    while(t > 0)
  {
   analogWrite(13, t);
   t = t - 1;
   delay(50);
  }
  }
    else
  {
    blink_led(3);
  }
}
 
void loop() {
  if(Serial.available() > 0) {
    String byte_read = Serial.readString();
     got_char((String)byte_read);
  }
}
