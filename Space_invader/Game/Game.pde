import java.util.Vector;
import processing.video.*;
import processing.sound.*;
import java.net.*;
import java.io.*;

Galaxy stars;
AlienAttack aliens;
Ship ship;
SoundFile music;
AsteroidsRain heavyRain;

static boolean dead = false;

DatagramSocket socket;
DatagramPacket packet;

static float nose_x;
float diam = 40;
float rectSize = 200;

byte[] buf = new byte[24]; //Set your buffer size as desired

void setup(){
  try {
    socket = new DatagramSocket(4124); // Set your port here
  }
  catch (Exception e) {
    e.printStackTrace(); 
    println(e.getMessage());
  }
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
    
    try {
      DatagramPacket packet = new DatagramPacket(buf, buf.length);
      socket.receive(packet);
      InetAddress address = packet.getAddress();
      int port = packet.getPort();
      packet = new DatagramPacket(buf, buf.length, address, port);
  
      nose_x = Float.intBitsToFloat( (buf[0]& 0xFF) ^ (buf[1]& 0xFF)<<8 ^ (buf[2]& 0xFF)<<16 ^ (buf[3]& 0xFF)<<24 )*2.2;
    }
    catch (IOException e) {
      e.printStackTrace(); 
      println(e.getMessage());
    }
    
    background(0);
  
    stars.move();
    
    ship.show();
    
    heavyRain.fall();
    
    aliens.attack();
  }
  
}
