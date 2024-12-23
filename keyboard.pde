public class keyboard {
  private int xnum ;
  private int ynum ;

  private int wx= 40;
  private int hy = 40;
  private int fillColor = #ffffff;

  private String efxs;
  private int efx = 6;
  private boolean keychar = true;
  private boolean efxstart = false;

  private int xbox0;
  private int ybox0;
  private int xbox1;



  private HashMap<String, int[]> keyPositions = new HashMap<String, int[]>();
  private String[][] rows = {{"`", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "-", "=", "BACKSPACE"},
    {"Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P", "[", "]"},
    {"A", "S", "D", "F", "G", "H", "J", "K", "L", ";", "\"", "ENTER"},
    {"Z", "X", "C", "V", "B", "N", "M", ",", ".", "/"},
    {"SPACE"}};


  public keyboard(int x, int y) {
    stroke(0);
    fillkeyPos(x, y);
  }

  void keyOnReleased() {
    efxstart =true;
  }


  void keyOnPressed(int c) {
    if (keyCode == 8) {
      efxs = "BACKSPACE";
      if (keyPositions.get(efxs)[2] > 94 ) {
        keyPositions.get(efxs)[0] = keyPositions.get(efxs)[0] + efx /2 ;
        keyPositions.get(efxs)[1]= keyPositions.get(efxs)[1] + efx / 2;
        keyPositions.get(efxs)[2] = keyPositions.get(efxs)[2] - efx;
        keyPositions.get(efxs)[3]= keyPositions.get(efxs)[3] - efx;
        keyPositions.get(efxs)[4]= c;
      }
    } else if (keyCode == 10) {
      efxs = "ENTER";
      if (keyPositions.get(efxs)[2] >94 ) {
        keyPositions.get(efxs)[0] = keyPositions.get(efxs)[0] + efx /2 ;
        keyPositions.get(efxs)[1]= keyPositions.get(efxs)[1] + efx / 2;
        keyPositions.get(efxs)[2] = keyPositions.get(efxs)[2] - efx;
        keyPositions.get(efxs)[3]= keyPositions.get(efxs)[3] - efx;
        keyPositions.get(efxs)[4]= c;
      }
    } else if (keyCode == 32) {
      efxs = "SPACE";
      if (keyPositions.get(efxs)[2] > 356) {
        keyPositions.get(efxs)[0] = keyPositions.get(efxs)[0] +efx/2;
        keyPositions.get(efxs)[1]= keyPositions.get(efxs)[1] + efx/2;
        keyPositions.get(efxs)[2] = keyPositions.get(efxs)[2] - efx;
        keyPositions.get(efxs)[3]= keyPositions.get(efxs)[3] - efx;
        keyPositions.get(efxs)[4]= c;
      }
    } else if (keychar) {
      efxs = String.valueOf(key);
      if (efxs.equals("'")) {
        efxs = "\"";
      } else {
        efxs = efxs.toUpperCase();
      }
      try {
        if (keyPositions.get(efxs)[2] > 36) {
          keyPositions.get(efxs)[0] = keyPositions.get(efxs)[0] +efx/2;
          keyPositions.get(efxs)[1]= keyPositions.get(efxs)[1] + efx/2;
          keyPositions.get(efxs)[2] = keyPositions.get(efxs)[2] -efx;
          keyPositions.get(efxs)[3]= keyPositions.get(efxs)[3] - efx;
          keyPositions.get(efxs)[4]= c;
          Time.keyOnPressed();
        }
      }
      catch(Exception e) {
      }
    }
  }

  void fillkeyPos(int x, int y) {
    xbox0 = x;
    ybox0 = y;
    xbox1 = y + 80;
    for (int i = 0; i < rows.length; i++) {
      if (i == 0) {
        xnum = x;
        ynum = y;
      } else if (i == 1) {
        xnum = x + 60;
        ynum = y + 40;
      } else if (i ==2 ) {
        xnum = x + 80;
        ynum = y + 80;
      } else if (i == 3) {
        xnum = x + 100;
        ynum = y + 120;
      } else if (i == 4) {
        xnum = x + 120;
        ynum = y + 160;
      }
      for (String k : rows[i]) {
        int extraWidth = 0;
        if (k.equals("ENTER")) {
          extraWidth = 60;
        } else if (k.equals("BACKSPACE")) {
          extraWidth = 60;
        } else if (k.equals("SPACE")) {
          extraWidth = 320;
        }
        keyPositions.put(k, new int[]{xnum, ynum, wx + extraWidth, hy, fillColor});

        xnum = xnum + 40;
      }
    }
  }

  void renderkeyBoard() {
    if (efxstart) {
      keyPositions.clear();
      fillkeyPos(xbox0, ybox0);
      efxstart = false;
    }
    stroke(0);

    kotak(xbox0, ybox0, xbox1);

    for (String num_row : rows[0]) {
      drawKey(num_row, keyPositions.get(num_row)[0], keyPositions.get(num_row)[1], keyPositions.get(num_row)[2], keyPositions.get(num_row)[3], keyPositions.get(num_row)[4]);
    }
    for (String top_row : rows[1]) {
      drawKey(top_row, keyPositions.get(top_row)[0], keyPositions.get(top_row)[1], keyPositions.get(top_row)[2], keyPositions.get(top_row)[3], keyPositions.get(top_row)[4]);
    }
    for (String mid_row : rows[2]) {
      drawKey(mid_row, keyPositions.get(mid_row)[0], keyPositions.get(mid_row)[1], keyPositions.get(mid_row)[2], keyPositions.get(mid_row)[3], keyPositions.get(mid_row)[4]);
    }
    for (String bottom_row : rows[3]) {
      drawKey(bottom_row, keyPositions.get(bottom_row)[0], keyPositions.get(bottom_row)[1], keyPositions.get(bottom_row)[2], keyPositions.get(bottom_row)[3], keyPositions.get(bottom_row)[4]);
    }
    for (String space : rows[4]) {
      drawKey(space, keyPositions.get(space)[0], keyPositions.get(space)[1], keyPositions.get(space)[2], keyPositions.get(space)[3], keyPositions.get(space)[4]);
    }
  }

  void kotak(int x1, int y2, int x2) {
    fill(255);
    rect(x1, y2 + hy, 60, 40);
    rect(x1, y2 + hy + 40, 80, 40);
    rect(x1, y2 + hy + 80, 100, 40);
    rect(x1, y2 + hy + 120, 120, 40);

    rect(x1 + (13 * 40) + 100, y2 + hy, -80, 40);
    rect(x1 + (13 * 40) + 100, x2 + 40, -120, 40);
    rect(x1 + (13 * 40) + 100, x2 + 80, -140, 40);
  }

  void drawKey(String key, float x, float y, int wx, int hy, int fillColor) {
    fill(fillColor);
    rect(x, y, wx, hy);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(16);
    text(key, x + wx/2, y + hy/2);
  }
}
