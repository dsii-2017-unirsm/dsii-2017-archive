float x = 0;
float y = 0;
float x1 = 0;
float y1 = 0;
int D;
int D1;
int[] dimensioni = { 60, 60, 60 };
int[] dimensioni2 = { 60, 60, 60 };

void setup() {
  size(1080, 720);
  background(0);
  frameRate(60);
  float i= random(4);
  D = dimensioni[int(i)];
  D1 = dimensioni2[int(i)];
}
void draw () {
  matrice ();
  stampaMatrice ();
  //quadrato3 ();
}
void matrice () {
  noFill();
  noStroke();
  rect(x, y, D, D);

  stroke(50);
  strokeWeight(random(2, 4));
 if (random(2) <= 1) {
    stroke(random(225), random(225), random(225));
    line(x, y, x+D, y+D);
    //triangle(x, y+D, x+D/2, y, x+D, y+D);
  } else {
    stroke(random(225), random(225), random(225));
    line(x+D, y, x, y+D);
    //triangle(x, y, x+D/2, y+D, x+D, y);
  }
  /*if (random(2) <= 1) {
    stroke(random(225), random(225), random(225));
    line(x, y+D/2, x+D, y+D/2);
    //triangle(x, y+D, x+D/2, y, x+D, y+D);
  } else {
    stroke(random(225), random(225), random(225));
    line(x+D/2, y, x+D/2, y+D);
    //triangle(x, y, x+D/2, y+D, x+D, y);
  }*/
}  
void stampaMatrice () {
  x = x + D1;
  if (x <= 0) {
  } 
  if ( x >= width){
    x = width;
    D1= -D1;
    y = y+D;
}
if (x <= 0) {
    x =0;
    y = y+D;
    D1 = -D1;

  }
if (y >= height) {
    background(random(225), random(225), random(225));
    x=0;
    y=0;
  }
}
void keyPressed() {  // se premo a fermo il loop
  if (key == 'a') {   
    noLoop();
  } else {

  }
  if (key == 's') {  // se premo f lo fermo
    saveFrame("variazione-######.png");     //salva il frame

  } else {

  }
  if (key == 'd') { // se premo d riparte
    loop();
  } else {}
  
}
