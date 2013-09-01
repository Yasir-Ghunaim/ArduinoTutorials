void setup(){
  pinMode(2, INPUT);
  pinMode(13,OUTPUT);
  Serial.begin(9600);
}

void loop(){
  int switchValue = digitalRead(2);
  Serial.print(switchValue);
  if(switchValue == 0)
    digitalWrite(13,LOW);
  else
    digitalWrite(13,HIGH);
}
