class Basi{
  private static final int a = 20;
  private Vector<Base> basi;
  
  public Basi(){
    basi = new Vector<Base>();
    for(int i = 0; i < a; i++){
      basi.add(new Base());
    }
  }
  
  public void show(){
    for(int i = 0; i < basi.size(); i++){
      basi.elementAt(i).show();
    }
  }
}
