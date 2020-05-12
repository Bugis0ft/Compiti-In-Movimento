 import java.util.Vector;
 import processing.video.*;

Galaxy stars;
PImage ship;
AsteroidsRain heavyRain;
//Capture webcam;


void setup(){
  size(1400,1000);
  noCursor();
  
  //printArray(Capture.list());
  //webcam = new Capture(this, Capture.list()[1]);
  //webcam.start();
  
  stars = new Galaxy(100,5);
  ship = loadImage("images/ship/possente.png");
  heavyRain = new AsteroidsRain();
}

void draw(){
  background(0);
  //if(webcam.available()){
  //  webcam.read(); 
  //}
  
  
  
  
  //image(webcam,0,0,1400,1000);
  stars.move();
  image(ship,mouseX,780);
  heavyRain.fall();
}
