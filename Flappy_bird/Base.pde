class Base{
  private PImage base;
  private PImage base2;
  private float x;
  private float y;
  private float speed;
  private static final float MAX_SPEED = 10;

  
  public Base(float x){
    base = loadImage("pip.png");
    base2 = loadImage("pip2.png");
    this.x = x;
    this.y = random(-500,0);
    this.speed = MAX_SPEED;
  }
  
  public Base(){
    base = loadImage("pip.png");
    base2 = loadImage("pip2.png");
    this.x = random(1500,2000);
    this.y = random(-500,0);
    this.speed = MAX_SPEED;
  }
  
  public void show(){
    image(base, x, y);
    image(base2, x,y+base.height+200);
    fill(255,0,0);
    //circle(x,y+base.height+200,10);
  }
  
   public float getX(){
    return this.x;
  }
  
  public float getY(){
    return this.y;
  }
  
  public float getSpeed(){
    return this.speed;
  }
  
  public void setX(float x){
    this.x = x;
  }
  
  public void setY(float y){
    this.y = y;
  }
}
