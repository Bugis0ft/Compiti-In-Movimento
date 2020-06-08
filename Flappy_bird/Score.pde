class Points{
  private int s;  //score
  
  public Points(){
    this.s = 0;
  }
  
  public void addPoints(int p){
    s+=p;
  }
  
  public void setPoints(int p){
    this.s = p;
  }
  
  public void show(int x, int y){
    text("SCORE: " + s, x, y);
  }
  
  public void dead(int x, int y){
    text("GAME OVER ",x,y);
  }
}
