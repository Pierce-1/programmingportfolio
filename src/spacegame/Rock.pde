class Rock {
  int x, y, diam, speed, health;
  PImage rockR2;

  // Contructor
  Rock() {
    x = int(random(-0.3*width, 1.7*width));
    y = -100;
    health = diam/5;
    diam = int(random(50, 100));
    speed = int(random(5, 10));
    if (x>width/2) {
      speed = -speed;
      rockR2 = loadImage("rockR2.png");
    } else {
      rockR2 = loadImage("rockR2Mirror.png");
    }
  }

  void display() {
    imageMode(CENTER);
    //rotate(-PI/3.0);
    rockR2.resize(diam, diam);
    image(rockR2, x, y);
    //rotate(PI/3.0);
  }

  void move() {

    if (speed>0) {
      y += speed;
    } else {
      y -= speed;
    }
    x += speed;
  }
  boolean reachedBottom() {
    if (y>height+400) {
      return true;
    } else {
      return false;
    }
  }
}
