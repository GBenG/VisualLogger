//Common variables//

//Colors
color       bgcolor     = color( 26, 31, 40 );
color       trcolor     = color( 230, 219, 116, 75 );
color       cncolor     = color( 117, 113, 94 );

color       txcolor     = #747983;


//Serial port
class serial_port{ 
  public
    Serial      serial_port = null;             // the serial port
    String      serial_list;                    // list of serial ports
    int         serial_list_index = 0;          // currently selected serial port 
    int         num_serial_ports = 0;           // number of serial ports in the l
    int         serial_speed = 115200;
    serial_port () {  
  } 
  void update(){
      serial_list = Serial.list()[serial_list_index];
      num_serial_ports = Serial.list().length;
      
      printArray(Serial.list());//DBG
  }
  void inc(){
    if (serial_list_index < (num_serial_ports - 1)) {
      serial_list_index++;
      serial_list = Serial.list()[serial_list_index];      // move one position up in the list of serial ports
    }
  }
  void dec(){
    if (serial_list_index > 0) {      
      serial_list_index--;
      serial_list = Serial.list()[serial_list_index];      // move one position down in the list of serial ports
    }
  }
  String get(){
    return serial_list;
  }
} 
