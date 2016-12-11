HashMap<String,String> hashName=new HashMap<String,String>();
class Position{
  ArrayList<Merchant> merchants;
  HashMap<String,Float> hashX;
  HashMap<String,Float> hashY;
  Position(){
    merchants=new ArrayList<Merchant>();
    hashX=new HashMap<String,Float>();
    hashY=new HashMap<String,Float>();
  }
  void loadFile(String string){
    BufferedReader reader=createReader(string);
    String line;
    try{
        line=reader.readLine();
      }catch(IOException e){
      }
    while(true){
      try{
        line=reader.readLine();
      }catch(IOException e){
        e.printStackTrace();
        line=null;
      }
      if(line==null){
        break;
      }
      else{
        String[] pieces=split(line,TAB);
        float x=random(width)+2*width;
        float y=random(height)+2*height;
        Merchant merchant=new Merchant(pieces[0],pieces[1],pieces[2],x,y);
        this.merchants.add(merchant);
        for(int i=0;i<6;i++){
          if(pieces[1].equals(str(i+1))){
            x=shitangX[i]*width;
            y=shitangY[i]*height;
            break;
          }
        }
        this.hashX.put(pieces[2],x);
        this.hashY.put(pieces[2],y);
      }      
    }
  }
}

class Merchant{
  String syscode;
  String codename;
  String toaccount;
  float x;
  float y;
  Merchant(String sys, String name, String to,float x1,float y1){
    syscode=sys;
    codename=name;
    toaccount=to;
    x=x1;
    y=y1;
    hashName.put(toaccount,codename);
  }
}
