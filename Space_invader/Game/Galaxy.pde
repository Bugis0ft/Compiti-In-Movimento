class Galaxy{
  /*
  This class create a sequence of circles that emulate a galaxy.
  */
  
  private static final int MAX_STARS = 1000;
  private static final int MIN_STARS = 50;
  private int stars;
  private int speed;
  private Vector<Circle> galaxy;
  
  public Galaxy(int stars, int speed){
    this.speed = speed;
    
    if(stars >= MIN_STARS && stars <= MAX_STARS) this.stars = stars;
    else this.stars = MIN_STARS;
    
    //creating stars
    galaxy = new Vector<Circle>();
    for(int i = 0; i < stars; i++){
      galaxy.add(new Circle());
    }
  }
  
  public void move(){
    for(int i = 0; i < galaxy.size(); i++){
      galaxy.elementAt(i).show();
    }
    
    for(int i = 0; i < stars; i++){
      galaxy.elementAt(i).setY(galaxy.elementAt(i).getY() + speed);
      if(galaxy.elementAt(i).getY() > height) galaxy.elementAt(i).setY(random(-height*2,0));
    }
  }
  
}
