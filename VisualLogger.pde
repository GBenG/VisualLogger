//Includes
import     java.io.BufferedWriter;
import     java.io.FileWriter;
import     processing.serial.*;
Serial myPort;  // Create object from Serial class

//Objects
serial_port serial_left = new serial_port();
serial_port serial_rght = new serial_port();

flow flow_control = new flow();

String text_area_left = ""; 
String text_area_rght = ""; 

//----------------------------------------------------------------------------------------------------------------------
void setup() 
{
  size( 800, 850 );
  
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
  
  textSize(8);
  fill(txcolor);
  textAlign(LEFT);
  text(text_area_left, 50, 50, 300, 500);
  text(text_area_rght, width/2+50, 50, 300, 500);
}  
