void check_button(){
  boolean new_state=button_start.getBooleanValue();
  if(new_state!=button_state){
    if(new_state){
      println("start");
      button_start.setColorBackground(#277C31);
      button_start.setColorActive(#34B243);
      button_start.setColorForeground(#277C31);
      button_start.setLabel("PAUSE");}
    else{
      println("pause");
      button_start.setColorBackground(#325B93);
      button_start.setColorActive(#4077C1);
      button_start.setColorForeground(#325B93);
      button_start.setLabel("START");}
    button_state=new_state;
  }
}
