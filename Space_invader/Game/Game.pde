 import java.util.Vector;


Galaxy stars;
PImage ship;


void setup(){
  size(1400,1000);
  
  stars = new Galaxy(100,5);
  ship = loadImage("images/ship/falcon.png");
  
  
  
}

void draw(){
  background(0);
  
  
  stars.move();
  
  image(ship,0,0);
}
