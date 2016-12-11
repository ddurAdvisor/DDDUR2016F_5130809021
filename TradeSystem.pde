# DDDUR2016F_5130809021
int[] calendar={31,28,31,30,31,30,31,31,30,31,30,31};
class TradeSystem{
  ArrayList<Trade> trades;
  Position position;
  int activeFirst;
  int activeLast;
  Particle particle;
  TradeSystem(){
    trades=new ArrayList<Trade>();
    position=new Position();
    activeFirst=0;
    activeLast=0;
    particle=new Particle(100);
  }
  void loadFile(String string){
    BufferedReader reader=createReader(string);
    String line;
    try{
        line=reader.readLine();
      }catch(IOException e){
      }
    int row=0;
    while(true){
      row++;
      try{
        line=reader.readLine();
      }catch(IOException e){
        e.printStackTrace();
        line=null;
      }
      if(line==null||row>10000000){
        break;
      }
      else{
        String[] pieces=split(line,TAB);
        Trade trade=new Trade(pieces[0],pieces[1],
        pieces[2],pieces[3],pieces[4]);
        this.trades.add(trade);
      }
    }
    time=timemin=trades.get(0).timestamp;
    timemax=trades.get(trades.size()-1).timestamp;
  }
  
  void updateManual(int timestamp){
    activeFirst=0;
    int n=this.trades.size();
    for(int i=0;i<n;i++){
      
      if(timestamp<int(trades.get(i).timestamp)){
        activeFirst=activeLast=i;
        break;
      }
    }
    while(activeFirst>0){
      if(timestamp-timespan<int(trades.get(activeFirst-1).timestamp)){
        activeFirst--;
      }
      else{
        break;
      }
    }
  }
  void updateAuto(int timestep){
    if((time+timestep)>timemax){
      return;
    }
    time=time+timestep;
    while(trades.get(activeFirst).timestamp<time-timespan){
      activeFirst++;
    }
    while(trades.get(activeLast).timestamp<=time){
      activeLast++;
    }
  }
  void getPosition(){
    for(Trade t: trades){      
      
      t.x=int(random(30)-15+position.hashX.get(t.toaccount));
      t.y=int(random(30)-15+position.hashY.get(t.toaccount));
    }
  }
  
  void display(){
    for(int i=activeFirst;i<activeLast;i++){
      

      int r=int(sqrt(float(trades.get(i).amount)));
      fill(255);
      stroke(255);
    
      shape(particle.getShape(),trades.get(i).x,trades.get(i).y,3*r,3*r);      
    }
    for(int i=0;i<6;i++){
      int a=mouseX-int(width*shitangX[i]);
      int b=mouseY-int(height*shitangY[i]);
     
      if(a*a+b*b<800){
     
        int count=0;
        int money=0;
        for(int j=activeFirst;j<activeLast;j++){
         
          if(hashName.get(trades.get(j).toaccount).equals(str(i+1))){
            count++;
            money+=int(trades.get(j).amount);
          }
        }
        int aaa=0;
        if(count>0){
          aaa=money/count;
        }
       
        stroke(0);
        fill(255);
        text("Canteen  NO. "+(i+1),width+15,340);
        text("Number("+timespan+" min): "+count,width+15,390);
        text("Average cost:"+aaa,width+15,440);
        break;
      }
    }
  }
}

class Trade{
  String fromaccount;
  String toaccount;
  String syscode;
  String timestampString;
  int timestamp;
  String amount;
  int x;
  int y;

  Trade(String from, String to, String sys, 
  String time, String amt ){
    fromaccount=from;
    toaccount=to;
    syscode=sys;
    timestampString=time;
    amount=amt;
    
    
    String[] pieces=timestampString.split("/| |:");
    int day=0;
    for(int i=0;i<int(pieces[1])-1;i++){
      day=day+calendar[i];
    }
    timestamp=((day+int(pieces[2]))*24
    +int(pieces[3]))*60+int(pieces[4]);
  }

}
