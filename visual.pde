float getLongestStringWidth(String[] array){
  String longestString = "";
  for (int i = 0; i < array.length; i++){
    if (array[i].length() > longestString.length()){
      longestString = array[i];
    }
  }
  return textWidth(longestString);
}
