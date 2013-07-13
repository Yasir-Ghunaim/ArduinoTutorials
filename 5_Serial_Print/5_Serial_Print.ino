int x;

void setup(){
  Serial.begin(9600);
  Serial.println("Hello");
  x = 0;
}

void loop(){
  x++;
  delay(500);
  Serial.println(x);
}
