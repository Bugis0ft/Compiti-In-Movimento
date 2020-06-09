class Player{
  private PVector posizione, velocita;
  private int larg, alt, NPlayer, punti;
  
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
  
  void show() {
    fill(255);
    noStroke();
    rectMode(CENTER);
    rect(this.posizione.x, this.posizione.y, this.larg, this.alt);
  }
  
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
