// Declare an enum with the possible flows
enum Direction{
  WAIT_FLOW,
  LEFT_FLOW,
  RIGHT_FLOW
}
// Declare a class of flow control
class flow{ 
    int       sequence;
    Direction flow_dir;
    
  flow() {
    flow_dir = Direction.WAIT_FLOW;
  } 
  void set(Direction _dir){
    flow_dir = _dir;
  }
    Direction get(){
    return flow_dir;
  }
}
  
  
/**
  **************************************************************************************************
  * @brief      Serial event parser 
  * @details    Common for both serial channels
  **************************************************************************************************
**/
void serialEvent(Serial port){ 
  String input = port.readStringUntil('\n');  // read the incoming serial data:
  
  if (input == null) {
      return;
  }
  
  //input = trim(input);
  
  if(port == serial_left.get_port()){
    print("LEFT> \t");
    println(trim(input)); 
    
    flow_control.set(Direction.LEFT_FLOW);
    text_area_left = text_area_left +input;
  }else{
    print("RIGHT> \t");
    println(trim(input)); 
    
    flow_control.set(Direction.RIGHT_FLOW);
    text_area_rght = text_area_rght +input;
  }
  println(input); 
} 
