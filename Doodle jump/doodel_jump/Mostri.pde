class Mostri{
  private int a = parseInt(random(1,3));
  private Vector<Mostro> mostri;
  
  
  public Mostri(){
    mostri = new Vector<Mostro>();
    for(int i = 0; i < a; i++){
      mostri.add(new Mostro());
    }
  }
  
  public void show(){
    for(int i = 0; i < mostri.size(); i++){
      mostri.elementAt(i).show();
    }
    for(int k=0;k<mostri.size();k++){
      if(mostri.elementAt(k).y>height){
        mostri.elementAt(k).y=-2000;
        mostri.elementAt(k).x=random(100,1280-100);
      }
    }
  }
  
  public void fall(){
    for(int i = 0; i < mostri.size(); i++){
      mostri.elementAt(i).show();
    }
    
    for(int i = 0; i < mostri.size(); i++){
      mostri.elementAt(i).setY(mostri.elementAt(i).getY() + mostri.elementAt(i).getSpeed());
      if(mostri.elementAt(i).getY() > height) mostri.elementAt(i).setY(random(1000,0));
    }
  }
}
