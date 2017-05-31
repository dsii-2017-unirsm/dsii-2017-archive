// Variazione_06 10Print by francescopaolini
// 2017 © francescopaolini, Daniele @Fupete and the course DSII2017 @UniRSM  
// github.com/fupete — github.com/dsii-2017-unirsm
// Educational purposes, MIT License, 2017, San Marino

int w = 16;
int h = 16;
int index = 0;

void setup() {
  size(640, 384);
  background(255, 255, 255);
  strokeWeight(3);
  stroke(0);
}

void draw() {

  int x1 = w*index;
  int x2 = x1 + w;
  int y1 = h*23;
  int y2 = h*24;

  if (random(2) <1) {
    line(x2, y1, x1, y2);
  } else {
    line (x1, y1, x2, y2);
  }

  if (index == width/w) {
    PImage p = get(0, h, width, h*23);
    background(255, 255, 255);
    set(0, 0, p);
    index = 0;
  }
}

void mouseMoved() {
  index ++;
  if (index > 40) {
    index = 0;
  } 
}

void keyPressed() {
   strokeWeight(random(1, 6));
}
