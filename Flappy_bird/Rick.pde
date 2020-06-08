class Rick{
  private float x;
  private float y;
  private PImage rick;
  
  public Rick(){
    this.rick=loadImage("rick2.png");
    this.x=width/2;
    this.y=height;
  }
  public void show(){
    image(rick,width/2,nose_y);
  }
  
  public float getX(){
    return this.x;
  }
  
  public float getY(){
    return nose_y;
  }
}
