//Common variables//

//Colors
color       bgcolor     = color( 26, 31, 40 );
color       trcolor     = color( 230, 219, 116, 75 );
color       cncolor     = color( 117, 113, 94 );

color       txcolor     = #747983;


//Serial port class
class serial_port{ 
    Boolean     serial_connection = false;
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
  String get_name(){
    return serial_list;
  }
  Serial get_port(){
    return serial_port;
  }
  Boolean get(){
    return serial_connection;
  }
  void set(Boolean toggle){
    if( serial_connection != toggle ){
      serial_connection = toggle;
      
      if( toggle == true ){
        println(serial_list+" Connect");
        if(serial_port == null){
          serial_port = open_port(Serial.list()[serial_list_index], serial_speed);       // connect to the selected serial port
          serial_port.bufferUntil('\n');
          serial_port.clear();
        }
      }else{
        println(serial_list+" Disconnect");
        serial_port.clear();
        serial_port.stop();
        serial_port = null;
      }
    }
  }
} 
