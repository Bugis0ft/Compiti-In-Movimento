class Rick{
  private PImage rick;
  private float x;
  private float y;
  private int mousex=0;
  private int k;
  private boolean su;
  private boolean giu;

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
    this.x = mouseX;
    this.y = 720-100;
  }
  
  public void show(){
    
    if(mouseX>1280-150){
      mousex=1280-150;
    }else{
      mousex=mouseX;
    }
    image(rick, mousex, y, 150, 100); 
  }
  
  public void setY(float a){
    this.y=620-a;
  }
  
  public int getX(){
    return mousex;
  }
  
  public int getY(){
    return parseInt(y);
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
