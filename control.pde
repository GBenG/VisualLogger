Boolean com_lft = false;
Boolean com_rgt = false;

void control_watermark(){
  fill(bgcolor);
  stroke(txcolor);
  rect( 0, height-30, width, 30);
  fill(txcolor);
  text("SPS :: 2023", width/2, height-17);
}


void control_group(String name, int x, int y) 
{
  fill(bgcolor);
  stroke(txcolor);
  rect( x-1, y-30, 170+1, 50);
  

  if(Button("", x+30, y-25, 20, 20, 7)){
    btn_click(name,"+");
  }
  if(Button("", x+5, y-25, 20, 20, 7)){
    btn_click(name,"-");
  }
  
  if( name == "LEFT" ){
    serial_left.set(Toggle(serial_left.get(), x+120, y-25, 40, 20 ));
  }else{
    serial_rght.set(Toggle(serial_rght.get(), x+120, y-25, 40, 20 ));
  }
  
  textSize(20);
  fill(txcolor);
  textAlign(LEFT, CENTER);
  text("+", x+36, y-18);
  text("-", x+12, y-18);

  textAlign(CENTER, CENTER);
  
  if( name == "LEFT" ){
    text(serial_left.get_name(), x+85, y-17);
  }else{
    text(serial_rght.get_name(), x+85, y-17);
  }
  
}


void btn_click(String name, String dir){
  if( name == "LEFT" ){
      if( dir == "+" ){
        serial_left.inc();
      }else{
        serial_left.dec();
      }
  }else{
      if( dir == "+" ){
        serial_rght.inc();
      }else{
        serial_rght.dec();
      }
  }
}

Serial open_port(String port_name, int port_speed){
    return new Serial(this, port_name, port_speed);
}
