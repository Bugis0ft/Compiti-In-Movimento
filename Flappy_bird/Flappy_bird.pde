import java.util.Vector;
import processing.sound.*;
import java.net.*;
import java.io.*;

PFont font_scoreboard;
static Points score;
PImage sfondo;
SoundFile music;
Rick rick;
Pipes pipes;

static boolean dead = false;

DatagramSocket socket;
DatagramPacket packet;

static float nose_y;

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
  size(1920,displayHeight);
  noCursor();
  sfondo = loadImage("sfondo.png");
  rick=new Rick();
  pipes= new Pipes();
  music = new SoundFile(this, "sigla.mp3");
  music.amp(0.01);
  music.loop();
  font_scoreboard = createFont("punteggio.ttf", 80);
  score = new Points();
}

void draw(){
  if(!dead){
    try {
      DatagramPacket packet = new DatagramPacket(buf, buf.length);
      socket.receive(packet);
      InetAddress address = packet.getAddress();
      int port = packet.getPort();
      packet = new DatagramPacket(buf, buf.length, address, port);
  
      nose_y = Float.intBitsToFloat( (buf[4]& 0xFF) ^ (buf[5]& 0xFF)<<8 ^ (buf[6]& 0xFF)<<16 ^ (buf[7]& 0xFF)<<24 );
      //println(nose_x);
    }
    catch (IOException e) {
      e.printStackTrace(); 
      println(e.getMessage());
    }

    image(sfondo, 0, 0, width, height);  
    rick.show();
    pipes.fall();
    collision();

    textFont(font_scoreboard);
    fill(255,255,255);
    score.show(width/2-(200),height - 100);
  }
}

void collision(){
  Vector<Base> pips= pipes.getV();
  for(int i=0;i<pips.size();i++){
    if(rick.getY()>=pips.elementAt(i).getY()-766 || rick.getY()-150<=pips.elementAt(i).getY()-766-200){
      if(rick.getX()+200==pips.elementAt(i).getX()){
        dead=true;
        score.dead(width/2,height/2);
      }
    }
  }
}
