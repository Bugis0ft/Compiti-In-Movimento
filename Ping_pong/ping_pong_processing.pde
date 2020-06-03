boolean winner;
int max_score;
 Player player1 ;
 Player player2 ;
 Palla palla; 
 PImage immagine;
void setup() {
  size(1000,800);
  immagine = loadImage("bugisoft.jpg");
  
  player1 = new Player(1); 
  player2 = new Player(2);
  palla = new Palla(1); 
 
  winner = false; 
  
  max_score = 10; 
}

void draw() {
  background(0);
  image(immagine, 180, 80);
  

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
    
    palla.show();
    palla.mover();
  }
  
  player1.show();
  player1.move();
  palla.RimbalzoPlayer(player1.getPosizione());
  
  player2.show();
  player2.move();
  palla.RimbalzoPlayer2(player2.getPosizione());
  
  palla.MuroRimbalzo();
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
