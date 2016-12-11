int width=1200;
int height=750;
int frame=1;
int timemin=0;
int timemax=1;
int time=timemin;
int timespan=3;

TradeSystem tradesystem;
WeatherSystem weathersystem;
Map map;
PImage sprite;
ScrollBar scrollbar;


void setup() {
  size(1420, 840, P2D);
  background(4,5,12);
  sprite=loadImage("sprite.png");
  tradesystem=new TradeSystem();
  weathersystem=new WeatherSystem();
  tradesystem.loadFile("trade_sort.txt");
  tradesystem.position.loadFile("merchant11.txt");
  tradesystem.getPosition();
  weathersystem.loadFile("shanghaiqixiang_jiaoda.txt");
  map=new Map();
 
  scrollbar=new ScrollBar();
 
  frameRate(30);

}

void draw() {
  tradesystem.updateAuto(1);
  weathersystem.updateAuto(1);
  scrollbar.setPos(time/(timemax-timemin));
  if (scrollbar.update()) {
    time=int(scrollbar.getPos()*(timemax-timemin))+timemin;
    tradesystem.updateManual(time);
    weathersystem.updateManual(time);
  }
  frame1Display();
  stroke(0);
  fill(255);
  textSize(16);
  text(timeToDate(time),((time-timemin)*width*0.8/(timemax-timemin)+width*0.1)-55,height-5);
  text(timeToDate(timemin),width*0.1-55,height+60);
  text(timeToDate(timemax),width*0.9-55,height+60);
  ellipse(((time-timemin)*width*0.8/(timemax-timemin)+width*0.1),height+25,2,30);

}


void frame1Display() {
  map.display();
  tradesystem.display();
  weathersystem.display();
  scrollbar.display();
}

void frame2Display() {
}

String timeToDate(int time){
  int min=time%60;
  int hour=(time/60)%24;
  int days=time/60/24;
  int monthsum=0;
  int month=0;
  int day=0;
  for(int i=0;i<12;i++){
    if(days<monthsum+calendar[i]){
      month=i+1;
      day=days-monthsum;
      break;
    }
    monthsum+=calendar[i];
  }
  String str=("2014/"+month+"/"+day+" "+hour+":"+min);
  return str;

}
