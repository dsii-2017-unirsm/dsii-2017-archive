int w = 16;
int h = 16;
int index = 0;
int p = 16;

void setup() {
  size(640, 384);
  background(#000000);
  strokeWeight(3);
  stroke(255);
  smooth();
}

void draw() {
  int x1 = w*index;
  int x2 = x1 + w;
  int y1 = h*24;
  int y2 = h*24;
  int x3 = x1 + p;
  int y3 = p*23;

  if (random(2) < 1) {
    line(x1, y1, x2, y2);
    strokeWeight(1);
    
  } else if (random(2)<0.1) {
    line(x1, y1, x3, y3);
    strokeWeight(2);
    
  } else  if (random(2)<0.1) {
    line(x2, y2, x3, y3);
    strokeWeight(3);
    
  } else {
    line (x2, y2, x1, y3);
    strokeWeight(4);
    
}


  index++;
  if (index == width/w) {
    PImage p = get(0, h, width, h*23);
    background(#000000);
    set(0, 0, p);
    index = 0;
  }
}
