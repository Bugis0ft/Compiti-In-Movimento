class Mostro{
  private PImage mostro;
  private float x;
  private float y;
  private float speed;
  private float scale;
  private static final float MIN_SPEED = 5;
  private static final float MAX_SPEED = 10;
  
  public Mostro(int x, int y){
    mostro = loadImage("mostro.png");
    this.x = x;
    this.y = y;
  }
  
  public Mostro(){
    mostro = loadImage("mostro.png");
    this.x = random(100,1280-100);
    this.y = random(-500,-1500);
    this.speed = random(MIN_SPEED, MAX_SPEED);
  }
  
  public void show(){
    image(mostro, x, y, 100, 50);
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
