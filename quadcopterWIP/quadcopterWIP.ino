#include <NewPing.h>
NewPing sonar(12, 11, 93);
void setup() {
  Serial.begin(9600);
  pinMode(8, OUTPUT);
}

void loop() {
  delay(50);
  int uS = sonar.ping();
  int distance = uS / US_ROUNDTRIP_CM;
  if ( distance == 0 || distance > 62){
  digitalWrite(8, LOW);
  }
  else{
  digitalWrite(8, HIGH);
  }
  Serial.print("Ping: ");
  Serial.print(distance);
  Serial.println("cm");
}
