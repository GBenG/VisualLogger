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
  text("SPS :: 2023", width/2, height-32);
  control_group("LEFT", 0, height);
  control_group("RIGHT", width-265, height);
}  
