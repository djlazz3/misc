#include <Stepper.h>
Stepper motor = Stepper(100, 8,9,10,11);
void setup() {
  Serial.begin(9600);
  motor.setSpeed(30);
  pinMode(7, OUTPUT);
  pinMode(6, OUTPUT);
}
void left(){
motor.step(13);
Serial.write("left");
}
void right(){
motor.step(-13);
}
void up(){
digitalWrite(7 , HIGH);
digitalWrite(6 , LOW);
}
void down(){
digitalWrite(6 , HIGH);
digitalWrite(7 , LOW);
}
void got_char(String x){
 if(x == "up"){
 up();
 }
 else if(x == "down"){
 down();
 }
 else if(x == "left"){
 left();
 }
 else if(x == "right"){
 right();
 }
}
void loop() {
  if(Serial.available() > 0) {
    String byte_read = Serial.readString();
     got_char((String)byte_read);
  }
}
