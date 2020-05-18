class Alien{
  //LVL 1:
  private static final float scale1 = 0.3;    //every alien start moving from left to right
  private static final float speed1 = 5;
  //LVL 2:
  private static final float scale2 = 0.6;
  private static final float speed2 = 10;
  //LVL 3:
  private static final float scale3 = 1;
  private static final float speed3 = 15;
  
  private float x;
  private float y;
  private float speed;
  private float scale;
  private PImage alien;
  
  public Alien(int lvl){
    alien = loadImage("images/enemy/green.png");
    this.x = random((0+alien.width),(width-alien.width));
    this.y = 2;
    switch(lvl){
      case 1:
        this.speed = speed1;
        this.scale = scale1;
        break;
        
      case 2:
        this.speed = speed2;
        this.scale = scale2;
      
        break;
        
      case 3:
        this.speed = speed3;
        this.scale = scale3;
      
        break;  
        
      default:
        break;
    }
  }
  
  public void show(){
      image(alien, x, y, alien.width*scale, alien.height*scale);
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
  
  public float getWidth(){
    return alien.width;
  }
  
  public float getHeight(){
    return alien.height;
  }
  
  public void setX(float x){
    this.x = x;
  }
  
  public void setY(float y){
    this.y = y;
  }
  
  public void setSpeed(float speed){
    this.speed = speed;
  }
  
  
}
