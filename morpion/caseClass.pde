class Case {
  int x,y,w,h;
  int used = 0;
  Case(int xc,int yc,int wc,int hc) {
    x=xc;
    y=yc;
    w=wc;
    h=hc;
  }
  
  boolean isPressed() {
    if(abs(mouseX-x)<w/2 && abs(mouseY-y)<h/2) return true;
    return false;
  }
  
  void show() {
    int ts = w/2;
    rectMode(CENTER);
    textAlign(CENTER);
    textSize(ts);
    fill(255);
    rect(x,y,w,h);
    if(used == 1) {
      fill(0);
      //rect(x,y,w/3,w/3);
      text("🟢",x,y+ts/2);
    } else if(used == 2) {
      fill(255,0,0);
      //rect(x,y,w/3,h/3);
      text("❌",x,y+ts/2);
    }
    //text((used ==1? "🟢 won" : "❌ won"),x,y);
  }
  
}