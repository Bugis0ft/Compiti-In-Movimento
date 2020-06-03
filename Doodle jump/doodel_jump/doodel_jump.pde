import java.util.Vector;
import processing.sound.*;
import java.net.*;
import java.io.*;
DatagramSocket socket;
DatagramPacket packet;
static float nose_x;
static float nose_y;
byte[] buf = new byte[24];
  // Declare variable "a" of type PImage
PImage sfondo;
SoundFile music;
Rick rick;
Basi paddles;
Mostri mostri;
void setup() {
  
  try {
    socket = new DatagramSocket(4124); // Set your port here
  }
  catch (Exception e) {
    e.printStackTrace(); 
    println(e.getMessage());
  }
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
  image(sfondo, 0, 0, width, height);
  try {
      DatagramPacket packet = new DatagramPacket(buf, buf.length);
      socket.receive(packet);
      InetAddress address = packet.getAddress();
      int port = packet.getPort();
      packet = new DatagramPacket(buf, buf.length, address, port);
  
      nose_x = Float.intBitsToFloat( (buf[0]& 0xFF) ^ (buf[1]& 0xFF)<<8 ^ (buf[2]& 0xFF)<<16 ^ (buf[3]& 0xFF)<<24 )*2.2;
      nose_y = Float.intBitsToFloat( (buf[4]& 0xFF) ^ (buf[5]& 0xFF)<<8 ^ (buf[6]& 0xFF)<<16 ^ (buf[7]& 0xFF)<<24 );
    }
    catch (IOException e) {
      e.printStackTrace(); 
      println(e.getMessage());
    }
  // Displays the image at its actual size at point (0,0)
  
  // Displays the image at point (0, height/2) at half of its size
  
  paddles.show();
  rick.show();
  //mostri.show();
  //mostri.fall();
  text(rick.getY(),5,40);
  textSize(40);
  //rick.jump();
}
