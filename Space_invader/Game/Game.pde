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
SoundFile pew;
SoundFile music;
SoundFile gameover;
AsteroidsRain heavyRain;

static boolean dead = false;
static int killed = 0;
int s = 0;
int s2 = 0;
int startDelay = 0;
int soundDelay = 429;

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
  //music settings
  music = new SoundFile(this, "sounds/megalovania.mp3");
  gameover = new SoundFile(this,"sounds/error.wav");
  pew = new SoundFile(this,"sounds/pew.wav");
  music.amp(0.01);
  pew.amp(0.1);
  gameover.amp(0.1);
  music.loop();
  
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
  startDelay++;
  
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
    
    
    //let the game move
    background(0);
    stars.move();
    ship.show();
    if(startDelay >+ 400){  //start obstacles after some times
      heavyRain.fall();
      aliens.attack();
      checkCollision();
    }
    
    //play pew sounf syncronized with ship shooting
    if(startDelay == soundDelay){
      startDelay = 400;
      pew.play();
    }
    
    
    //show score
    textFont(font_scoreboard);
    fill(255,255,255);
    score.show(width/2-(200),200);
  }else{
    music.stop();
    fill(255,0,0);
    text("GAME OVER",width/2-200,height/2);
  }
  
}

void checkCollision(){
  s+=1;
  
  Vector<Alien> enemies = aliens.getAliens();
  Vector<LaserTag> tags = ship.getTags();
  Vector<LaserTag> alienTags;
  Vector<Asteroid> asteroids = heavyRain.getAsteroids();
  Vector<Float> asteroidBorders;
  Vector<Integer> hitted = new Vector<Integer>();  //save index of hitted aliens
  
  //-------------------ALIEN - SHIPLASER COLLISONS------------------------
  if(enemies.size() > 0){  //check collision only if aliens exist
    for(int e = 0; e < enemies.size(); e++){
      for(int t = 0; t < tags.size(); t++){
        if(tags.elementAt(t).getX()>= enemies.elementAt(e).getX() && tags.elementAt(t).getX()<= (enemies.elementAt(e).getX()+356*0.3) && tags.elementAt(t).getY()<= (enemies.elementAt(e).getY()+256/3)){
          hitted.add(e);  //save all hitted aliens
          tags.elementAt(t).setY(-100);
          println("ALIEN HIT");
        }
      }
    }
    s2 = s;
  }else{  //if all enemies are dead create more aliens based on player kills
    
    if(s > s2+120){
      aliens.addAlien(killed);
      s = 0;
      s2 = 0;
    }
    
  }
  
  for(int i : hitted){  //subtract one life point to every hitted alien
    aliens.hit(i);
  }
  aliens.checkLife();  //if life == 0 delete alien
  
  
  //-------------------ALIENLASER - SHIP COLLISONS------------------------
  for(int i = 0; i < enemies.size(); i++){
    alienTags = enemies.elementAt(i).getAlienTags();
    
    for(int t = 0; t < alienTags.size(); t++){
                                                                                //rect(-(nose_x-1500),780+ship.height/2, ship.width, ship.height/2);  //wings
                                                                                //rect(-(nose_x-1500)+65,780,ship.width-130,ship.height);  //main ship
      if((alienTags.elementAt(t).getX() + LaserTag.W >= ship.getX() && alienTags.elementAt(t).getX() - LaserTag.W <= ship.getX() + ship.getW())    &&    (((alienTags.elementAt(t).getX()+LaserTag.W <= ship.getX()+65 || alienTags.elementAt(t).getX()+LaserTag.W >= ship.getX()+ship.getW()-130) && (alienTags.elementAt(t).getY()+LaserTag.H>=ship.getY() + ship.getH()/2 && alienTags.elementAt(t).getY()<=ship.getY()+ship.getH()))    ||    (((alienTags.elementAt(t).getX()+LaserTag.W > ship.getX()+65 && alienTags.elementAt(t).getX()+LaserTag.W < ship.getX()+ship.getW()-130) && alienTags.elementAt(t).getY()+LaserTag.H>=ship.getY())))){
        println("dead");
        dead = true;
        gameover.play();
      }
                                                                                
    }
  }
  
  //-------------------AASTEROID-SHIP COLLISONS------------------------
  for(int a = 0; a < asteroids.size(); a++){
    //get border coords
    asteroidBorders = asteroids.elementAt(a).getBorders();  //return a Vector<Float> = [top_left_x, top_left_y,bottom_right_x,bottom_right_y]
    
    if(asteroidBorders.elementAt(3) >= ship.getY()){  //check collision only if asteroids in under ship y coord
      if(((asteroidBorders.elementAt(0)>=ship.getX()+65 && asteroidBorders.elementAt(0)<=ship.getX()+ship.getW()-130) || (asteroidBorders.elementAt(2)>=ship.getX()+65 && asteroidBorders.elementAt(2)<=ship.getX()+ship.getW()-130) || (asteroidBorders.elementAt(0)<=ship.getX()+65 && asteroidBorders.elementAt(2)>=ship.getX()+ship.getW()-130)) && asteroidBorders.elementAt(1)<=ship.getX()+ship.getH()){
        dead = true;
        gameover.play();
        println("morto corpo prinicplae");
      }
    }
    
    if(asteroidBorders.elementAt(3) >= ship.getY()+ship.getH()/2){  //check collision only if asteroids in under half ship y coord
      if(((asteroidBorders.elementAt(0)>=ship.getX()+ship.getW()-130 && asteroidBorders.elementAt(0)<= ship.getX()+ship.getW()) || (asteroidBorders.elementAt(2)<=ship.getX()+65 && asteroidBorders.elementAt(2)>= ship.getX())) && asteroidBorders.elementAt(1)<=ship.getX()+ship.getH() ){
        dead = true;
        println("morto ala");
        println("ship: " + ship.getX() + " " + (ship.getX()+ship.getW()) + " " + (ship.getX()+65) + " " + (ship.getX()+ship.getW()-130));
        println("asteroids: " + asteroidBorders);
        gameover.play();
      }
    }
  }
}
