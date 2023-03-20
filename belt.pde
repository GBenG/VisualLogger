//Belt class
class Belt{
  class Box{ 
    String[]  container = new String[0];
    Direction flow_dir  = Direction.WAIT_FLOW;
    int       offset = 0;
    Box(){
    }
  }
  Box[] box = new Box[1];
  int   cur_index  = 0;
  int   new_index  = 0;
  int   leftMargin = 50;
  int   topMargin  = 50;
  int   position   = 0;
  Belt(){
    box[0] = new Box();
  }
  void inc_pos(){
    position += 10;
  }
  void dec_pos(){
    if( position >= 10 ){
      position -= 10;
    }
  }
  void update(String[] _arr, Direction _dir){
    
      //Prevent blank init
      if( _dir == Direction.WAIT_FLOW ) return;

      //Fill the box
      box[new_index].flow_dir = _dir;
      box[new_index].container = concat(box[new_index].container, _arr);  
      
      //Print sequence container
      println("################");
      printArray(box[new_index].container);
      println("----------------"); 
      println("new_index: "+new_index+"cur_index: "+cur_index);
      println("flow_dir: "+box[new_index].flow_dir);
      println("INDEX: "+new_index);
      println("^^^^^^^^^^^^^^^^"); 
      
      // Increase the length of the array by 1
      box = (Box[]) expand(box, box.length + 1);
      
      //Move belt to next box
      new_index++;
      cur_index = new_index-1;
      box[new_index] = new Box();
  }
  void draw(){
    
    textSize(20);
    textAlign(LEFT,TOP);

    float lineHeight = textAscent() + textDescent();
    int y = 50;
    
    for(int i = 0; i < cur_index; i++){
      box[i].offset = 0;
    }

    for(int i = 0; i < cur_index; i++){
      if(box[i].container.length != 0){
        if( box[i].flow_dir == Direction.LEFT_FLOW ){

          leftMargin = 50;
          y = -position+50+box[i].offset;
          
          stroke(orng_out);
          noFill();
          rect(leftMargin-10, -position+topMargin-5+box[i].offset, getLongestStringWidth(box[i].container)+20, lineHeight*box[i].container.length+10, 10);
          line((leftMargin-10+getLongestStringWidth(box[i].container)+20),
                -position+topMargin-5+box[i].offset+(lineHeight*box[i].container.length+10)/2,
                width/2,
                -position+topMargin-5+box[i].offset+(lineHeight*box[i].container.length+10)/2);
 
          fill(orng_out);
          for (String str : box[i].container) {
            text(str, 50, y);
            y += lineHeight;
          }
          box[i+1].offset = box[i].offset+int(lineHeight*box[i].container.length)+10;
        }
        if( box[i].flow_dir == Direction.RIGHT_FLOW ){

          leftMargin = width/2+50;
          y = -position+50+box[i].offset;
          
          stroke(blue_out);
          noFill();
          rect(leftMargin-10, -position+topMargin-5+box[i].offset, getLongestStringWidth(box[i].container)+20, lineHeight*box[i].container.length+10, 10);
          line(width/2,
              -position+topMargin-5+box[i].offset+(lineHeight*box[i].container.length+10)/2,
              (leftMargin-10),
              -position+topMargin-5+box[i].offset+(lineHeight*box[i].container.length+10)/2);

          fill(blue_out);
          for (String str : box[i].container) {
            text(str, width/2+50, y);
            y += lineHeight;
          }    
          box[i+1].offset = box[i].offset+int(lineHeight*box[i].container.length)+10;
        }
      }
    }
  }
}
