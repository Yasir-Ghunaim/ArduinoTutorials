void setup(){
 pinMode(11,OUTPUT);
 Serial.begin(9600);
}

void loop(){
 if(Serial.available()){
   int value = Serial.read();
   analogWrite(11, value);
 }
}
