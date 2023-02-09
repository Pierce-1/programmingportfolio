class Laser {
  int x, y, w, h, speed, damage;
  PImage laser;

  // Contructor
  Laser(int x, int y) {
    this.x = x;
    this.y = y;
    w = 10;
    h = 12;
    speed = 10;
    laser = loadImage("laser.png");
    damage = 4;
  }

  void display() {
    imageMode(CENTER);
    laser.resize(w, h);
    image(laser, x, y);
  }

  void move() {
    y -= speed;
  }

  boolean reachedTop() {
    if (y<-10) {
      return true;
    } else {
      return false;
    }
  }


boolean intersect(Rock r) {
    float d = dist(x, y, r.x, r.y);
    if (d<40) { // refine the collision detection
      return true;
    } else {
      return false;
    }
  }
  }
