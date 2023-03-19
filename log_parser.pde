// Declare an enum with the possible flows
enum Direction{
  WAIT_FLOW,
  LEFT_FLOW,
  RIGHT_FLOW
}
// Declare a class of flow control
class flow{ 
    int       sequence = 0;
    Direction flow_dir;
    String[]  array = new String[0];
  flow() {
    flow_dir = Direction.WAIT_FLOW;
  } 
  void set(Direction _dir){
    if(flow_dir != _dir){
      //Print sequence container
      println("################");
      printArray(array);
      println("^^^^^^^^^^^^^^^^");
      
      //Release sequence container (DRAFT)
      array_left = new String[0];
      arrayCopy(array_left,array);
      array_left = concat(array_left, array);
      
      //Reset sequence container
      array = new String[0];
      flow_dir = _dir;
      sequence = 0;
    }
  }
  Direction get(){
    return flow_dir;
  }
  void add(String _str){
    array = append(array, _str);
    sequence++;
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
  
  if(input == null){
      return;
  }
  
  //input = trim(input);
  
  if(port == serial_left.get_port()){
    //print("LEFT> \t");
    //println(trim(input)); 
    
    flow_control.set(Direction.LEFT_FLOW);
    flow_control.add(trim(input));
    //text_area_left = text_area_left +input;
  }else{
    //print("RIGHT> \t");
    //println(trim(input)); 
    
    flow_control.set(Direction.RIGHT_FLOW);
    flow_control.add(trim(input));
    //text_area_rght = text_area_rght +input;
  }
  //println(input); 
} 
