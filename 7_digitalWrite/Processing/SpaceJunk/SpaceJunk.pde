/**
 * Space Junk  
 * by Ira Greenberg (zoom suggestion by Danny Greenberg).
 * 
 * Rotating cubes in space using a custom Cube class. 
 * Color controlled by light sources. Move the mouse left
 * and right to zoom.
 */
 
import processing.serial.*;
Serial myPort;  

// Used for oveall rotation
float ang;

// Cube count-lower/raise to test performance
int limit = 500;
int switchState = 1;
// Array for all cubes
Cube[]cubes = new Cube[limit];

void setup() {
  size(640, 360, P3D); 
  background(0); 
  noStroke();
  
  println(Serial.list()); // use this to find Arduino COM in the list()[]
  myPort = new Serial(this, Serial.list()[0], 9600);

  // Instantiate cubes, passing in random vals for size and postion
  for (int i = 0; i< cubes.length; i++){
    cubes[i] = new Cube(int(random(-10, 10)), int(random(-10, 10)), 
                        int(random(-10, 10)), int(random(-140, 140)), 
                        int(random(-140, 140)), int(random(-140, 140)));
  }
}

void draw(){
  background(0); 
  fill(200);

  // Set up some different colored lights
  pointLight(51, 102, 255, 65, 60, 100); 
  pointLight(200, 40, 60, -65, -60, -150);

  // Raise overall light in scene 
  ambientLight(70, 70, 10); 

  // Center geometry in display windwow.
  // you can change 3rd argument ('0')
  // to move block group closer(+)/further(-)
  translate(width/2, height/2, -200 + mouseX * 0.65);

  // Rotate around y and x axes
  rotateY(radians(ang));
  rotateX(radians(ang));

  
  // Draw cubes
  for (int i = 0; i < cubes.length; i++){
    if ( myPort.available() > 0)  // If data is available,
      switchState = myPort.last();         // read it and store it in val
  
    cubes[i].drawCube(switchState);
  }
  
  // Used in rotate function calls above
  ang += 0.2;
}


