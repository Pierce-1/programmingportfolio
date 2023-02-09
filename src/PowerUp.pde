class PowerUp {
  int x, y, diam, speed;
  char type;
  //PImage PowerUp;

  // Contructor
  PowerUp() {
    x = int(random(width));
    y = -100;
    diam = int(random(100));
    speed = int(5);
    int rand = int(random(3));
    if (rand == 0) {
      type = 'H';
    } else if (rand == 1) {
      rand = 'A';
    } else {
      type = 'T';
    }
    //if (x>width/2) {
    //  speed = -speed;
    //  rockR2 = loadImage("rockR2.png");
    //} else {
    //  rockR2 = loadImage("rockR2Mirror.png");
    //}
  }

  void display() {
    fill(0,222,0);
    ellipse(x,y,diam,diam);
    fill(0);
    text(type,x,y);
  }

  void move() {
      y += speed;
  }
  
  boolean reachedBottom() {
    if (y>height+400) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect(SpaceShip s1) {
    float d = dist(x, y, s1.x, s1.y);
    if (d<10) {
      return true;
    } else {
      return false;
    }
  }
}
