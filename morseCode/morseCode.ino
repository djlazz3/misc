void setup() {
  Serial.begin(9600);
  pinMode(11, OUTPUT);
  analogWrite(11, 0);
}
void dot() {
  analogWrite(11, 220);
  delay(100);
  analogWrite(11, 0);
}
void dash() {
  analogWrite(11, 220);
  delay(300);
  analogWrite(11, 0);
}
void neither(String y) {
  if (y == "letter") {
    delay(300);
  }
  else if (y == "word") {
    delay(700);
  }
}
void got_char(String x) {
  if (x == ".") {
    dot();
    delay(100);
  }
  else if (x == "-") {
    dash();
    delay(100);
  }
  else if (x == ":") {
    neither("letter");
  }
  else if (x == ";") {
    neither("word");
  }
  else {
  }
}

void loop() {
  if (Serial.available() > 0) {
    String byte_read = Serial.readString();
    for (int i = 0; i < strlen(byte_read.c_str()); i++) {
      char letter = byte_read[i];
      got_char((String)letter);
    }
  }
}
