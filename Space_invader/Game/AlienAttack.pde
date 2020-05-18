class AlienAttack{
  private Vector<Alien> aliens;
  
  public AlienAttack(){
    aliens = new Vector<Alien>();
  }
  
  public void addAlien(int lvl){
    aliens.add(new Alien(lvl));
  }
  
  public void attack(){
    //SHOW ALIES
    for(int i = 0; i < aliens.size(); i++){
      aliens.elementAt(i).show();
    }
    
    //MOVE ALIENS
    for(int i = 0; i < aliens.size(); i++){  
      //checking for left and right window collision
      if((aliens.elementAt(i).getSpeed() > 0 && (aliens.elementAt(i).getX() + aliens.elementAt(i).getSpeed()) > (displayWidth - aliens.elementAt(i).getWidth())) || (aliens.elementAt(i).getSpeed() < 0 && (aliens.elementAt(i).getX() + aliens.elementAt(i).getSpeed()) < 0)){
        aliens.elementAt(i).setSpeed(-aliens.elementAt(i).getSpeed());  //changing direction
      }
      
      aliens.elementAt(i).setX(aliens.elementAt(i).getX() + aliens.elementAt(i).getSpeed());
    }
  }
}
