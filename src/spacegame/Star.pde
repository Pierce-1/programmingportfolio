class Star {
  int x, y, diam, speed;
  //PImage star;

  // Contructor
  Star() {
    x = int(random(width));
    y = int(random(width));
    diam = int(random(2, 4));
    speed = int(random(2, 5));
    // star = loadImage("star.png");
  }

  void display() {
    fill(255, 255, 255);
    circle(x, y, diam);
  }

  void move() {
    if (y>height+5) {
      y= -10;
    }
    y += speed;
  }
  
    boolean reachedBottom() {
      return true;
    }
  }
 
