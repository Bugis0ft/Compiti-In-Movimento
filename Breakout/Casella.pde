import java.util.Random;
public class Casella{
  
  //posizione
  private float x;  
  private int y;
  //dimensione
  private int w;
  private int h;
  
  public Casella(int x, int y){
    //creo la casella e la posiziono dove richiesto
    this.x=x;
    this.y=y;
    //imposto la dimensione della casella in base a quella dello schermo
    w=width/10;
    h=height/20;
  }
  
  public void show(int r, int g, int b){
    //creo la casella
    stroke(0,0,0);
    //il colore di riempimento viene richiesto all'utente
    fill(r,g,b);
    rect(x,y,w,h);
  }
  
  //lettura delle variabili
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
  
  //azioni nel caso dello scontro della pallina
  public boolean scontro (Palla p){
    //scontro con il blocco dal basso
    Random random = new Random();
    if ((p.getX()+p.getD()/2>x && p.getX()-p.getD()/2<x+w) && (p.getY()-p.getD()/2<(y+h) && p.getY()-p.getD()/2>y)){
        p.ySpeed=abs(p.ySpeed);
        if(p.ySpeed>=0){
          p.ySpeed+=random.nextInt(20)/10;
        }else{
          p.ySpeed-=random.nextInt(20)/10;
        }
        if(p.xSpeed>=0){
          p.xSpeed+=random.nextInt(20)/10;
        }else{
          p.xSpeed-=random.nextInt(20)/10;
        }
        return true;
    }
    //scontro con il blocco da sinistra
    else if ((p.getY()+p.getD()/2>y && p.getY()-p.getD()/4<y+h) && (p.getX()+p.getD()/2>x && p.getX()+p.getD()/2<x+w)) {
        p.xSpeed=-abs(p.xSpeed);
        if(p.ySpeed>=0){
          p.ySpeed+=random.nextInt(20)/10;
        }else{
          p.ySpeed-=random.nextInt(20)/10;
        }
        if(p.xSpeed>=0){
          p.xSpeed+=random.nextInt(20)/10;
        }else{
          p.xSpeed-=random.nextInt(20)/10;
        }
        return true;
   }
    //scontro con il blocco dall'alto
    else if ((p.getX()+p.getD()/2>x && p.getX()-p.getD()/2<x+w) && (p.getY()+p.getD()/2<y+h && p.getY()+p.getD()/2>y)) {
        p.ySpeed=-abs(p.ySpeed);
        if(p.ySpeed>=0){
          p.ySpeed+=random.nextInt(20)/10;
        }else{
          p.ySpeed-=random.nextInt(20)/10;
        }
        if(p.xSpeed>=0){
          p.xSpeed+=random.nextInt(20)/10;
        }else{
          p.xSpeed-=random.nextInt(20)/10;
        }
        return true;
   }  
   //scontro con il blocco da destra
   else if ((p.getY()+p.getD()/2>y && p.getY()-p.getD()/2<y+h) && (p.getX()-p.getD()/2<x+w && p.getX()-p.getD()/2>x)) {
        p.xSpeed=abs(p.xSpeed);
        if(p.ySpeed>=0){
          p.ySpeed+=random.nextInt(20)/10;
        }else{
          p.ySpeed-=random.nextInt(20)/10;
        }
        if(p.xSpeed>=0){
          p.xSpeed+=random.nextInt(20)/10;
        }else{
          p.xSpeed-=random.nextInt(20)/10;
        }
        return true;
   }
  return false;
  }
}
