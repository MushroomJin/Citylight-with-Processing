import controlP5.*;

//adjustable parameter
int city_number_max = 500;//the max number of citys
float grow_range1   = 20;//the lowest distance between cities
float grow_range2   = 200;//the highest distance when growing
float player        = 1;

float city_rate     = 2;//%--p of city grow
float road_rate     = 10;//%--p of road grow
float car_rate      = 10;//%--p of car grow
float speed1        = 0.5;//lowest car speed
float speed2        = 1.5;//highest car speed
float showing_rate  = 1000;

//float light_z = 600;
//float light_nz = -1;
//float light_angle = PI/2;
//float light_concer = 600;
int[][] road_check;

ControlP5 cp5;
Button button_start;
boolean button_state=false;
Slider slider1;

city center_city;
int city_num=0;
city[] Cities;
int road_num=0;
road[] Roads;

int car_max=10*city_number_max*(city_number_max-1)/2;
car[] Cars;
int car_num=0;





void setup(){
  //basic
  size(1600,800,P3D);
  noStroke();
  background(10);
  sphereDetail(60);
  
  //set center city
  fill(#FCD019);
  center_city = new city(width/2,height/2);
  
  //enable control tab
  //button to start or pause
  cp5=new ControlP5(this);
  button_start=cp5.addButton("button_start");
  button_start.setPosition(20,20).setSize(100,40);
  button_start.setLabel("START");
  button_start.setColorBackground(#325B93);
  button_start.setColorActive(#4077C1);
  button_start.setColorForeground(#325B93);
  
  slider1=cp5.addSlider("slider1").setPosition(20,80).setSize(200,40);
  slider1.setLabel("speed");
  slider1.setRange(0.1,3);
  slider1.setValue(1);
  

  Cities = new city[city_number_max];
  city_num++;
  Cities[0] = center_city;
  Cars = new car[car_max];
  Roads = new road[ceil(city_number_max*city_number_max/2)];
  road_check = new int[city_number_max][city_number_max];
  for(int i=0;i<city_number_max;i++){
    for(int j=0;j<city_number_max;j++){
      road_check[i][j]=0;
    }
  }
}

void draw(){
  player = slider1.getValue();
  city_rate     = 2*player;
  road_rate     = 10*player;
  car_rate      = 10*player;
  check_button();
  if(button_state){
    //city lights continue to grow
    background(10);
    pushMatrix();
    translate(width/2,height/2,-50);
    fill(0);
    noStroke();
    box(width+500,height+500,10);
    translate(0,0,50);
    //sphere(120);
    popMatrix();
    fill(#FCD019);
    noStroke();
    //circle(width/2,height/2,5);
    //spotLight(255,242,142,width/2,height/2,1600,0,0,-1,PI/8,600);
    
    
    
    //grow with p
    goup();
    if(random(0,100)<city_rate){
      growcity();
    }
    for(int i=0;i<city_num;i++){
      Cities[i].show();
    }
    if(random(0,100)<road_rate){
      if(city_num>2){
        int tem_road_max=city_num*(city_num-1)/2;
        if(road_num<tem_road_max){growroad();}
      }
    }
    for(int j=0;j<road_num;j++){
      Roads[j].show();
    }
    if(random(0,100)<car_rate){
      if(road_num>1){growcar();}
    }
    for(int k=0;k<car_num;k++){
      Cars[k].show();
      Cars[k].move();
    }
    
  }
  saveFrame("frames/####.tif");
}

void growcity(){
  if(city_num<city_number_max){
    Cities[city_num] = new city(Cities,grow_range1,grow_range2);
    city_num++;
  }

}

void goup(){
  for(int i=0;i<city_num;i++){
    Cities[i].levelup();
  }
  for(int j=0;j<road_num;j++){
    Roads[j].levelup();
  }
  for(int k=0;k<car_num;k++){
    Cars[k].levelup();
  }
}

void growroad(){
  int i=0;
  int j=0;
  int rerandom_flag=1;
  while(rerandom_flag==1){
    rerandom_flag=0;
    i=floor(random(0,city_num-0.01));
    j=floor(random(0,city_num-0.01));
    if(i==j){
      rerandom_flag=1;
    }
    if(road_check[i][j]==1){
      rerandom_flag=1;
    }
    if(road_check[j][i]==1){
      rerandom_flag=1;
    }
  }
  Roads[road_num] = new road(Cities[i],Cities[j]);
  road_num++;
  road_check[i][j]=1;
  road_check[j][i]=1;
}

void growcar(){
  if(car_num<car_max){
    Cars[car_num] = new car();
    car_num++;
  }
}
