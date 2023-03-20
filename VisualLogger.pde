//Includes
import     java.io.BufferedWriter;
import     java.io.FileWriter;
import     processing.serial.*;


//Objects
Serial_port serial_left = new Serial_port();
Serial_port serial_rght = new Serial_port();

//Main objects
Flow flow_control = new Flow();
Belt belt = new Belt();

//Jst class test
Rectangle sq = new Rectangle( 200, 200, 15, 15, #747983, #f89300 ); 

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

  belt.draw();

//--------------------------------------------------------
  control_watermark();
  control_group("LEFT", 0, height);
  control_group("RIGHT", width-170, height);
//--------------------------------------------------------  
}

void mouseWheel(MouseEvent event) {
  if(event.getCount() > 0){
    belt.inc_pos();
  }
  if(event.getCount() < 0){
    belt.dec_pos();
  }
}
