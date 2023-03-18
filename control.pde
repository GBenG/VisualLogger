Boolean com_lft = false;
Boolean com_rgt = false;

void control_group(String name, int x, int y) 
{
  fill(bgcolor);
  stroke(txcolor);
  rect( x-1, y-50, 265+1, 50);
  
  if(Button("", x+10, y-40, 30, 30, 15)){
    btn_click(name,"+");
  }
  if(Button("", x+45, y-40, 30, 30, 15)){
    btn_click(name,"-");
  }
  
  if( name == "LEFT" ){
    com_lft = Toggle(com_lft, x+195, y-40);
  }else{
    com_rgt = Toggle(com_rgt, x+195, y-40);
  }
  
  textSize(35);
  fill(txcolor);
  textAlign(LEFT, CENTER);
  text("+", x+17, y-32);
  text("-", x+54, y-32);
  textAlign(CENTER, CENTER);
  
  if( name == "LEFT" ){
    text("COM2", x+137, y-32);
  }else{
    text("COM3", x+137, y-32);
  }
  
}


void btn_click(String name, String dir){
  if( name == "LEFT" ){
      if( dir == "+" ){
        println("L+");
      }else{
        println("L-");
      }
  }else{
      if( dir == "+" ){
        println("R+");
      }else{
        println("R-");
      }
  }
    
}
