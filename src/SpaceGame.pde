// Pierce Leavitt | Nov 29 2022| SpaceGame

SpaceShip s1;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
Star[] stars = new Star[100];
Timer rockTimer;
Timer puTimer;
int score, level, rockTime, rockCount, laserCount;
boolean play;

void setup() {
  size(800, 800);
  frameRate(30);
  s1 = new SpaceShip();
  rockTime = 1000;
  rockCount = 0;
  laserCount = 0;
  rockTimer = new Timer(500);
  rockTimer.start();
  puTimer = new Timer(5000);
  puTimer.start();
  for (int i=0; i<stars.length; i++) {
    stars[i] = new Star();
  }
  score = 0;
  level = 1;
  play = false;
}

void draw() {
  if (!play) {
    startScreen();
  } else {

    background(0);



    // Render Stars
    for (int i=0; i<stars.length; i++) {
      stars[i].display();
      stars[i].move();
    }

// Adding PowerUps
    if (puTimer.isFinished()) {
      powerups.add(new PowerUp());
      puTimer.start();
    }
    // Render PowerUps
    for (int i = 0; i < powerups.size(); i++) {
      PowerUp pu = powerups.get(i);
      if (pu.intersect(s1)) {
        if (pu.type == 'H') {
          s1.health+=100;
        } else if (pu.type == 'A') {
          s1.ammo+=100;
        } else if(pu.type == 'T'){
        s1.turretCount++;
      }
      powerups.remove(pu);
      }
      if (pu.reachedBottom()) {
        powerups.remove(pu);
      } else {
        println(powerups.size());
        pu.display();
        pu.move();
      }
    }
    
    
    // Adding Rocks
    if (rockTimer.isFinished()) {
      rocks.add(new Rock());
      rockTimer.start();
      rockCount++;
    }


    // Render Rocks
    for (int i = 0; i < rocks.size(); i++) {
      Rock r = rocks.get(i);
      if (s1.intersect(r)) {
        s1.health-=r.diam;
        score+=100;
        // todo: add health to rock
        // todo: make am explosion sound
        // todo: make an explosion animation
        rocks.remove(r);
      }
      if (r.reachedBottom()) {
        rocks.remove(r);
      } else {
        println("Rocks" + rocks.size());
        r.display();
        r.move();
      }
    }

    
    noCursor();

    // Render Lasers
    for (int i = 0; i < lasers.size(); i++) {
      Laser l = lasers.get(i);
      for (int j = 0; j< rocks.size(); j++) {
        Rock r = rocks.get(j);
        if (l.intersect(r)) {
          score+=100;
          // does something happen to level?
          // add explode sound
          //
          lasers.remove(l);
          rocks.remove(r);
        }
      }
      //for loop for rocks
      if (l.reachedTop()) {
        lasers.remove(l);
        println("Lasers:" + lasers.size());
      } else {
        l.display();
        l.move();
        for (int j = 0; j< rocks.size(); j++) {
        }
      }
    }
    if (mousePressed && (mouseButton == LEFT)&& s1.canFire()) {
      lasers.add(new Laser(s1.x, s1.y));
    }
    s1.display();
    s1.move(mouseX, mouseY);
    infoPanel();
    if (s1.health<1) {
      gameOver();
    }
  }
}


void keyPressed() {
  if (mousePressed && (mouseButton == LEFT)&& s1.canFire()) {
    lasers.add(new Laser(s1.x, s1.y));
  }
}
void infoPanel() {
  fill(128, 128);
  rectMode(CENTER);
  rect(width/2, 25, width, 50);
  fill(180);
  textSize(35);
  textAlign(CENTER);
  text("Score: " + score +
    " | Health " + s1.health +
    " | Level: " + level +
    " Ammo:" +s1.ammo, width/2, 40);
}
void startScreen() {
  background (0);
  fill(255);
  textAlign(CENTER);
  textSize(40);
  text("Press any key To Play", width/2, height/2);
  if (keyPressed) {
    play = true;
  }
}

void gameOver() {
  background (0);
  fill(255, 0, 0);
  textAlign(CENTER);
  textSize(100);
  text("GAME OVER", width/2, height/2);
  play = false;
  noLoop();
}

void ticker() {
}
