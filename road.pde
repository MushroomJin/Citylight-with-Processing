class road{
  //parameters
  float x_start,y_start,x_end,y_end;
  int level;
  
  //initializing
  road(city city1,city city2){
    x_start=city1.cx;
    y_start=city1.cy;
    x_end=city2.cx;
    y_end=city2.cy;
    level=0;
  }
  
  //functions
  void levelup(){
    //level-0:33%
    //level-1:66%
    //level-2:100%
    //level-5000:bigger
    if(level<showing_rate) level+=player;
  }
  
  void show(){
    float tem = 60*level/showing_rate;
    stroke(#FCE278,tem);
    strokeWeight(1);
    line(x_start,y_start,x_end,y_end);
  }

}
