class Button { //<>//
  // Member variables
  int x, y, w, h;
  color c1, c2;
  char val;
  boolean on;

  // Constructor
  Button(int x, int y, int w, int h, char val) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.val = val;
    c1 = color(120, 0, 0);
    c2 = color(85, 0, 20);
    on = false;
  }
  // Member Methods
  void display() {
    if (on) {
      fill(c2);
    } else {
      fill(c1);
    }
    // Start point is left most point of hexagon
    beginShape();
    vertex(x, y);
    vertex(x+w/4, y-h/2);
    vertex(x+w*3/4, y-h/2);
    vertex(x+w, y);
    vertex(x+w*3/4, y+h/2);
    vertex(x+w/4, y+h/2);
    endShape(CLOSE);

    textAlign(CENTER, CENTER);
    textSize(30);
    fill(0);
    if (val == 'C') {
      text("Clear", x+w/2, y-5);
    }
    else if (val == 'S') {
      text("x²", x+w/2, y-5);
    }
    else if (val == 'L') {
      text("ln", x+w/2, y-5);
    } 
    else {
      textSize(30);
      text(val, x+w/2, y-5);
    }
  }

  void hover(int mx, int my) {
    
    on = (mx>x+w/4 &&  mx<x+w*0.75 && my>y-h/2 && my<y+h/2);
  }
}
