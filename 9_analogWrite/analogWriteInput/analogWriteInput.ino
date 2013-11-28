void setup(){
 pinMode(11,OUTPUT);
 pinMode(A0,INPUT);
}

void loop(){
 int value = analogRead(A0); // 0 - 1023
 analogWrite(11, value); // 0 - 255
}
