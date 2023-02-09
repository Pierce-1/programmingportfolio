// Pierce Leavitt | October 7, 2022 | Screen Saver App

float xpos;
float ypos;
float strokeW;
float pointCount;


void setup() {
  background(128);
  size(displayWidth, displayHeight);
  xpos = random(width);
  ypos = random(height);
  frameRate(10);
  fullScreen();
}

void draw() {
  strokeW = random(1, 7);
  pointCount = random(height/20, width/10);


  stroke(random(10), random(60, 120), random(60, 180));
  // Edge detection
  if (xpos > width || xpos < 0 || ypos > height || ypos < 0) {
    xpos = random(width);
    ypos = random(height);
  }
  //Walker program
  else {
    int rand = int(random(4));
    if (rand==0) {
      strokeWeight(strokeW);
      moveLeft(xpos, ypos, pointCount);
    } else if (rand==0) {
      strokeWeight(strokeW);
      moveUp(xpos, ypos, pointCount);
    } else if (rand==1) {
      strokeWeight(strokeW);
      moveRight(xpos, ypos, pointCount);
    } else {
      strokeWeight(strokeW);
      moveDown(xpos, ypos, pointCount);
    }

    //if (random(100)>70) {
    //  strokeWeight(strokeW);
    //  moveLeft(xpos, ypos, pointCount);
    //} else if (random(100)>65) {
    //  strokeWeight(strokeW);
    //  moveUp(xpos, ypos, pointCount);
    //} else if (random(100)>55) {
    //  strokeWeight(strokeW);
    //  moveDown(xpos, ypos, pointCount);
    //} else {
    //  strokeWeight(strokeW);
    //  moveRight(xpos, ypos, pointCount);
    //}
  }
}

void moveRight(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX+i, startY);
    xpos = startX + i;
    ypos = startY;
  }
}
void moveLeft(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX-i, startY);
    xpos = startX - i;
    ypos = startY;
  }
}
void moveDown(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX, startY+i);
    xpos = startX;
    ypos = startY+i;
  }
}
void moveUp(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX, startY-i);
    xpos = startX;
    ypos = startY - i;
  }
}
