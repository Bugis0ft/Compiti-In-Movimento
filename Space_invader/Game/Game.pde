 import java.util.Vector;
 import processing.video.*;
 import processing.sound.*;

Galaxy stars;
AlienAttack aliens;
Ship ship;
SoundFile music;
AsteroidsRain heavyRain;

 static boolean dead = false;

void setup(){
  size(displayWidth,displayHeight);
  noCursor();
  
  stars = new Galaxy(100,5);
  ship = new Ship();
  music = new SoundFile(this, "sounds/megalovania.mp3");
  music.amp(0.01);  //setting volume
  music.loop();
  heavyRain = new AsteroidsRain();

  aliens = new AlienAttack();
  aliens.addAlien(1);
}

void draw(){
  if(!dead){
    background(0);
  
    stars.move();
    
    ship.show();
    
    heavyRain.fall();
    
    aliens.attack();
  }
  
}
