class Rick{
  private float x;
  private float y;
  private PImage rick;
  
  public Rick(){
    this.rick=loadImage("rick2.png");
    this.x=150;
    this.y=height;
  }
  public void show(){
    image(rick,x,nose_y,100,150);
    fill(255,0,0);
    circle(150,nose_y,10);
  }
  
  public float getX(){
    return this.x;
  }
  
  public float getY(){
    return nose_y;
  }
}
