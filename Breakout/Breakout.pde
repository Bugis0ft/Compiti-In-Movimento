import java.util.Vector;
import java.lang.Math;
import processing.sound.*;
import java.net.*;
import java.io.*;

Palla palla; 
Palla palla2; 
PImage sfondo; 
Barra barra; 
Punti punteggio; 

int esegui;

//dati socket
DatagramSocket socket;
DatagramPacket packet;
static float nose_x;
float diam = 40;
float rectSize = 200;
byte[] buf = new byte[24]; //Set your buffer size as desired

//caselle
Vector<Casella> caselle= new Vector<Casella>();

//sound
SoundFile sound_vittoria;
SoundFile sound_sconfitta;
SoundFile sound_gioco;
String gioco = "songs/Game.mp3";
String sconfitta = "songs/lose.wav";
String vittoria = "songs/win.wav";

//font
PFont font_scoreboard;
PFont font_fine;
int dimtxt;

//loading time
int t = 0;

void setup() {
  
  //connection to the sokcet
  try {
    socket = new DatagramSocket(4124); // Set your port here
  }
  catch (Exception e) {
    e.printStackTrace(); 
    println(e.getMessage());
  }
  
  //imposto la dimensione dello schermo
  fullScreen();
  //imposto lo sfondo
  sfondo = loadImage("sfondo.png");
  //creo i font
  font_scoreboard = createFont("font/punteggio.ttf", 80);
  font_fine = createFont("font/fine.ttf", 150);
  //allineo il testo al centro
  textAlign(CENTER);
  //ripristino le caselle
  caselle.clear();
  //creo gli oggetti
  palla= new Palla();
  palla2= new Palla();
  barra = new Barra();
  punteggio  = new Punti();
  sound_vittoria = new SoundFile(this,vittoria);
  sound_sconfitta = new SoundFile(this,sconfitta);
  sound_gioco = new SoundFile(this,gioco);
  for(int y=0;y<(height/30)*3;y+=(height/30+10)){
      for(int x=0; x<=width-(width/20); x+=width/10){
          caselle.add(new Casella(x, y));
      } 
  }
  sound_gioco.play();
  esegui=1;
}

void draw() {
  if(t<480) t++;
  if(esegui==1){
    
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
    
    //imposto lo sfondo
    background(sfondo);
    //aggiorno la posizione della pallina
    if(t>=480){
      palla.aggiorna();
      if(punteggio.getPoints()>=200){
        palla2.aggiorna();
      }
    }
    
    //mostro i vari componenti
    fill(255,255,255);
    textFont(font_scoreboard);
    punteggio.show(width/2, height-(barra.getH()*7));
    if(punteggio.getPoints()>=180&&punteggio.getPoints()<200){
      textFont(font_fine);
      text("A 200 punti partira' la seconda palla", width/2, (height/30+10)*5);
      palla2.copySpeed(palla);
      palla2.show();
    }
    palla.show();
    barra.show();
    //barra.moveMouse();
    if(punteggio.getPoints()>=200){
      palla2.show();
      barra.scontro(palla2);
    }
    disegnaCaselle();
    //controllo se la palla deve ribalzare contro la barra
    barra.scontro(palla);
    //controllo la sconfitta
    if(palla.getY()>(barra.getY()+barra.getH())){
      fine();
      sound_gioco.stop();
      sound_sconfitta.play();
    }
    if(punteggio.getPoints()>=200){
      if(palla2.getY()>(barra.getY()+barra.getH())){
        fine();
        sound_gioco.stop();
        sound_sconfitta.play();
      }
    }
    //controllo la vittoria
    if(caselle.size()<=0){
      fine();
      sound_gioco.stop();
      sound_vittoria.play();
    }
  }
}

void fine(){
  background(sfondo);
  palla.fine();
  palla2.fine();
  disegnaCaselle();
  fill(255,255,255);
  textFont(font_scoreboard);
  punteggio.show(width/2, height-(barra.getH()*7));
  textFont(font_fine);
    if(caselle.size()<=0){
      text("Hai vinto, clicca con il mouse per rigiocare", width/2, (height/30+10)*5);
    }else{
      text("Hai perso, clicca con il mouse per rigiocare", width/2, (height/30+10)*5); 
    }
  esegui=0;
}

void disegnaCaselle() {  
  //ripeto per ogni casella
  for(int num = caselle.size()-1; num>=0; num--) {
    Casella blocco=caselle.get(num);
    if(blocco.getY()==0){
      blocco.show(255,0,0);
    } else if (blocco.getY()==(height/30+10)){
      blocco.show(0,255,0);
    } else if (blocco.getY()==(height/30+10)+(height/30+10)){
      blocco.show(0,0,255);
    }
    //controllo se si scontra con la palla
    if(blocco.scontro(palla)){  
      punteggio.addPoint();
      caselle.remove(blocco);
    }
    if(blocco.scontro(palla2)){  
      punteggio.addPoint();
      caselle.remove(blocco);
    }
  }
  
}

void mousePressed(){
  sound_gioco.stop();
  sound_vittoria.stop();
  sound_sconfitta.stop();
  fine();
  setup();
}
