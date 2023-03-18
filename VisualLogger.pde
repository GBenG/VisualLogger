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
  
  if(Button("", 10, height-40, 30, 30)){
    println("+");
  }
  if(Button("", 160, height-40, 30, 30)){
    println("-");
  }
  if(Button("Connect", 195, height-40, 80, 30)){
    println("C");
  }
  
  textSize(35);
  fill(txcolor);
  textAlign(LEFT, CENTER);
  text("+", 17, height-32);
  text("-", 170, height-32);
  textAlign(CENTER, CENTER);
  text("COM1", 100, height-32);
}  
