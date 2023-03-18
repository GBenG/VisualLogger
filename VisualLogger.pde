//Includes
import     java.io.BufferedWriter;
import     java.io.FileWriter;
import     processing.serial.*;

//----------------------------------------------------------------------------------------------------------------------
void setup() 
{
  size( 800, 450 );
}


//----------------------------------------------------------------------------------------------------------------------
void draw() 
{
  background(bgcolor);
  
  if(Button("", 10, height-40, 30, 30, 15)){
    println("+");
  }
  if(Button("", 45, height-40, 30, 30, 15)){
    println("-");
  }
  Toggle(true, 195, height-40);
  
  textSize(35);
  fill(txcolor);
  textAlign(LEFT, CENTER);
  text("+", 17, height-32);
  text("-", 54, height-32);
  textAlign(CENTER, CENTER);
  text("COM2", 137, height-32);
  
}  
