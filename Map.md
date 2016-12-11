# DDDUR2016F_5130809021
  float []shitangX={0.287,0.44,0.39,0.18,0.62,0.84};
  float []shitangY={0.597,0.65,0.34,0.33,0.71,0.43};
  
class Map {
  PImage bgmap;
  PImage jiaotong;
  PImage sjtu;

  Map() {
    bgmap=loadImage("map.png");
    jiaotong=loadImage("jiaotonguniversity.png");
    sjtu=loadImage("sjtu.png");
  }
    
  
  
  void display() {
    image(bgmap, 0, 0, width, height);
    noStroke();
    fill(4,5,12,50);
   rect(0,height-20,1420, 840);
      stroke(255);
    fill(4,5,12);
    rect(width,60,180,630);
    image(jiaotong,width+55,570,70,70);
    image(sjtu,width-122,height-26.9,305,88);
    for(int i=0;i<6;i++){
      stroke(255,0,0);
      fill(255,0,0);
      stroke(255);
      fill(255);
     
    }
  }
  
}
