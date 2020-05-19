class Base{
  private PImage base;
  private float x;
  private float y;

  public Base(int x, int y){
    base = loadImage("base.png");
    this.x = x;
    this.y = y;
  }
  
  public Base(){
    base = loadImage("base.png");
    this.x = random(0,1280-350);
    this.y = random(-720,height-200);
  }
  
  public void show(){
    image(base, x, y, 350, 300);
  }
  
   public float getX(){
    return this.x;
  }
  
  public float getY(){
    return this.y;
  }
  
  public void setX(float x){
    this.x = x;
  }
  
  public void setY(float y){
    this.y = y;
  }
}
