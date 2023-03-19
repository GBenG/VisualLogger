//Includes
import     java.io.BufferedWriter;
import     java.io.FileWriter;
import     processing.serial.*;
Serial myPort;  // Create object from Serial class

//Objects
serial_port serial_left = new serial_port();
serial_port serial_rght = new serial_port();

flow flow_control = new flow();

side side_left = new side();
side side_rght = new side();

//String text_area_left = ""; 
//String text_area_rght = ""; 

//----------------------------------------------------------------------------------------------------------------------
void setup() 
{
  size( 1000, 850 );
  
  serial_left.update();
  serial_rght.update();
  
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
}


//----------------------------------------------------------------------------------------------------------------------
void draw() 
{
  background(bgcolor);
  
  control_watermark();
  control_group("LEFT", 0, height);
  control_group("RIGHT", width-170, height);
//--------------------------------------------------------    
  textSize(20);
  fill(bgcolor);
  
  
  float lineHeight = textAscent() + textDescent();
  float y = 50;
  
  int leftMargin = 50;
  int topMargin = 50;
  
  stroke(orng_out);
  rect(leftMargin - 15, topMargin - 25, getLongestStringWidth(side_left.get()), lineHeight * side_left.get().length + lineHeight + 15, 20);
  stroke(blue_out);
  leftMargin = width/2+50;
  rect(leftMargin - 15, topMargin - 25, getLongestStringWidth(side_rght.get()), lineHeight * side_rght.get().length + lineHeight + 15, 20);
//-------------------------------------------------------- 
  textSize(15);
  fill(txcolor);
  textAlign(LEFT,TOP);


  
  for (String str : side_left.get()) {
    text(str, 50, y);
    y += lineHeight;
  }
  y = 50;
  for (String str : side_rght.get()) {
    text(str, width/2+50, y);
    y += lineHeight;
  }
//--------------------------------------------------------  
}
