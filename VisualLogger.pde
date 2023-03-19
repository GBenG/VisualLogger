//Includes
import     java.io.BufferedWriter;
import     java.io.FileWriter;
import     processing.serial.*;


//Objects
serial_port serial_left = new serial_port();
serial_port serial_rght = new serial_port();

flow flow_control = new flow();

side side_left = new side();
side side_rght = new side();

//----------------------------------------------------------------------------------------------------------------------
void setup() 
{
  size( 1200, 850 );
  
  serial_left.update();
  serial_rght.update();
}


//----------------------------------------------------------------------------------------------------------------------
void draw() 
{
  background(bgcolor);
//-------------------------------------------------------- 
//TODO: Move it into visual tab
  textSize(20);
  fill(bgcolor);
  textAlign(LEFT,TOP);

  float lineHeight = textAscent() + textDescent();
  float y = 50;
  
  int leftMargin = 50;
  int topMargin = 50;
  if(side_left.get().length != 0){
    stroke(orng_out);
    rect(leftMargin-10, topMargin-5, getLongestStringWidth(side_left.get())+20, lineHeight * side_left.get().length+10, 10);
  }
  if(side_rght.get().length != 0){
    stroke(blue_out);
    leftMargin = width/2+50;
    rect(leftMargin-10, topMargin-5, getLongestStringWidth(side_rght.get())+20, lineHeight * side_rght.get().length+10, 10);
  }
//-------------------------------------------------------- 
//TODO: Move it into visual tab
  fill(orng_out);
  for (String str : side_left.get()) {
    text(str, 50, y);
    y += lineHeight;
  }
  y = 50;
  fill(blue_out);
  for (String str : side_rght.get()) {
    text(str, width/2+50, y);
    y += lineHeight;
  }
//--------------------------------------------------------
  control_watermark();
  control_group("LEFT", 0, height);
  control_group("RIGHT", width-170, height);
//--------------------------------------------------------  
}
