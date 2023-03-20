//Belt class
class Belt{
  class Box{ 
    String[]  container = new String[0];
    Direction flow_dir  = Direction.WAIT_FLOW;
    int       hight = 0;
    Box(){
    }
  }
  Box[] box = new Box[1];
  int   cur_index  = 0;
  int   new_index  = 0;
  int   leftMargin = 50;
  int   topMargin  = 50;
  Belt(){
    box[0] = new Box();
  }
  void update(String[] _arr, Direction _dir){
    
      //Prevent blank init
      if( _dir == Direction.WAIT_FLOW ) return;

      //Fill the box
      box[new_index].flow_dir = _dir;
      box[new_index].container = concat(box[new_index].container, _arr);  
      println("INDEX: "+new_index);
      
      // Increase the length of the array by 1
      box = (Box[]) expand(box, box.length + 1);
      
      //Move belt to next box
      new_index++;
      cur_index = new_index-1;
      box[new_index] = new Box();
  }
  void draw(){
    
    textSize(20);
    fill(bgcolor);
    textAlign(LEFT,TOP);

    float lineHeight = textAscent() + textDescent();
    
    for(int i = 0; i < box.length; i++){
      
      if(box[cur_index].container.length != 0){
        if( box[cur_index].flow_dir == Direction.LEFT_FLOW ){
          leftMargin = 50;
          stroke(orng_out);
          rect(leftMargin-10, topMargin-5, getLongestStringWidth(box[cur_index].container)+20, lineHeight*box[cur_index].container.length+10, 10);
        }else if( box[cur_index].flow_dir == Direction.RIGHT_FLOW ){
          leftMargin = width/2+50;
          stroke(blue_out);
          rect(leftMargin-10, topMargin-5, getLongestStringWidth(box[cur_index].container)+20, lineHeight*box[cur_index].container.length+10, 10);
        }
      }
    }
  }
}
