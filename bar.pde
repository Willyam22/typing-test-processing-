public class inputbar{
  private float sx = 560;
  private float sy = 40;
  private String txt = "";
  private String txt1 = "";
  private boolean hold ;
  private int SKursor = 0;
  private int kurH = 1;
  private int kurP =1;
  private boolean blink = true;
  private ArrayList<Integer> colort = new ArrayList<Integer>();
  private boolean newRender = true;
  private int txt1w ;
  private boolean colorb = true;
  private boolean iskey = false;
  private String skey;
  private int fw;
  private int colork;
  private String[][] rows = {{"`","1","2","3","4","5","6","7","8","9","0","-","="},
                     {"Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P","[","]"},
                     {"A", "S", "D", "F", "G", "H", "J", "K", "L",";","\""},
                     {"Z", "X", "C", "V", "B", "N", "M",",",".","/"}};
                     
  private int hit ;
  private int wrong;
  
  
  
  public inputbar(){
    PFont f1 = loadFont("AgencyFBBold28.vlw");
    textFont(f1);
  }
  
  void settxt1(String x){
    this.txt1 = x;
  }
  
  void getColort(){
    println(colort);
  }
  
  void input(String txt1,int x , int y, int rate){
    stroke(0);
    if(newRender){
      txt1w = x + int(sx)/2;
    }
    textAlign(LEFT);
    textSize(28);
    text(txt,x + 5,y + (sy -10));
    //text(txt1,x + sx /2, (y -sy) + (sy /2));
    targetRender(txt1,x,y);
    noFill();
    rect(x, y, sx, sy); 
    if(textWidth(txt) > sx - 20){
      hold = false;
    }else{
      hold = true;
    }
    kursor(x,y,rate);
  }
  
  void txtpressed(){
    if(keyCode == 8){
      if (txt.length() != 0  ){
        txt = txt.substring(0,txt.length()-1);
        if(txt.length() <= txt1.length()){
          if(colort.size() == txt.length()){
            colort.set(txt.length()-1,#000000);
          }else{
            colort.set(txt.length(),#000000);
          }
        }
        if(!colorb){
          if(txt.length() == fw ){
            colorb = true;
          }
        }
      }
    }
    if(keyCode == 10 || keyCode == 32){
      if(txt.equals(txt1)){
        hit += 1;
      }else{
        wrong += 1;
      }
      txt = "";
    }
    
    for(int i = 0; i <rows.length;i++){
      for (String x : rows[i]){
        skey = String.valueOf(key);
        if(skey.equals("'")){
          skey  = "\"";
        }else{
          skey = skey.toUpperCase();
        }
        if(x.equals(skey)){
          iskey = true;
          if(hold){
            txt = txt + key;
          }
        }
      }
    }
  }
  
  void setnewRender(boolean x){
    this.newRender = x;
    colort.clear();
  }
  
 
  void targetRender(String txt1,int x, int y){
    this.txt1 = txt1;
    if(newRender){
      for(int i = 0; i < txt1.length(); i++){
        colort.add(#000000);
      }
      newRender = false;
    }
    for(int i = 0; i < txt1.length(); i++){
      fill(colort.get(i));
      text(txt1.charAt(i), txt1w ,(y -sy) + (sy /2));
      txt1w = txt1w + int(textWidth(txt1.charAt(i)));
    }
    txt1w = x + int(sx)/2;
    targetChange(txt1);
  }
  
  void targetChange(String txt1){
    if(iskey){
      int point = txt.length()-1;
      if(point >= 0 && point <= txt1.length()-1){
        if(txt.charAt(point) != txt1.charAt(point) && colorb){
          colorb = false;
          colorkey();
          fw = point;
        }
        
        if(colorb){
          colort.set(point,#03ff46);
          colork = #03ff46;
        }else{
          colort.set(point,#ff0307);
          colork = #ff0307;
        }
      }
    }
    iskey = false;
    
  }
  
  int colorkey(){
    int colork;
    if(colorb){
      colork = #03ff46;
    }else{
      colork = #ff0307;
    }
    return colork;
  }
  
  void kursor(int x, int y, int rate){
    stroke(SKursor);
    line(x + 5 + textWidth(txt) ,y + 5, x + 5 + textWidth(txt) ,y + sy - 5);
    if(kurH % (rate /2 ) == 0){
      SKursor = 255;
      kurH = 1;
      blink = false;
    } 
    if(kurP % (rate /2)== 0){
      SKursor = 0;
      kurP = 1;
      blink = true;
    }
    if (blink){
      kurH++;
    }else if(!blink){
     kurP++;
    }
  }
  
  public void clearInputBar() {
    txt = "";
    setnewRender(true);
  }
  
  public void resetTarget(String newTarget) {
    txt1 = newTarget;
    colort.clear();
    for (int i = 0; i < newTarget.length(); i++) {
      colort.add(#000000);
    }
    newRender = false;
  }
  
  int getHit(){
    return this.hit;
  }
  
  int getWrong(){
    return this.wrong;
  }
  
  void sethw(int h, int w){
    this.hit = h;
    this.wrong = w;
  }
  void setColorb(boolean cx ){
    this.colorb = cx;
  }
  
  
   
}
