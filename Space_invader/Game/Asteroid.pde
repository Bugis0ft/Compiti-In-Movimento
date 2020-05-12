class Asteroid{
  private PImage asteroid;
  private float x;
  private float y;
  private float speed;
  private float scale;
  private static final float MIN_SPEED = 10;
  private static final float MAX_SPEED = 15;
  private static final float MIN_SCALE = 0.9;
  private static final float MAX_SCALE = 4;
  
  public Asteroid(int x, int y){
    asteroid = loadImage("images/asteroid/koffing.png");
    this.x = x;
    this.y = y;
  }
  
  public Asteroid(){
    asteroid = loadImage("images/asteroid/koffing.png");
    this.x = random(0,width);
    this.y = random(-8000,0);
    this.speed = random(MIN_SPEED, MAX_SPEED);
    this.scale = random(MIN_SCALE,MAX_SCALE);
  }
  
  public void show(){
    image(asteroid, x, y, asteroid.width/scale, asteroid.height/scale);
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
