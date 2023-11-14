class car{
  //parameters
  float kx,ky;
  float speed;
  int road_order;
  float far;
  float dis;
  float si;
  float co;
  int level;
  
  car(){
    road_order = floor(random(0,road_num-0.001));
    speed = random(speed1,speed2);
    dis = dist(Roads[road_order].x_start,Roads[road_order].y_start,Roads[road_order].x_end,Roads[road_order].y_end);
    far = speed;
    si = (Roads[road_order].y_end-Roads[road_order].y_start)/dis;
    co = (Roads[road_order].x_end-Roads[road_order].x_start)/dis;
    kx = far*co+Roads[road_order].x_start;
    ky = far*si+Roads[road_order].y_start;
    level = 0;
  }
  
  void move(){
    far += speed*player;
    far = far % dis;
    kx = far*co+Roads[road_order].x_start;
    ky = far*si+Roads[road_order].y_start;
  }
  
  void levelup(){
    if(level<showing_rate)level+=player;
  }
  
  void show(){
    float tem = 200*level/showing_rate;
    fill(random(0,255),random(0,255),random(0,255),tem);
    noStroke();
    circle(kx,ky,3.5);
  }
}
