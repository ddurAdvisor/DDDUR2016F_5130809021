class ScrollBar{
  float pos;
  float widRate;
  float hgt;

 
 
  ScrollBar(){
    pos=0;
    widRate=0.8;
    hgt=40;

   
  }
  float getPos(){
    return pos;
  }
  void setPos(float hehe){
    pos=hehe;
  }
  boolean update(){
    if(mousePressed){
      System.out.println("pressed");
      if(mouseY>=height&&mouseY<=height+hgt){
        float rate=(mouseX-width*(1-widRate)/2)/width/widRate;
        if(rate>=0&&rate<=1){
          pos=rate;
          System.out.println(pos);
          return true; 
        }
      }

    }
    return false;
  }
 
    
  
  void display(){
    int x=int(width*(1-widRate)/2);
    int y=int(height);
    noStroke();
    fill(200);
    rect(x,y+23,width*widRate,2);
    noStroke();
    fill(0,160,255);
    rect(width*0.1,y+23,(time-timemin)*width*0.8/(timemax-timemin),2);
   
   
  }
}
