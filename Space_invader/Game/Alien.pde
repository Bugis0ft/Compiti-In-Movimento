class Alien{
  //LVL 1:
  private static final float scale1 = 0.3;    //every alien start moving from left to right
  private static final float speed1 = 5;
  //LVL 2:
  private static final float speed2 = 10;
  //LVL 3:
  private static final float speed3 = 20;
  
  //laser colors
  private color pink = color(255, 79, 226);
  private color pinkStroke = color(237, 128, 219);
  private color green = color(0, 255, 34);
  private color greenStroke = color(94, 255, 116);
  private color purple = color(192, 52, 235);
  private color purpleStroke = color(193, 126, 214);
  
  //aliens lasertags
  private Vector<LaserTag> laserTag;
  private int s;  //timing netween each lasertags
  
  
  private float x;
  private float y;
  private int lvl;
  private int life;
  private float speed;
  private float laserSpeed;
  private float scale;
  private PImage alien;
  private color laserColor;
  private color strokeColor;
  
  public Alien(int l){
    laserTag = new Vector<LaserTag>();
    this.lvl = l;
    this.s = 0;
    this.y = 2;
    switch(lvl){
      case 1:
        this.speed = speed1;
        this.laserSpeed = 15;
        this.scale = scale1;
        alien = loadImage("images/enemy/green.png");
        this.life = 1;
        this.laserColor = green;
        this.strokeColor = greenStroke;
        break;
        
      case 2:
        this.speed = speed2;
        this.laserSpeed = 20;
        this.scale = scale1;
        this.life = 2;
        alien = loadImage("images/enemy/violet.png");
        this.laserColor = pink;
        this.strokeColor = pinkStroke;
      
        break;
        
      case 3:
        this.speed = speed3;
        this.laserSpeed = 25;
        this.scale = scale1;
        alien = loadImage("images/enemy/purple.png");
        this.life = 3;
        this.laserColor = purple;
        this.strokeColor = purpleStroke;
        break;  
        
      default:
        break;
    }
    this.x = random((0+alien.width),(width-alien.width));
  }
  
  public void show(){
    //draw alien and its hitbox
    fill(0,0,0,0);
    rect(x,y, alien.width*scale, alien.height*scale);  
    image(alien, x, y, alien.width*scale, alien.height*scale);
    
    //create a laser tag every tot seconds
    s+=1;
    println("lasers = " + laserTag.size());
    if(s%32 == 0){
      println("adding alien lasertag");
      s =0;
      laserTag.add(new LaserTag(this.x + (alien.width*0.3)/2, this.y+alien.height*0.3, laserColor, strokeColor));
    }
    
    //move all laser tag
    for(int i = 0; i < laserTag.size(); i++){
      laserTag.elementAt(i).show();
    }
    
    //delete useless lasertags
    for(int i = 0; i < laserTag.size(); i++){
      laserTag.elementAt(i).setY(laserTag.elementAt(i).getY() + this.laserSpeed);
      if(laserTag.elementAt(i).getY() >= height + LaserTag.H) {
        laserTag.remove(i);
        score.addPoints(5);
      }
    }
  }
  
  public Vector<LaserTag> getAlienTags(){
    return this.laserTag;
  }
  
  public int getLvl(){
    return this.lvl;
  }
  
  public int getLife(){
    return this.life;
  }
  
  public void decLife(){
    this.life -= 1;
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
