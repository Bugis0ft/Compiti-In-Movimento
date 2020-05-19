class Rick{
  private PImage rick;
  private float x;
  private float y;
  private int mousex=0;

  public Rick(int x, int y){
    rick = loadImage("source.gif");
    this.x = x;
    this.y = y;
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
    float a=0;
    boolean fuori=true;
    while(fuori){
      a=a+1;
      setY(a);
      delay(20);
      if(a==300){
        /*
        while(a>=10){
          a=a-10;
          setY(a);
        }*/
          fuori=false;
      }
    }
  }
}
