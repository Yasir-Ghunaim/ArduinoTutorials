void setup(){
  Serial.begin(9600);
}

void loop(){
  int pValue = analogRead(A0);
  Serial.println(pValue); 
}
