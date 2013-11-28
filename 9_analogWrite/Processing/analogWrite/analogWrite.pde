//Author: Yasir Ghunaim
//Date: 11/24/2013
//Description: Simulation of a PWM signal and its average
//Usage: drag anywhere to change duty cycle
//       click 'a' to toggle visibility of average plot
//       click 'e' to toggle visibility of average equations
//       click 'r' to reset duty cycle to 50%

float dutyCycle = 0.5, initDutyCycle;
int initMouseX = 0;
boolean hideAverage = false, hideEquation = false;
void setup()
{
   size( 640, 550 );
}

void draw()
{
   PVector origin = new PVector(120,180);
   PVector xAxisScale = new PVector(400,0), xAxis = new PVector(0,0);
   PVector yAxisScale = new PVector(0,-120), yAxis = new PVector(0,0);
   int period = 2; // a period of 2ms
   float yMax = 5, // 5V
         yMin = 0; // 0V
   int yDrawingFactor = 20, xDrawingFactor = yDrawingFactor * 4/period, numberOfPulses = 5;
   
   background(255);
   // set x axis length
   xAxis.add(origin);
   xAxis.add(xAxisScale);  
   // set y axis length to origin
   yAxis.add(origin); 
   yAxis.add(yAxisScale); 
   drawAxis(origin, xAxis, yAxis, xDrawingFactor, yDrawingFactor, "Time (ms)", "Voltage (V)");
   drawPulses(origin, xAxis, period, dutyCycle, yMax, xDrawingFactor, yDrawingFactor, numberOfPulses);
   fill(255,0,0);
   text("Duty Cycle = " + dutyCycle*100 + "%", 50, 30);  
   
   //draw average plot
   origin.y += 250;
   // set x axis length
   xAxis.set(0,0);
   xAxis.add(origin);
   xAxis.add(xAxisScale);  
   // set y axis length to origin
   yAxis.set(0,0);
   yAxis.add(origin); 
   yAxis.add(yAxisScale);  
   if(!hideAverage){
     drawAxis(origin, xAxis, yAxis, xDrawingFactor, yDrawingFactor, "Time (ms)", "Average Voltage (V)");
     drawAverage(origin, xAxis, dutyCycle, yMin, yMax, yDrawingFactor);
   }
   if(!hideEquation){
     float average = yMax*dutyCycle - yMin*(1-dutyCycle);
     fill(0);
     text("Average = DutyCycle * Vmax + (1-DutyCycle) * Vmin", 50, yAxis.y-48);
     text("Average =         " + nf(dutyCycle, 1, 3) + "  *  " + (int)yMax, 50, yAxis.y-30);   
     fill(180);
     text("+          (1-" + nf(dutyCycle, 1, 3) +") * " + (int)yMin, 203, yAxis.y-30);  
     fill(0);
     text(" = " + nf(average, 1, 2)+"V", 320, yAxis.y-30);   
   }
}

void drawAxis(PVector origin, PVector xAxis, PVector yAxis, int xDrawingFactor, int yDrawingFactor, String xLabel, String yLabel){
  int lengthOfMark = 5;
  // draw x axis
  line(origin.x, origin.y, xAxis.x, xAxis.y);
  // draw y axis
  line(origin.x, origin.y, yAxis.x, yAxis.y);
  
  //draw x marks and its values
  for(int i=0; i< (xAxis.x-origin.x)/xDrawingFactor; i++){
    //draw x axis marks
    line(origin.x + i*xDrawingFactor, origin.y + lengthOfMark, origin.x + i*xDrawingFactor, origin.y);
    fill(50);
    //label x axis marks
    if(i%2 == 0){ // print value for only even values 
      if(i<=9)
        text(""+i, origin.x + i*xDrawingFactor - 2, origin.y + 3.5*lengthOfMark);
      else //values bigger than 9 needs to be shifted a bit to left
        text(""+i, origin.x + i*xDrawingFactor - 5, origin.y + 3.5*lengthOfMark);
      
    }
  }
  text(xLabel, origin.x + (xAxis.x-origin.x)/2 - yDrawingFactor, origin.y + 7*lengthOfMark);
  
   //draw y marks and its values
  for(int i=0; i< (origin.y-yAxis.y)/yDrawingFactor; i++){
    //draw x axis marks
    line(origin.x - lengthOfMark, origin.y - i*yDrawingFactor, origin.x, origin.y - i*yDrawingFactor);
    fill(50);
    //label x axis marks
    if(i<=9)
      text(""+i, origin.x  - 3.5*lengthOfMark, origin.y - i*yDrawingFactor + 2);
    else //values bigger than 9 needs to be shifted a bit to right
      text(""+i, origin.x  - 3.5*lengthOfMark, origin.y - i*yDrawingFactor + 5);    
  }
  pushMatrix();
  translate(origin.x - 6*lengthOfMark, origin.y - (origin.y-yAxis.y)/2 + 1.8*yDrawingFactor);
  rotate(3*PI/2);
  text(yLabel, 0,0);
  popMatrix();
}

void drawAverage(PVector origin, PVector xAxis, float dutyCycle, float yMin, float yMax, int yDrawingFactor){ 
  float average = yMax*dutyCycle - yMin*(1-dutyCycle);
  line(origin.x, origin.y - average*yDrawingFactor, xAxis.x, origin.y - average*yDrawingFactor);
}


void drawPulses(PVector origin, PVector xAxis, float period, float dutyCycle, float yMax, int xDrawingFactor, int yDrawingFactor, int numberOfPulses){ 
  if(dutyCycle == 0) return; 
  fill(255);
  pushMatrix();
  if(dutyCycle == 1){
    line(origin.x, origin.y - yMax*yDrawingFactor, xAxis.x, origin.y - yMax*yDrawingFactor);
  }
  else{
    for(int i=0; i<numberOfPulses; i++){
       rect(origin.x, origin.y, dutyCycle*period*xDrawingFactor, -yMax*yDrawingFactor); // draw a pulse 
       translate(period*xDrawingFactor, 0);
     } 
  }
  popMatrix();
  fill(0);
}

  
void mousePressed() {
  initMouseX = mouseX;
  initDutyCycle = dutyCycle;
}

void mouseDragged() 
{
  float dispAmount;
  dispAmount = (mouseX - initMouseX)/((float)(width/2)); // measure the percentage of x displacement 
  dutyCycle = initDutyCycle + dispAmount;
  if(dutyCycle<0)        dutyCycle = 0;
  else if(dutyCycle>1)   dutyCycle = 1;
}

void keyPressed(){
   if(key == 'a') hideAverage = hideAverage?false:true; // toggle hide average
   else if(key == 'e') hideEquation = hideEquation?false:true; // toggle hide equation
   else if(key == 'r') dutyCycle = 0.5;
}
