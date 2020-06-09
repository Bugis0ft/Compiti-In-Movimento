/*

author : fabrizio agbonson,tommaso genovose 
date: 1 june 2020
descrizione: classe dove definisco l'oggetto giocatore



*/
//classe Player


class Player{
  // dichiaro la variabili
  private PVector posizione, velocita;
  private int larg, alt, NPlayer, punti;
  
  //costruttore
  public Player(int np) {
    this.NPlayer = np;
    this.larg = 20; 
    this.alt = 100; 
    this.punti = 0; 
    
    if(this.NPlayer == 1) {
       this.posizione = new PVector(larg/2, height/2);
    } else if(NPlayer == 2) {
       this.posizione = new PVector(width - larg/2, height/2);
    }
    this.velocita = new PVector(0,20);
  }
  
  //metodo per  "simulare" il movimento del giocatore 
  void move(float nose_y) {
    
    
    
    if(nose_y != 0){
    if (this.NPlayer == 1 && nose_y < 350 ){
      this.posizione.sub(this.velocita);
    }else if( this.NPlayer == 1 && nose_y > 350){
      this.posizione.add(this.velocita);
    }
    this.posizione.y = constrain(this.posizione.y,this.alt/2,height - this.alt/2);
    }
   /* 
   if(keyPressed){
     if(this.NPlayer == 2 && key == 'w') {
       this.posizione.sub(this.velocita);
    } 
 
    else if(this.NPlayer == 2 && key == 's') {
      this.posizione.add(this.velocita);
    }
    this.posizione.y = constrain(this.posizione.y,this.alt/2,height - this.alt/2);
   
  }
 
    if(this.NPlayer == 1 && keyCode == UP) {
      this.posizione.sub(this.velocita);
    } 

    else if(this.NPlayer == 1 && keyCode == DOWN) {
      this.posizione.add(this.velocita);
    }
    this.posizione.y = constrain(this.posizione.y,this.alt/2,height - this.alt/2);
    */
    
  }
  
  //metodo per far disegnare il giocatore in video
  void show() {
    fill(255);
    noStroke();
    rectMode(CENTER);
    rect(this.posizione.x, this.posizione.y, this.larg, this.alt);
  }
  


  //get e set
  PVector getPosizione() {
    return this.posizione;
  }
  
  void setPunti(int punti) {
    this.punti += punti;
  }
  
  int getPunti() {
    return  this.punti;
  }
}
