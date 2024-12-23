import java.util.Random;
keyboard keyboard ;
int xkeyboard = 190;
int ykeyboard = 400;
inputbar bar ;
timer Time = new timer();
result Result = new result();
ArrayList<String> kata;
db db;
ArrayList<Integer> used = new ArrayList<Integer>();
String bars ;
Random rand = new Random();
int randnum;
int c;
boolean render = false;
score s;
boolean rulePage = true;
rule rules;

void setup(){
  frameRate(144);
  size(1000, 650);
  keyboard = new keyboard(190,400);
  db = new db();
  kata = db.getKata();
  bar =  new inputbar();
  generateFword();
  rules = new rule();
}

void draw(){
  background(255);
  bar.getColort();
  if (Time.isTimeUp()) {
    render = true;
    s = new score(bar.getHit(),bar.getWrong());
  }
  
  //println("Is Time Up: " + Time.isTimeUp());
  if(render && !rulePage){
    Result.bar();
    Result.ren_btn();
  }else if(!render && !rulePage){
    bar.input(bars, 190,350,144);
    Time.time(760, 350);
    keyboard.renderkeyBoard();
  }else if(rulePage){
    rules.drawRulePage();
  }
  
}


void generateFword(){
  randnum = rand.nextInt(1, kata.size());
  used.add(2);
  bars = kata.get(randnum);
}

void keyPressed(){
  bar.txtpressed();
  c = bar.colorkey();
  keyboard.keyOnPressed(c);
  Time.keyOnPressed();
  if(keyCode == 10 || keyCode == 32){
    randnum = rand.nextInt(1, kata.size());
    if(used.contains(randnum)){
      randnum = rand.nextInt(1, kata.size());
    }else{
      bars = kata.get(randnum);
      used.add(randnum);
      bar.setnewRender(true);
      bar.setColorb(true);
    }
  }
  if(keyCode == 32 && rulePage){
    rulePage = false;
  }
}

void keyReleased(){
  keyboard.keyOnReleased();
}

void keyPress(){
  Time.keyOnPressed();
}

void mousePressed(){
   if (render) {
    Result.mousePressed();
    render = false; 
  }
}

//void resultPage() {
//  Result.bar();
//  Result.ren_btn();
//}
