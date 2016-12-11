class WeatherSystem{
  ArrayList<Weather> weathers;
  PImage wind;
  PImage temp;
  PImage rain;
  
  int active;
  WeatherSystem(){
    weathers=new ArrayList<Weather>();
    active=0;
    wind=loadImage("wind.png");
    temp=loadImage("temp.png");
    rain=loadImage("rain.png");
    
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
        
        Weather weather=new Weather(pieces[0],pieces[2],
        pieces[3],pieces[5]);

        this.weathers.add(weather);
      }
    }
  }
  
  void updateManual(int timestamp){
    active=0;
    int n=this.weathers.size();
    for(int i=0;i<n;i++){
   
      if(timestamp<=int(weathers.get(i).timestamp)){
        active=i;
   
        break;
      }

    }
  }
  void updateAuto(int timestep){
    if((time+timestep)>timemax){
      return;
    }
    time=time+timestep;
 
    while(weathers.get(active).timestamp<time){
      active++;
    
    }
  }
  
  void display(){
    image(temp,width+5,80,50,50);
    image(rain,width+5,130,50,50);
    image(wind,width+5,180,50,50);
    
    text("Temp "+weathers.get(active).temp,width+80,110);
    text("Rain  "+weathers.get(active).rain,width+80,160);
    text("Wind "+weathers.get(active).wind,width+80,210);

   
  }
}

class Weather{
  String timestampString;
  int timestamp;
  String temp;
  String rain;
  String wind;
  Weather(String time,String t, String r, String w){
    timestampString=time;
    temp=t;
    rain=r;
    wind=w;
    int year=int(timestampString.substring(0,4));
    int month=int(timestampString.substring(4,6));
    int day=int(timestampString.substring(6,8));
    int hour=int(timestampString.substring(8,10));
    int min=int(timestampString.substring(10,12));
  
    int monthday=0;
    for(int i=0;i<int(month)-1;i++){
      monthday+=calendar[i];
    }
    timestamp=((monthday+day)*24
    +hour)*60+min;
  }

}
