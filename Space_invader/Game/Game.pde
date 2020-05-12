 import java.util.Vector;


Galaxy stars;
PImage ship;
AsteroidsRain heavyRain;


void setup(){
  size(1400,1000);
  
  stars = new Galaxy(100,5);
  ship = loadImage("images/ship/possente.png");
  heavyRain = new AsteroidsRain();
}

void draw(){
  background(0);
  
  
  stars.move();
  
  image(ship,mouseX,780);
  heavyRain.fall();
}
