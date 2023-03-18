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
    com_lft = Toggle(com_lft, x+120, y-25, 40, 20 );
  }else{
    com_rgt = Toggle(com_rgt, x+120, y-25, 40, 20 );
  }
  
  textSize(20);
  fill(txcolor);
  textAlign(LEFT, CENTER);
  text("+", x+36, y-18);
  text("-", x+12, y-18);

  textAlign(CENTER, CENTER);
  
  if( name == "LEFT" ){
    text(serial_left.get(), x+85, y-17);
  }else{
    text("COM33", x+85, y-17);
  }
  
}


void btn_click(String name, String dir){
  if( name == "LEFT" ){
      if( dir == "+" ){
        serial_left.inc();
        println("L+");
      }else{
        serial_left.dec();
        println("L-");
      }
  }else{
      if( dir == "+" ){
        serial_rght.inc();
        println("R+");
      }else{
        serial_rght.dec();
        println("R-");
      }
  }
}
