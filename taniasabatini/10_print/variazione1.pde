int w = 20;
int h = 100;
int index = 0;
void setup() {
  size(800, 800);
  background(#3FB8AF);
  strokeWeight(2);
  stroke(255);
  smooth();
  frameRate(60);
}
void draw() {
  int x1 = w*index; 
  int x2 = x1 + w; 
  int y1 = h*7;  
  int y2 = h*8;
  if (random(2) < 1) {
    line(x2, y1, x1, y2);
  } else {
    line(x1, y1, x2, y2);
  }
  index++;
  if (index == width/w) {
    PImage p = get(0, h, width, h*7);
    background(#3FB8AF);
    set(0, 0, p);
    index = 0;
  }
} 
