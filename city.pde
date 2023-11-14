class city{
  //parameters
  float cx,cy;  
  int level;
  
  //initializing
  city(float x_in,float y_in){   
    cx=x_in;
    cy=y_in;
    level=0;
  }
  
  //initializing randomly
  city(city[] city_based,float rad1,float rad2){
    int close_flag=1;
    while(close_flag==1){
      close_flag=0;
      int base_i = floor(random(0,city_num-0.0001));
      float rad_random=random(rad1,rad2);
      float angle_random=random(0,2*PI);
      cx=city_based[base_i].cx+rad_random*cos(angle_random);
      cy=city_based[base_i].cy+rad_random*sin(angle_random);
      for(int i=0;i<city_num;i++){
        float dis = dist(cx,cy,Cities[i].cx,Cities[i].cy);
        if(dis<grow_range1){
          close_flag=1;
          break;}
      }
      if(cx<0)close_flag=1;
      if(cx>width)close_flag=1;
      if(cy<0)close_flag=1;
      if(cy>height)close_flag=1;
    }
    level=0;
  }
  
  //functions
  void levelup(){
    //level-0:33%
    //level-1:66%
    //level-2:100% and spotlight
    //level-5000:bigger
    if(level<showing_rate) level+=player;
  }
  
  void show(){
    float tem1 = 255*level/showing_rate;
    float tem2 = 2+2*level/showing_rate;
    fill(#FCD019,tem1);
    noStroke();
    circle(cx,cy,tem2);
  }
  
}
