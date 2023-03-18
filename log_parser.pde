void serialEvent(Serial port){ 
  String input = port.readStringUntil('\n');  // read the incoming serial data:
  
  if (input == null) {
      return;
  }
  
  //input = trim(input);
  
  if(port == serial_left.get_port()){
    print("LEFT> \t");
    text_area_left = text_area_left +input;
  }else{
    print("RIGHT> \t");
    text_area_rght = text_area_rght +input;
  }
  println(input); 
} 
