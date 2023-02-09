// Pierce Leavitt | November 1 2022 | Calculator
Button[] numButtons = new Button[10];
Button[] opButtons = new Button[12];
String dVal = "0.0";
float l, r, result;
char op = ' ';
boolean left = true;


void setup() {
  size(240, 420);
  numButtons[1] = new Button(20, 100, 40, 40, '1');
  numButtons[2] = new Button(20, 140, 40, 40, '2');
  numButtons[3] = new Button(50, 120, 40, 40, '3');
  numButtons[4] = new Button(80, 100, 40, 40, '4');
  numButtons[5] = new Button(80, 140, 40, 40, '5');
  numButtons[6] = new Button(110, 120, 40, 40, '6');
  numButtons[7] = new Button(140, 100, 40, 40, '7');
  numButtons[8] = new Button(140, 140, 40, 40, '8');
  numButtons[9] = new Button(170, 120, 40, 40, '9');
  numButtons[0] = new Button(80, 310, 80, 60, '0');
  opButtons[0] = new Button(20, 200, 40, 40, '÷');
  opButtons[1] = new Button(20, 240, 40, 40, '±');
  opButtons[2] = new Button(50, 220, 40, 40, 'S');
  opButtons[3] = new Button(80, 200, 40, 40, 'x');
  opButtons[4] = new Button(80, 240, 40, 40, 'e');
  opButtons[5] = new Button(110, 220, 40, 40, '√');
  opButtons[6] = new Button(140, 200, 40, 40, '-');
  opButtons[7] = new Button(140, 240, 40, 40, '.');
  opButtons[8] = new Button(170, 220, 40, 40, '+');
  opButtons[9] = new Button(20, 340, 80, 60, 'C');
  opButtons[10] = new Button(80, 370, 80, 60, 'L');
  opButtons[11] = new Button(140, 340, 80, 60, '=');
}
void draw() {
  background(88);
  updateDisplay();
  for (int i=0; i <numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  for (int i=0; i <opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover(mouseX, mouseY);
  }
}

void keyPressed() {
  println("key:" + key);
  println("keyCode" + keyCode);
  if (keyCode == 49 || keyCode == 97) {
    handleEvent("1", true);
  } else if (keyCode == 50 || keyCode == 98) {
    handleEvent("2", true);
  } else if (keyCode == 51 || keyCode == 99) {
    handleEvent("3", true);
  } else if (keyCode == 52 || keyCode == 100) {
    handleEvent("4", true);
  } else if (keyCode == 53 || keyCode == 101) {
    handleEvent("5", true);
  } else if (keyCode == 54 || keyCode == 102) {
    handleEvent("6", true);
  } else if (keyCode == 55 || keyCode == 103) {
    handleEvent("7", true);
  } else if (keyCode == 56 || keyCode == 104) {
    handleEvent("8", true);
  } else if (keyCode == 57 || keyCode == 105) {
    handleEvent("9", true);
  } else if (keyCode == 48 || keyCode == 96) {
    handleEvent("0", true);
  } else if (keyCode == 61 || keyCode == 107) {
    handleEvent("+", false);
  } else if (keyCode == 45 || keyCode == 109) {
    handleEvent("-", false);
  } else if (keyCode == 47 || keyCode == 111) {
    handleEvent("÷", false);
  } else if (keyCode == 88 || keyCode == 106) {
    handleEvent("x", false);
  } else if (keyCode == 46 || keyCode == 110) {
    handleEvent(".", false);
  } else if (keyCode == 10) {
    handleEvent("=", false);
  } else if (keyCode == 12 || keyCode == 8) {
    handleEvent("C", false);
  }
}
void handleEvent(String val, boolean num) {
  if (num && dVal.length()<15) {
    if (dVal.equals("0.0") || dVal.equals("0")) {
      dVal = val;
    } else {
      dVal += val;
    }
    if (left) {
      l = float(dVal);
    } else {
      r = float(dVal);
    }
  } else if (val.equals("C")) {
    dVal = "0.0";
    l = 0.0;
    r = 0.0;
    result = 0.0;
    left = true;
    op = ' ';
  } else if (val.equals("+")) {
    op = '+';
    dVal = "0";
    left = false;
  } else if (val.equals("-")) {
    op = '-';
    dVal = "0";
    left = false;
  } else if (val.equals("÷")) {
    op = '÷';
    dVal = "0";
    left = false;
  } else if (val.equals("x")) {
    op = 'x';
    dVal = "0";
    left = false;
  } else if (val.equals("=")) {
    performCalculation();
  } else if (val.equals(".")) {
    if (!dVal.contains(".")) {
      dVal += ".";
    }
  }
}
void mouseReleased() {
  for (int i = 0; i<numButtons.length; i++) {
    if (numButtons[i].on) {
      handleEvent(str(numButtons[i].val), true);
    }
  }
  for (int i = 0; i<opButtons.length; i++) {
    if (opButtons[i].on && opButtons[i].val == 'C') {
      handleEvent("C", false);
    } else if (opButtons[i].on && opButtons[i].val == '+') {
      handleEvent("+", false);
    } else if (opButtons[i].on && opButtons[i].val == '-') {
      handleEvent("-", false);
    } else if (opButtons[i].on && opButtons[i].val == '÷') {
      handleEvent("÷", false);
    } else if (opButtons[i].on && opButtons[i].val == 'x') {
      handleEvent("x", false);
    } else if (opButtons[i].on && opButtons[i].val == '.') {
      handleEvent(".", false);
    } else if (opButtons[i].on && opButtons[i].val == 'L') {
      if (left) {
        l=log(l);
        dVal = str(l);
      } else {
        r = log(r);
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == 'e') {
      if (left) {
        l= 2.71828189;
        dVal = str(l);
      } else {
        r = 2.71828189;
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == 'S') {
      if (left) {
        l = sq(l);
        dVal = str(l);
      } else {
        r = sq(r);
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == '±') {
      if (!dVal.contains("-")) {
        dVal = "-" + dVal;
      } else {
        dVal = dVal.replace("-", "");
      }
      if (left) {
        l = float(dVal);
      } else {
        r= float(dVal);
      }
    } else if (opButtons[i].on && opButtons[i].val == '√') {
      if (left) {
        l = sqrt(l);
        dVal = str(l);
      } else {
        r = sqrt(r);
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == '=') {
      handleEvent("=", false);
    }
  }
  println("L:" + l + " Op:" + op + " R:" + r + " Result:" + result + " Left:" + left);
}
void updateDisplay() {
  rectMode(CENTER);
  fill(100);
  rect(width/2, height/10.5, width-40, 40, 10);
  fill(0);
  textAlign(RIGHT);
  if (dVal.length()<12) {
    textSize(30);
  } else {
    textSize(40-1*dVal.length());
  }
  text(dVal, width-30, 50);
}
void performCalculation() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == 'x') {
    result = l * r;
  } else if (op == '÷') {
    result = l / r;
  }
  dVal = str(result);
  l = result;
  left = true;
}
