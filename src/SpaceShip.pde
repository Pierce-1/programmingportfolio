class SpaceShip {
  int x, y, w, ammo, turretCount, health, animFrame;
  PImage shipR1, shipR2, shipR3;

  // Constructor
  SpaceShip() {
    animFrame = 1;
    x = 0;
    y = 0;
    w = 100;
    ammo = 1000000;
    turretCount = 1;
    health = 100;
    shipR1 = loadImage("shipR1.png");
    shipR2 = loadImage("shipR3.png");
    shipR3 = loadImage("shipR4.png");
  }

  void display() {
    imageMode(CENTER);
    shipR1.resize(100, 100);
    shipR2.resize(100, 100);
    shipR3.resize(100, 100);


    if (animFrame == 1) {
      image(shipR1, x, y);
      animFrame=2;
    } else if (animFrame == 2) {
      image(shipR2, x, y);
      animFrame=3;
    } else if (animFrame == 3) {
      image(shipR3, x, y);
      animFrame=1;
    }
  }

  boolean canFire() {
    if (ammo>0) {
      ammo--;
      return true;
    } else {
      return false;
    }
  }

  void move(int tempX, int tempY) {
    x = tempX;
    y = tempY;
  }


  boolean intersect(Rock r) {
    float d = dist(x, y, r.x, r.y);
    if (d<r.diam/2) {
      health -= 1;
      return true;
    } else {
      return false;
    }
  }
}
