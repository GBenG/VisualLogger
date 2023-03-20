//Belt class
class Belt{
  class Box{ 
    String[]  container = new String[0];
    Direction flow_dir;
    Box(){
    }
  }
  Box[] box = new Box[1];
  int   box_index = 0;
  Belt(){
  }
  void update(String[] _arr, Direction _dir){
    
      //Prevent blank init
      if( _dir == Direction.WAIT_FLOW ) return;
      
      //Create box on belt
      box[box_index] = new Box();
      
      //Fill the box
      box[box_index].flow_dir = _dir;
      box[box_index].container = concat(box[box_index].container, _arr);  
      println("INDEX: "+box_index);
      
      // Increase the length of the array by 1
      box = (Box[]) expand(box, box.length + 1);
      
      //Move belt to next box
      box_index++;
  }
}
