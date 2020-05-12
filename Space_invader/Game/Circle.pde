public class Circle{
  private float radius;
  private color self_color;
  private color border;
  private float opacity;
  private float x;
  private float y;
  private static final float MAX_RADIUS = 10.0;
  private static final float MIN_RADIUS = 3.0;
  
  public Circle(){
    radius = random(MIN_RADIUS,MAX_RADIUS);
    border = color(255,255,255);
    opacity = random(0,255);
    self_color = color(214, 214, 214);
    x = random(0, displayWidth);
    y = random(-displayHeight*2,0);    
  }
  
  public float getX(){
    return this.x;
  }
  
  public float getY(){
    return this.y;
  }
  
  public color getFill(){
    return this.self_color;
  }
  
  public color getStroke(){
    return this.border;
  }
  
  public float getRadius(){
    return this.radius;
  }
  
  public void setX(float x){
    this.x = x;
  }
  
  public void setY(float y){
    this.y = y;
  }
  
  public void setRafiud(float radius){
    if(radius >= MIN_RADIUS && radius <= MAX_RADIUS) this.radius = radius;
  }
  
  public void setColor(color self_color){
    this.self_color = self_color;
  }
  
  public void setStroke(color border){
    this.border = border;
  }
  
  public void show(){
    fill(self_color,opacity);
    stroke(border,opacity);
    circle(x,y,radius);  
  }
  
}  
