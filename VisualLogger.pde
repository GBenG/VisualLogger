//Includes
import     java.io.BufferedWriter;
import     java.io.FileWriter;
import     processing.serial.*;


//Objects



//----------------------------------------------------------------------------------------------------------------------
void setup() 
{
  size( 800, 850 );
}


//----------------------------------------------------------------------------------------------------------------------
void draw() 
{
  background(bgcolor);
  
  control_watermark();
  control_group("LEFT", 0, height);
  control_group("RIGHT", width-170, height);
}  
