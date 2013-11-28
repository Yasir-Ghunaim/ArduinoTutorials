int analogValue = 0;
void setup(){
 pinMode(11,OUTPUT); 
}

void loop(){
  analogWrite(11, analogValue);
  analogValue++;
  if(analogValue > 255) analogValue = 0;
  delay(10);
}
