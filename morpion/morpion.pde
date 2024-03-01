Case[][] cases = new Case[3][3];
int wCase;
int player;
boolean end;

Button btnRestart;

void setup() {
  background(200);
  end = false;
  player = 1;
  wCase = width/3;
  btnRestart = new Button(width/2,height-(width/3),width/2,height/14);
  for(int x = 0; x<3; x++){
    for(int y = 0; y<3; y++) {
      cases[x][y] = new Case(x*wCase+wCase/2,y*wCase+wCase/2,wCase,wCase);
    }
  }
  //println();
}

void draw() {
  //background(200);
  if(!end) {
  for(int x = 0; x<3; x++){
    for(int y = 0; y<3; y++) {
      cases[x][y].show();
    }
  }
  } else {
    if(testWin() ==0) {
      textSize(wCase/2.4);
      textAlign(CENTER);
      fill(0);
      text("nobody won",width/2,height-(width/3*2));
    } else {
      textSize(wCase/2.4);
      textAlign(CENTER);
      fill(0);
      text((testWin()==1? "🟢 won" : "❌ won"),width/2,height-(width/3*2));
    }
    fill(255);
    btnRestart.show();
    textSize(50);
    fill(0);
    text("RESTART",btnRestart.x,btnRestart.y,btnRestart.w,btnRestart.h);
  }
  
  if(testWin()!=-1) {//somebody won
    end = true;
    //println(true);
  }

}

void mouseReleased() {
  if(!end) {
  for(int x = 0; x<3; x++){
    for(int y = 0; y<3; y++) {
      if(cases[x][y].isPressed() && cases[x][y].used == 0) {
        cases[x][y].used = player;
        player = (player==1? 2:1);
      }
    }
  }
  } else if(btnRestart.isPressed()) setup();
}

int testWin() {
  for(int y=0; y<3; y++) {//horizontal test
  Case c = cases[1][y];
  if(c.used != 0) {
    if(cases[0][y].used == c.used && cases[2][y].used == c.used) {
      return c.used;
      }
  }
  }
  for(int x=0; x<3; x++) {//vertical test
  Case c = cases[x][1];
  if(c.used != 0) {
    if(cases[x][0].used == c.used && cases[x][2].used == c.used) return c.used;
  }
  }
  Case c = cases[1][1];
  if(c.used != 0) {
    if(cases[0][0].used == c.used && c.used == cases[2][2].used) return c.used;
    if(cases[0][2].used == c.used && c.used == cases[2][0].used) return c.used;
  }
  
  for(int x = 0; x<3; x++){
    for(int y = 0; y<3; y++) {
      if(cases[x][y].used == 0) {
        return -1;
      }
    }
  }
  
  return 0;
}