class AlienAttack{
  private Vector<Alien> aliens;
  
  public AlienAttack(){
    aliens = new Vector<Alien>();
  }
  
  public void addAlien(int killed){
    switch(killed){
      case 1:
        aliens.add(new Alien(1));
        break;
      case 2:
        aliens.add(new Alien(1));
        aliens.add(new Alien(1));
        break;
      case 3:
        aliens.add(new Alien(1));
        aliens.add(new Alien(1));
        aliens.add(new Alien(1));
        break;
      case 4:
        aliens.add(new Alien(2));
        break;
        
      case 5:
        aliens.add(new Alien(2));
        aliens.add(new Alien(1));
        break;
      case 6:
        aliens.add(new Alien(2));
        aliens.add(new Alien(1));
        aliens.add(new Alien(1));
        break;
      case 7:
        aliens.add(new Alien(2));
        aliens.add(new Alien(1));
        aliens.add(new Alien(1));
        break;
      case 8:
        aliens.add(new Alien(2));
        aliens.add(new Alien(2));
        aliens.add(new Alien(1));
        break;
      case 9:
        aliens.add(new Alien(3));
        aliens.add(new Alien(1));
        aliens.add(new Alien(1));
        break;
        
      case 10:
        aliens.add(new Alien(3));
        aliens.add(new Alien(2));
        aliens.add(new Alien(2));
        break;
      default:
        break;
    }
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
  
  public Vector<Alien> getAliens(){
    return this.aliens;
  }
  
  public void hit(int i){
    aliens.elementAt(i).decLife();
  }
  
  public void checkLife(){
    for(int i = 0; i < aliens.size(); i++){
      if(aliens.elementAt(i).getLife() == 0){  //alien killed
        Game.killed +=1;
        
        switch(aliens.elementAt(i).getLvl()){
          case 1:
            score.addPoints(100);
            break;
          case 2:
            score.addPoints(300);
            break;
          case 3:
            score.addPoints(500);
            break;
          default:
            break;
        }
        
        aliens.remove(i);
      }
    }
    
  }
}
