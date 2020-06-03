class Ship{
  private float y;
  private int s;  //seconds
  PImage ship;
  private Vector<LaserTag> laserTag;
  

  

  public Ship(){
    this.ship = loadImage("images/ship/possente.png");
    this.y = 780;
    laserTag = new Vector<LaserTag>();
    s = 0;

  }
  
  public void show(){
    image(ship,-(nose_x-1500),780);
    //create a laser tag every second 
    s+=1;
    if(s%30 == 0){
      s =0;
      laserTag.add(new LaserTag(-(nose_x-1500) + ship.width/2, this.y-LaserTag.H));
    }
    //move all laser tag
    for(int i = 0; i < laserTag.size(); i++){
      laserTag.elementAt(i).show();
    }
    
    //delete useless lasertags
    for(int i = 0; i < laserTag.size(); i++){
      laserTag.elementAt(i).setY(laserTag.elementAt(i).getY() - LaserTag.speed);
      if(laserTag.elementAt(i).getY() < -LaserTag.H) laserTag.remove(i);
    }
    
    //println("LaserTags: " + laserTag.size());
  }
  
  public float getX(){
    return -(nose_x-1500);
  }
  
  public float getY(){
    return this.y;
  }
  
  public Vector<LaserTag> getTags(){
    return laserTag;
  }
}
