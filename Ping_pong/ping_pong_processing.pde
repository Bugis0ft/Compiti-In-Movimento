import java.net.*;
import java.io.*;
import java.util.Arrays;

DatagramSocket socket;
DatagramPacket packet;





byte[] buf = new byte[24];

PImage immagine;
boolean winner;
int max_score;
Player player1 ;
Player player2 ;
Ostacolo ostac;
Palla palla; 
float nose_y;

void setup() {
  size(1000,800);
  immagine = loadImage("bugisoft.jpg");
  player1 = new Player(1); 
  player2 = new Player(2);
  palla = new Palla(1); 
  ostac = new Ostacolo();
  winner = false; 
  max_score = 10; 
  
  
  
  try {
    socket = new DatagramSocket(4124); // Set your port here
  }
  catch (Exception e) {
    e.printStackTrace(); 
    println(e.getMessage());
  }
  //fullScreen();
  fill(0, 255, 0);
}

void draw() {
  background(0);
  image(immagine, 180, 80);
   
   
    try {
    DatagramPacket packet = new DatagramPacket(buf, buf.length);
    socket.receive(packet);
    InetAddress address = packet.getAddress();
    int port = packet.getPort();
    packet = new DatagramPacket(buf, buf.length, address, port);



    nose_y = Float.intBitsToFloat( (buf[4]& 0xFF) ^ (buf[5]& 0xFF)<<8 ^ (buf[6]& 0xFF)<<16 ^ (buf[7]& 0xFF)<<24 );
    println("DATA:");


    println(nose_y);
    println("DATA END\n");
    

  }catch (IOException e) {
    e.printStackTrace(); 
    println(e.getMessage());
  }
  

  textSize(30);
  fill(57, 255, 43);
  
  text(player1.getPunti(), width/2 - 60, 40);
  text(player2.getPunti(), width/2 + 30, 40);
  
 

  if(winner == false) {
    strokeWeight(2);
    stroke(255);
    
    for(int y = 0; y < height; y+= 10) {
      line(width/2,y,width/2,y+5);
    }
    ostac.show();
    palla.show();
    palla.mover();
  }
  
  player1.show();
  player1.move(nose_y);
  palla.RimbalzoPlayer(player1.getPosizione());
  
  player2.show();
  player2.move(nose_y);
  palla.RimbalzoPlayer2(player2.getPosizione());
  
  palla.MuroRimbalzo();
  palla.Risucchio();
  Controllo_palla();
  Controllo_vincitore();
}

void Controllo_palla() {
  PVector posizionePalla = palla.getPosizione();
  

  if(posizionePalla.x > width && player1.getPunti() <= max_score) {
    player1.setPunti(1);

    palla = new Palla(-1);
  } 

  else if(posizionePalla.x < 0 && player2.getPunti() <= max_score) { 
    player2.setPunti(1);

    palla = new Palla(1);
  }

  else if (keyPressed && winner == true) {
    setup();
  }
}

void Controllo_vincitore() {

  if(player1.getPunti() == max_score) {
    fill(255, 0, 0);
    text("Player1 ha vinto la partita !!  ", 325, 700);
    textSize(15);
    text("Premere un tasto qualsiasi per riprodurre di nuovo... ", 330, 730);
    winner = true;
  } else if(player2.getPunti() == max_score) {
    fill(0, 132, 255);
    text("Player2 ha vinto la partita !!", 325, 700);
    textSize(15);
    text("Premere un tasto qualsiasi per riprodurre di nuovo... ", 330, 730);
    winner = true;
  }
}
