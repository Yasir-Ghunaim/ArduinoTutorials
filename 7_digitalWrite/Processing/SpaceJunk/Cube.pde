
class Cube {

  // Properties
  int w, h, d;
  int shiftX, shiftY, shiftZ;

  // Constructor
  Cube(int w, int h, int d, int shiftX, int shiftY, int shiftZ){
    this.w = w;
    this.h = h;
    this.d = d;
    this.shiftX = shiftX;
    this.shiftY = shiftY;
    this.shiftZ = shiftZ;
  }

  // Main cube drawing method, which looks 
  // more confusing than it really is. It's 
  // just a bunch of rectangles drawn for 
  // each cube face
  void drawCube(int switchState){
    int tempShiftX = shiftX, tempShiftY = shiftY, tempShiftZ = shiftZ;
    if(switchState == 48){
      tempShiftX = shiftX/3;
      tempShiftY = shiftY/3;
      tempShiftZ = shiftZ/3;
    }
    
    beginShape(QUADS);
    // Front face
    vertex(-w/2 + tempShiftX, -h/2 + tempShiftY, -d/2 + tempShiftZ); 
    vertex(w + tempShiftX, -h/2 + tempShiftY, -d/2 + tempShiftZ); 
    vertex(w + tempShiftX, h + tempShiftY, -d/2 + tempShiftZ); 
    vertex(-w/2 + tempShiftX, h + tempShiftY, -d/2 + tempShiftZ); 

    // Back face
    vertex(-w/2 + tempShiftX, -h/2 + tempShiftY, d + tempShiftZ); 
    vertex(w + tempShiftX, -h/2 + tempShiftY, d + tempShiftZ); 
    vertex(w + tempShiftX, h + tempShiftY, d + tempShiftZ); 
    vertex(-w/2 + tempShiftX, h + tempShiftY, d + tempShiftZ);

    // Left face
    vertex(-w/2 + tempShiftX, -h/2 + tempShiftY, -d/2 + tempShiftZ); 
    vertex(-w/2 + tempShiftX, -h/2 + tempShiftY, d + tempShiftZ); 
    vertex(-w/2 + tempShiftX, h + tempShiftY, d + tempShiftZ); 
    vertex(-w/2 + tempShiftX, h + tempShiftY, -d/2 + tempShiftZ); 

    // Right face
    vertex(w + tempShiftX, -h/2 + tempShiftY, -d/2 + tempShiftZ); 
    vertex(w + tempShiftX, -h/2 + tempShiftY, d + tempShiftZ); 
    vertex(w + tempShiftX, h + tempShiftY, d + tempShiftZ); 
    vertex(w + tempShiftX, h + tempShiftY, -d/2 + tempShiftZ); 

    // Top face
    vertex(-w/2 + tempShiftX, -h/2 + tempShiftY, -d/2 + tempShiftZ); 
    vertex(w + tempShiftX, -h/2 + tempShiftY, -d/2 + tempShiftZ); 
    vertex(w + tempShiftX, -h/2 + tempShiftY, d + tempShiftZ); 
    vertex(-w/2 + tempShiftX, -h/2 + tempShiftY, d + tempShiftZ); 

    // Bottom face
    vertex(-w/2 + tempShiftX, h + tempShiftY, -d/2 + tempShiftZ); 
    vertex(w + tempShiftX, h + tempShiftY, -d/2 + tempShiftZ); 
    vertex(w + tempShiftX, h + tempShiftY, d + tempShiftZ); 
    vertex(-w/2 + tempShiftX, h + tempShiftY, d + tempShiftZ); 

    endShape(); 

    // Add some rotation to each box for pizazz.
    rotateY(radians(1));
    rotateX(radians(1));
    rotateZ(radians(1));
  }
}
