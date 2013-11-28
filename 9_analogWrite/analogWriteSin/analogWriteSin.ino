int t = 0;
void setup(){
 pinMode(11,OUTPUT); 
}

void loop(){
  analogWrite(11, (int)((sin(2*3.14*t) + 1)/2*255));
  t++;
  delay(3);
}
