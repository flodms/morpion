class Button {
  int x,y,w,h;
  Button(int xb,int yb,int wb,int hb) {
   x=xb;
   y=yb;
   w=wb;
   h=hb; 
  }
  
  boolean isPressed() {
    if(abs(mouseX-x)<w/2 && abs(mouseY-y)<h/2) {
      return true;
    } else return false;
  }
  
  void show() {
    rectMode(CENTER);
    rect(x,y,w,h);
  }
}