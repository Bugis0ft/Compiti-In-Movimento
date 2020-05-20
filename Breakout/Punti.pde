public class Punti{
  private int punteggio;
  
  public Punti(){
    punteggio=0;
  }
  
  public void show(int x, int y){
    text("punteggio: "+punteggio,x,y);
  }
  
  //lettura del punteggio
  public int getPoints(){
    return punteggio;
  }
  
  //lettura del punteggio
  public void removePoints(){
    punteggio=0;
  }
  
  //incremento del punteggio
  public void addPoint(){
    punteggio+=10;
  }
}
