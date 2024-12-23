public class timer{
  private int x = 760;
  private int y = 350;
  private float tx = 50;
  private float ty = 40;
  private float dur = 60;
  private float txtX = x + tx/2;
  private float txtY = y + ty/2;
  private boolean timeRes = false;
  private boolean timeup;
  private String[][] rows = {{"`","1","2","3","4","5","6","7","8","9","0","-","="},
                     {"q", "w", "e", "r", "t", "y", "u", "i", "o", "p","[","]"},
                     {"a", "s", "d", "f", "g", "h", "j", "k", "l",";","\""},
                     {"z", "x", "c", "v", "b", "n", "m",",",".","/"}};
  
  void time(int x, int y){
    int min = floor(dur/60);
    int sec = int(dur%60);
    String durt = nf(min,2) + " : " + nf(sec,2);
    stroke(0);
    fill(255);
    if(timeRes){
      dur -= 1/frameRate;
      if(dur<=0){
        timeRes = false;
        timeup = true;
        
      }
    }
    rect(x,y,tx,ty);
    textAlign(CENTER);
    textSize(14);
    fill(0);
    text(durt,txtX,txtY);
  }
  
  boolean isTimeUp() {
    return timeup;
  }
  
  public void resetTimer() {
    dur = 60; 
    timeup = false; 
  }
  
  void keyOnPressed() {
    char keyChar = key;
    for (int i = 0; i < rows.length; i++) {
      for (int j = 0; j < rows[i].length; j++) {
        if (rows[i][j].charAt(0) == keyChar) {
          if (!timeRes) {
            timeRes = true;
          }
          return;
        }
      }
    }
  }
}
