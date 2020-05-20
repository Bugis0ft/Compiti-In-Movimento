import java.util.Vector;
import processing.sound.*;

  // Declare variable "a" of type PImage
PImage sfondo;
SoundFile music;
Rick rick;
Basi paddles;
Mostri mostri;
void setup() {
  size(1280, 720);
  // The image file must be in the data folder of the current sketch 
  // to load successfully
  sfondo = loadImage("sfondo.jpg");  // Load the image into the program  
  paddles= new Basi();
  rick=new Rick();
  mostri=new Mostri();
  music = new SoundFile(this, "sigla.mp3");
  music.amp(0.1);  //setting volume
  music.loop();
  noCursor();
}

void draw() {
  // Displays the image at its actual size at point (0,0)
  
  // Displays the image at point (0, height/2) at half of its size
  image(sfondo, 0, 0, width, height);
  paddles.show();
  rick.show();
  mostri.show();
  mostri.fall();
  text(rick.getY(),5,40);
  textSize(40);
  rick.jump();
}
