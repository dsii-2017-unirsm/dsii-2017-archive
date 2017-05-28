// Variazione_03 10Print by francescopaolini
// 2017 © francescopaolini, Daniele @Fupete and the course DSII2017 @UniRSM  
// github.com/fupete — github.com/dsii-2017-unirsm
// Educational purposes, MIT License, 2017, San Marino

float x = 0;
float y = 0;
int[] dimensioni = { 20, 40, 80, 160, 320 };
int D;
float x1 = 10;
float y1 = 10;
float x3 = 10;
float y3 = 10;
float x4 = 10;
float y4 = 10;

void setup() {
  size(720, 720);
  background(255);
  frameRate(60);

  float i= random(4);
  
  D = dimensioni[int(i)];
  y1 = (height-D);
  x3 = (width-D);
  y3 = (height-D);
  x4 = (width-D);
}

void draw() {
  quadrato1();
  quadrato3();
}

void quadrato1() {
  fill(100, 40);
  noStroke();
  rect(x, y, D, D);
  stroke(50);

  x = x + D;
  if (x >= width) {
    x=0;
    y = y+D;
  }
  if (y >= height) {
    background(255);
    x=0;
    y=0;
  }
}


void quadrato3() {  
  fill(100, 40);
  noStroke();
  stroke(50);
  strokeWeight(random(4, 34));  //range random per la dimensione dei punti
  if (random(2) <= 1) {
    line(x3+D, y3+D, x3+D, y3+D);
  } else {
    line(x3+D, y3+D, x3+D, y3+D);
  }

  x3 = x3 - D;
  if (x3 < 0) {
    x3 = width-D;
    y3 = y3-D;
  }

  if (y3 <= 0-D) {
    background(255);
    x3 = (width-D);
    y3 = (height-D);
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
