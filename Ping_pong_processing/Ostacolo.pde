/*

author : fabrizio agbonson,tommaso genovose 
date: 1-6-2020
descrizione: classe dove definisco l'oggetto Ostacolo




*/
//classe Ostacolo


class Ostacolo{
  private int cont =0;
  private int R= 100;
  private int G= 256;
  private int B= 10;
  public Ostacolo() {
  }
  void show() {
    stroke(0, 0, 0);
    if(cont==60){
      R=(int)random(256);
      G=(int)random(256);
      B=(int)random(256);
      cont=0;
    }
    fill(R,G,B);
    rect(500, 320, 100,100);
    cont = cont +1;
  }
  
}
