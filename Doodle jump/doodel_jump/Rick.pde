class Rick{
  private PImage rick;
  private float x;
  private float y;
  private int mousex=0;
  private int k;
  private boolean su;
  private boolean giu;
  private float nasox;

  public Rick(int x, int y){
    rick = loadImage("source.gif");
    this.x = x;
    this.y = y;
    k=0;
    su = true;
    giu = false;
  }
  
  public Rick(){
    rick = loadImage("source.gif");
    this.x = nose_x;
    this.y = 720-100;
  }
  
  public void show(){
    
   // if(nose_x>1280-150){
   //   nose_x=nose_x-150;
   // }
    image(rick,nose_x-1280, nose_y, 150, 100); 
  }
  
  public void setY(float a){
    this.y=620-a;
  }
  
  public float getX(){
    return x;
  }
  
  public int getY(){
    return parseInt(nose_y);
  }
  
  public void jump(){
    if(su && k<10){
      k++;
      y-=15;
    }else {
      su = false;
      giu = true;
    }
    
    if(giu && k>0){
      k--;
      y+=15;
    }else {
      su = true;
      giu = false;
    }
  }
}
