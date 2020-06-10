class Ship{
  private float y;
  private int s;  //seconds
  PImage ship;
  private Vector<LaserTag> laserTag;
  
  

  public Ship(){
    this.ship = loadImage("images/ship/possente.png");
    this.y = height-190;
    laserTag = new Vector<LaserTag>();
    s = 0;
  }
  
  public void show(){
    image(ship,-(nose_x-1500),y);
    fill(0,0,0,0);
    stroke(255,255,255);
    //rect(-(nose_x-1500),780+ship.height/2, ship.width, ship.height/2);  //wings
    //rect(-(nose_x-1500)+65,780,ship.width-130,ship.height);  //main ship
    
    //create a laser tag every second 
    s+=1;
    if(s%29 == 0){
      s =0;
      laserTag.add(new LaserTag(-(nose_x-1500) + ship.width/2, this.y-LaserTag.H, color(255,255,255), color(255,255,255)));
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
  
  public float getW(){
    return ship.width;
  }
  
  public float getH(){
    return ship.height;
  }
  
  public Vector<LaserTag> getTags(){
    return laserTag;
  }
}
