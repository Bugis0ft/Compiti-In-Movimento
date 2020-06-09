import java.util.Vector;
import processing.sound.*;
import java.net.*;
import java.io.*;

DatagramSocket socket;
DatagramPacket packet;
PFont font_scoreboard;
static Points score;
PImage sfondo;
SoundFile music;
SoundFile music_dead;
Rick rick;
Pipes pipes;
int startDelay = 0;
static boolean dead = false;
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
  size(1920,1080);
  noCursor();
  sfondo = loadImage("sfondo.png");
  
  rick=new Rick();
  pipes= new Pipes();
  music = new SoundFile(this, "sigla.mp3");
  music_dead = new SoundFile(this, "dead.mp3");
  music.amp(0.05);
  music.loop();
  font_scoreboard = createFont("punteggio.ttf", 80);
  score = new Points();
}

void draw(){
  startDelay++;
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
    if(startDelay > 400){
      pipes.fall();
      collision();
    }
    textFont(font_scoreboard);
    fill(255,255,255);
    score.show(width/2-200,height - 100);
  }
}

void collision(){
  Vector<Base> pips= pipes.getV();
  for(int i=0;i<pips.size();i++){
     if(rick.getY()<=pips.elementAt(i).getY()+700 || rick.getY()+150>=pips.elementAt(i).getY()+700+200){
       println(rick.getY());
       println(pips.elementAt(i).getY()+700);
       if(rick.getX()+60>=pips.elementAt(i).getX() && rick.getX()+100<=pips.elementAt(i).getX()+181){
         dead=true;
         music.stop();
         music_dead.amp(0.5);
         music_dead.play();
         music_dead.jump(36);
         score.dead(width/2-200,height/2);
      }
    }
  }
}
