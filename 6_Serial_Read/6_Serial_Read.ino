void setup(){
  Serial.begin(9600);
  pinMode(13,OUTPUT);
}

void loop(){
  if(Serial.available() > 0){
    char readChar = Serial.read();
    Serial.print("Arduino says: ");
    Serial.println(readChar);
    
    if(readChar == 'n'){//on
      digitalWrite(13, HIGH); 
      Serial.println("LED is on");
    }
    else if(readChar == 'f'){//off
      digitalWrite(13,LOW);
      Serial.println("LED is off");
    }
  }
  
}
