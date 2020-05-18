class AsteroidsRain{
  private static final int a = 8;
  private Vector<Asteroid> asteroidRain;
  
  
  public AsteroidsRain(){
    asteroidRain = new Vector<Asteroid>();
    for(int i = 0; i < a; i++){
      asteroidRain.add(new Asteroid());
    }
  }
  
  public void show(){
    for(int i = 0; i < asteroidRain.size(); i++){
      asteroidRain.elementAt(i).show();
    }
  }
  
  public void fall(){
    //SHOW ASTEROIDS
    for(int i = 0; i < asteroidRain.size(); i++){
      asteroidRain.elementAt(i).show();
    }
    
    //CHECK ASTEROID COORDS
    for(int i = 0; i < asteroidRain.size(); i++){
      asteroidRain.elementAt(i).setY(asteroidRain.elementAt(i).getY() + asteroidRain.elementAt(i).getSpeed());
      if(asteroidRain.elementAt(i).getY() > height) asteroidRain.elementAt(i).setY(random(-8000,0));
    }
  }
}
