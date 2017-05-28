// Variazione_05 10Print by francescopaolini
// 2017 © francescopaolini, Daniele @Fupete and the course DSII2017 @UniRSM  
// github.com/fupete — github.com/dsii-2017-unirsm
// Educational purposes, MIT License, 2017, San Marino

float x = 0;
float y = 0;
float x1 = 0;
float y1 = 0;
int D = 60;
int D1 = 60;


void setup() {
  size(800, 800); // dimensione 
  background(0); // colore del background 
  frameRate(120);  // frame al secondo
  pixelDensity(2); // densità dei pixel
}
void draw () {
  matrice ();
  stampaMatrice ();
}
void matrice () {
  noFill();
  noStroke();
  rect(x, y, D, D);

  stroke(50);
  strokeWeight(random(1, 8));

  // Matrice da stampare
  if (random(2) <= 1) {
   stroke(255);

    triangle(x, y+D, x+D/2, y, x+D, y+D);
  } else {
   stroke(255);

    triangle(x, y, x+D/2, y+D, x+D, y);
  }
  
  
  if (random(2) <= 1) {
   stroke(255);
   line(x, y+D/2, x+D, y+D/2);
   //triangle(x, y+D, x+D/2, y, x+D, y+D);
   } else {
   stroke(255);

   line(x, y, x+D/2, y+D);
   }
}


// ciclo di stampa
void stampaMatrice () {
  x = x + D1;
  if ( x > width) {
    x = width-D;
    D1= -D1;
    y = y+D;
  }
  if (x < 0) {
    x = 0;
    y = y+D;
    D1 = -D1;
  }
  if (y > height) {
    x = 0;
    y = 0-D;
    background(random(225), random(225), random(225));
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
