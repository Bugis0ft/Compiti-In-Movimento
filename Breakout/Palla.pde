import java.util.Random;
public class Palla{
  
  private float x;
  private float y;
  private float d;
  private float xSpeed;
  private float ySpeed;
  
  public Palla(){
    //posiziono al centro
    x=width/2;
    y=height/2;     
    //la dimensiono in base alla dimensione dello schermo
    d=width/25;
    //velocità di partenza
    xSpeed=8;
    ySpeed=8;
  }
  
  public void aggiorna(){
    //controllo se ha raggiunto uno dei bordi, nel caso la faccio rimbalzare
    //controllo orizzontale
    if(x>=(width-d/2)||x<(0+d/2)){
      xSpeed=-xSpeed;
    }
    //controllo verticale
    if(y>height-d/2 || y<0+d/2){
      ySpeed=-ySpeed;
    }
    //incremento le variabili x e y della palla per spostarla
    x+=xSpeed;
    y+=ySpeed;
  }
  
  public void show(){
    //disegno una pallina rossa
    stroke(255, 0, 0);
    fill(255,0,0);
    ellipse(x,y,d,d);
  }  
  
  public void rimbalza(){
    ySpeed=-ySpeed;
    Random random = new Random();
    if(ySpeed>=0){
      ySpeed+=random.nextInt(10)/10;
    }else{
      ySpeed-=random.nextInt(10)/10;
    }
    if(xSpeed>=0){
      xSpeed+=random.nextInt(10)/10;
    }else{
      xSpeed-=random.nextInt(10)/10;
    }
  }
  
  public void fine(){
    //posiziono al centro
    x=width/2;
    y=height/2;     
    //la dimensiono in base alla dimensione dello schermo
    d=width/25;
    //azzero la velocità per fermarla
    xSpeed=0;
    ySpeed=0;
  }
  
  //funzioni per leggere la posizione
  public float getX(){
    return x;
  }
  
  public float getY(){
    return y;
  }
  
  //funzione per leggere la dimensione
  public float getD(){
    return d;
  }
  
  //funzioni per regolare o leggere la velocità
  
  public void increaseXSpeed(){
    this.xSpeed++;
  }
  
  public void decreaseXSpeed(){
    this.xSpeed--;
  }
  
  public void increaseYSpeed(){
    this.ySpeed++;
  }
  
  public void decreaseYSpeed(){
    this.ySpeed--;
  }
  
  public float getXSpeed(){
    return xSpeed;
  }
  
  public float getYSpeed(){
    return ySpeed;
  }
  
    //copiatura velocità
  public void copySpeed(Palla p){
    xSpeed=p.getXSpeed();
    ySpeed=p.getYSpeed();
  }
}
  
