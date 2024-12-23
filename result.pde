  public class result{
    float xb = 410;
    float yb = 80;
    float xwb = 180;
    float yhb = 90;
    float xbtn = 455;
    float ybtn = 480;
    float wbtn = 90;
    float hbtn = 40;
    String [] cols = {"WPM","Accuracy","Right","Wrong"};
    
    void bar() {
      for (int i = 0; i < 4; i++) {
        fill(255);
        rect(xb, yb + (i * yhb), xwb, yhb, 5);
  
        fill(0);
        textSize(18);
        textAlign(LEFT, CENTER);
        switch (i) {
        case 0:
          text("WPM:", xb + 5, yb + ((i * yhb) + (yhb / 4)));
          text(s.getWPM(), xb + 5, yb + ((i * yhb) + (yhb / 4) + 30));
          break;
        case 1:
          text("Accuracy:", xb + 5, yb + ((i * yhb) + (yhb / 4)));
          text(String.format("%.2f%%", s.getAccuracy()), xb + 5, yb + ((i * yhb) + (yhb / 4) + 30));
          break;
        case 2:
          text("Right:", xb + 5, yb + ((i * yhb) + (yhb / 4)));
          text(s.getRight(), xb + 5, yb + ((i * yhb) + (yhb / 4) + 30));
          break;
        case 3:
          text("Wrong:", xb + 5, yb + ((i * yhb) + (yhb / 4)));
          text(s.getWrong(), xb + 5, yb + ((i * yhb) + (yhb / 4) + 30));
          break;
        default:
          break;
        }
      }
    }
  
    
    void ren_btn(){
      fill(255);
      rect(xbtn,ybtn,wbtn,hbtn,5);
      fill(0);
      textSize(18);
      textAlign(CENTER, CENTER);
      text("Reset", xbtn + wbtn / 2, ybtn + hbtn / 2);
    }
    
    
    void mousePressed(){
      if(mouseX > xbtn && mouseX < xbtn + wbtn && mouseY > ybtn && mouseY < ybtn + hbtn){
        Time.resetTimer();
        //s.resetScore();
        used.clear();
        generateFword();
        bar.clearInputBar();
        bar.resetTarget(bars);
        bar.sethw(0,0);
      }
    }
  }
