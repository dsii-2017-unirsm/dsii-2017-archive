float x = 0;
float y = 0;
int[] dim = { 20, 40, 60, 80 };
int D;
//float x1 = 0;
float y1 = 0;
float x3 = 0;
float y3 = 0;
float x4 = 0;
//float y4 = 0;

void setup() {
  size(720, 720);
  background(255);
  frameRate(120);

  float i= random(4);
  D = dim[int(i)];
  y1 = (height-D);
  x3 = (width-D);
  y3 = (height-D);
  x4 = (width-D);
}

void draw() {
spazio1();
}

void spazio1() {
  fill(100, 30);
  noStroke();
  stroke(50);
  strokeWeight(random(1, 2));
  
  if (random(2) <= 1) {
    rect(x, y, x+D, y+D);
  } else {
    rect(x, y, x+D, y+D);
  }

  x = x + D;
  if (x >= width) {
  background(255);
    x=0;
    y = y+D;
  }
  
  if (y >= height) {
   background(255);
    x=0;
    y = 0;
  }
}

void keyPressed() {  // se premo a fermo il loop
  if (key == 'a') {   
    noLoop();
  } else {
  }
  if (key == 's') {  // se premo f lo fermo
    saveFrame("variazione-######.png");     //salva il frame, "fai un screenshot della finestra"
  } else {
  }
  if (key == 'd') { // se premo d riparte
    loop();
  } else {
  }
}
