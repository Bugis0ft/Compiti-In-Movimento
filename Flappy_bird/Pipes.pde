class Pipes{
  private static final int a = 10;
  private Vector<Base> pipes;
  
  public Vector<Base> getV(){
    return pipes; 
  }
  
  public Pipes(){
    pipes = new Vector<Base>();
    pipes.add(new Base());
    for(int i = 1; i < a; i++){
      //println(i+1+" pipes create ");
      pipes.add(new Base(pipes.elementAt(pipes.size()-1).getX()+900));
    }
  }
  
  public void fall(){

    for(int i = 0; i < pipes.size(); i++){
      pipes.elementAt(i).show();
    }
    
    for(int i = 0; i < pipes.size(); i++){
      pipes.elementAt(i).setX(pipes.elementAt(i).getX() - pipes.elementAt(i).getSpeed());
      if(pipes.elementAt(i).getX() < 0-326) {
        pipes.add(new Base(pipes.elementAt(pipes.size()-1).getX()+900));
        pipes.remove(i);
        Flappy_bird.score.addPoints(100);
      }
    }
  }
}
