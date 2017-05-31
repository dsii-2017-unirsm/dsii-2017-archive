int index = 0;

void setup() {
  fullScreen();
  background(50);
  strokeWeight(2);
  stroke(200);
  smooth();
}

void draw() {
  int x1 = (width/20)*index;
  int x2 = x1 + (width/20);
  int y1 = (height/9)*8;
  int y2 = (height/9)*9;

  if (random(2) < 1) {
    line(x1, y1, x2, y2);
  } else {
    line(x2, y1, x1, y2);
  }

  index++;
  if (index == 20) {
    PImage p = get(0, height/9, width, height/9*8);
    background(50);
    set(0, 0, p);
    index = 0;
  }
}
