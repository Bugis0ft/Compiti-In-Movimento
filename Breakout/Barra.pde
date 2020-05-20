public class Barra{
  
  private float x;//posizione orizzontale
  private int y;  //posizione verticale
  private int w;  //larghezza
  private int h;  //altezza
  private int Speed; //velocità
  
  public Barra(){
    //creo la barra
    //dimensioni
    w=width/5;
    h=height/40;
    //posizioni iniziali
    x=width/2 - w/2;
    y=height-(h*3);
    Speed=15;
  }
  
  public void show(){
    //disegno la barra
    stroke(255, 255, 255);
    fill(255, 255, 255);
    rect(x,y,w,h);
  }
  
  //fa rimbalzare la pallina se la tocca
  public void scontro(Palla b){
      if(barra.getX()+barra.getW()>b.getX() && barra.getX()<b.getX() && (b.getY() + b.getD()/2)>=barra.getY()){
        //faccio rimbalzare la pallina quando tocca la barra
        b.rimbalza();
      }
  }  
  
  //lettura parametri
  public float getX(){
    return x;
  }
  
  public int getY(){
    return y;
  }
  
  public int getW(){
    return w;
  }
  
  public int getH(){
    return h;
  }
  
  //spostamento barra
  public void moveLeft(){
    x-=Speed;
  }
  
  public void moveRight(){
    x+=Speed;
  }
  
  public void moveMouse(){
      x=mouseX;
  }
}
