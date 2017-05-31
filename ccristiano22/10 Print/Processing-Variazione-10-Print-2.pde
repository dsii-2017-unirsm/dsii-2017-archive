float x = 0;
float y = 0;
float x1 = 0;
float y1 = 0;
int D;
int D1;
int[] dimensioni = { 60, 60, 60 }; // dimensioni del quandrato da stampare
int[] dimensioni2 = { 60, 60, 60 }; // variabili per il destra sinistra (per il momento solo per la "void matrice" "void stampaMatrice")

void setup() {
  size(1080, 720, P3D); // dimensione 
  background(0); // colore del background 
  frameRate(60);  // frame al secondo
  smooth(); // liscio
  pixelDensity(2); // densità dei pixel
  float i= random(4); // variabile irrazionale radnom
  D = dimensioni[int(i)]; // variabile dimensione 
  D1 = dimensioni2[int(i)]; // variabile dimensione 
}
void draw () {
  matrice ();
  stampaMatrice ();
  matrice1 ();
  stampaMatrice1 ();
}
void matrice () {
  noFill();
  noStroke();
  rect(x, y, D, D);

  stroke(50);
  strokeWeight(random(1, 6));
  
  // Matrice da stampare
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
// ciclo di stampa
void stampaMatrice () {
  x = x + D1;
  if (x <= 0) {
  } 
  if ( x >= width) {
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

void matrice1 () {
  noFill();
  noStroke();
  rect(x1, y1, D, D);

  stroke(50);
  strokeWeight(random(2, 4));
  if (random(2) <= 1) {
    stroke(random(225), random(225), random(225));
    line(x1, y1, x1+D, y1+D);
  } else {
    stroke(random(225), random(225), random(225));
    line(x1+D, y1, x1, y1+D);
  }
}
void stampaMatrice1 () {
  y1 = y1 - D;
  if (y1 <= 0) {
    y1 = (height);
    x1 = x1+D;
  }

  if (x1 >= width ) {
    background(random(255));
    x1 = 0;
    y1 = (height-D);
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
