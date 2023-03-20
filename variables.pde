//Common variables//

//Colors
color       bgcolor     = color( 26, 31, 40 );
color       trcolor     = color( 230, 219, 116, 75 );
color       cncolor     = color( 117, 113, 94 );

color       txcolor     = #747983;
color       orng_out    = #f89300;
color       blue_out    = #0083cd;


// Declare an enum with the possible flows
enum Direction{
  WAIT_FLOW,
  LEFT_FLOW,
  RIGHT_FLOW
}


//Side class
class Side{ 
  String[]  container = new String[0];
  Side(){
  }
  void update(String[] _arr){
    container = new String[0];
    container = concat(container, _arr);
    
    //Print sequence container
    println("################");
    printArray(container);
    println("^^^^^^^^^^^^^^^^");   
  }
  String[] get(){
    return container;
  }
}
