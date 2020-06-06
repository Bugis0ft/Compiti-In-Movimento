class LaserTag{
  private float x;
  private float y;
  private color fill;
  private color stroke;
  private static final int H = 20;
  private static final int W = 5;
  private static final float speed = 10;  //speed of laser tag
  
  public LaserTag(float x, float y, color fill, color stroke){
    this.fill = fill;
    this.stroke = stroke;
    this.x = x;
    this.y = y;
  }
  
  public LaserTag(){
    this.fill = color(255,255,255);
    this.stroke = color(255,255,255);
    this.x = 100;//ship.ship.width/2;
    this.y = 100;//ship.getY()-H;
  }
  
  public void show(){
    fill(fill);
    stroke(stroke);
    rect(x,y,W,H);
  }
  
  public void setX(float x){
    this.x = x;
  }
  
  public void setY(float y){
    this.y = y;
  }
  
  public float getX(){
    return this.x;
  }
  
  public float getY(){
    return this.y;
  }
}
