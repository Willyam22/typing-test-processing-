int gameState = 0;
int rx = 25;
int ry = 100;
String [] rule = {"1. Ketik huruf apapun untuk memulai permainan",
                  "2. Tekan BACKSPACE atau ENTER ketika kata inputan sesuai dengan kalimat",
                  "3. Ketik sebanyak kata sampai waktu habis"};

public class rule{  

    

    void drawRulePage() {
    background(255);
    fill(0);
    textSize(100);
    textAlign(CENTER);
    text("RULES", rx * 20, ry * 1.3);
  
    textSize(30);
    textAlign(LEFT);
    for (int i = 0; i < rule.length; i++) {
      text(rule[i], rx, ry * (2.5 + i));
    }
    fill(155);
    textSize(20);
    textAlign(CENTER);
    text("Press SPACE to play", rx * 20, ry * 5.9);
  }
}
