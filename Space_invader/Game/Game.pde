import java.util.Vector;
import processing.video.*;
import processing.sound.*;
import java.net.*;
import java.io.*;

PFont font_scoreboard;
static Points score;

Galaxy stars;
AlienAttack aliens;
Ship ship;
SoundFile music;
AsteroidsRain heavyRain;

static boolean dead = false;
static int killed = 0;
int s = 0;
int s2 = 0;
int f = 0;

DatagramSocket socket;
DatagramPacket packet;

static float nose_x;
float diam = 40;
float rectSize = 200;

byte[] buf = new byte[24]; //Set your buffer size as desired

void setup(){
  //connection to the sokcet
  try {
    socket = new DatagramSocket(4124); // Set your port here
  }
  catch (Exception e) {
    e.printStackTrace(); 
    println(e.getMessage());
  }
  size(displayWidth,displayHeight);
  noCursor();
  /*music settings
  music = new SoundFile(this, "sounds/megalovania.mp3");
  music.amp(0.01);
  music.loop();
  */
  
  //objects instances
  stars = new Galaxy(100,5);
  ship = new Ship();
  heavyRain = new AsteroidsRain();
  aliens = new AlienAttack();
  aliens.addAlien(1);
  
  //font
  font_scoreboard = createFont("font/punteggio.ttf", 80);
  
  score = new Points();
}

void draw(){
  
  if(!dead){
    
    
    //get nose x coord
    try {
      DatagramPacket packet = new DatagramPacket(buf, buf.length);
      socket.receive(packet);
      InetAddress address = packet.getAddress();
      int port = packet.getPort();
      packet = new DatagramPacket(buf, buf.length, address, port);
  
      nose_x = Float.intBitsToFloat( (buf[0]& 0xFF) ^ (buf[1]& 0xFF)<<8 ^ (buf[2]& 0xFF)<<16 ^ (buf[3]& 0xFF)<<24 )*2.2;
      //println(nose_x);
    }
    catch (IOException e) {
      e.printStackTrace(); 
      println(e.getMessage());
    }
    
    if(f == 0){
      delay(5000);
      f = 1;
    }
    
    
    //let the game move
    background(0);
    stars.move();
    ship.show();
    heavyRain.fall();
    aliens.attack();
    checkCollision();
    
    //show score
    textFont(font_scoreboard);
    score.show(width/2-(200),height - 50);
    
  }
  
}

void checkCollision(){
  s+=1;
  //ALIEN-LASER COLLISONS
  Vector<Alien> enemies = aliens.getAliens();
  Vector<LaserTag> tags = ship.getTags();
  Vector<Integer> hitted = new Vector<Integer>();
  if(enemies.size() > 0){  //check collision only if aliens exist
    for(int e = 0; e < enemies.size(); e++){
      for(int t = 0; t < tags.size(); t++){
        if(tags.elementAt(t).getX()>= enemies.elementAt(e).getX() && tags.elementAt(t).getX()<= enemies.elementAt(e).getX()+356 && tags.elementAt(t).getY()<= (enemies.elementAt(e).getY()+50)){
          hitted.add(e);
          tags.elementAt(t).setY(-100);
          println("ALIEN HIT");
        }
      }
    }
    s2 = s;
  }else{  //create more aliens based on player kills
    
    if(s > s2+120){
      aliens.addAlien(killed);
      s = 0;
      s2 = 0;
    }
    
  }
  
  for(int i : hitted){
    aliens.hit(i);
  }
  aliens.checkLife();
  
  
  
}
