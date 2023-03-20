
// Declare a class of flow control
class Flow{ 
    int       sequence = 0;
    Direction flow_dir;
    String[]  array = new String[0];
  Flow() {
    flow_dir = Direction.WAIT_FLOW;
  } 
  
  //Set new direction
  void set(Direction _dir){
    if(flow_dir != _dir){
      
      //Release sequence container
      if(flow_dir == Direction.LEFT_FLOW){
        println("LEFT>");
        side_left.update(array);
        belt.update(array,flow_dir); 
      }else{
        println("RIGHT>");
        side_rght.update(array);
        belt.update(array,flow_dir); 
      }

      //Reset sequence container
      array = new String[0];
      flow_dir = _dir;
      sequence = 0;
    }
  }
  
  //Get current direction
  Direction get(){
    return flow_dir;
  }
  
  //Add income string to temporary container
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
