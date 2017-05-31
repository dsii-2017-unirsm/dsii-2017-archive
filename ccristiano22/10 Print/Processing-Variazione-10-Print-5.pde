float x = 0;
float y = 0;
float x1 = 0;
float y1 = 0;
float x2 = 0;
float y2 = 0;
float x3 = 0;
float y3 = 0;
float x4 = 0;
float y4 = 0;
int D = 40;
int D1 = 40;
int D2 = 40;
int D3 = 40;
int D4 = 40;
int D5 = 40;

//int[] dimensioni = { 60, 60}; // dimensioni del quandrato da stampare
//int[] dimensioni2 = { 60, 60}; // variabili per il destra sinistra (per il momento solo per la "void matrice" "void stampaMatrice")
//int[] dimensioni3 = { 60, 60}; // variabili per il destra sinistra (per il momento solo per la "void matrice" "void stampaMatrice")

void setup() {
  size(800, 800, P3D);// dimensione 
  background(0); // colore del background 
  frameRate(60);  // frame al secondo
  smooth(); // liscio
  pixelDensity(2);// densità dei pixel
  beginCamera();
  camera();
  endCamera();
  //int i= 0; // variabile irrazionale radnom
  //D = dimensioni[int(i)]; // variabile dimensione 
  //D1 = dimensioni2[int(i)]; // variabile dimensione
  //D3 = dimensioni3[int(i)]; // variabile dimensione
}
void draw () {
  //translate(0, 0, mouseY/2);
  pushMatrix();
  translate(0, height);
  rotateX(-PI/2);
  matrice ();
  popMatrix();
  stampaMatrice ();


  pushMatrix(); 
  rotateY(PI/2);
  translate(0, height);
  rotate(radians(-90));
  matrice1 ();
  popMatrix();
  stampaMatrice1 ();

  pushMatrix();
  rotateX(-PI/2);
  translate(0, 0);
  rotate(radians(0));
  matrice2 ();
  popMatrix();
  stampaMatrice2 ();

  pushMatrix(); 
  translate(width, 0);
  rotateY(-PI/2);
  rotate(radians(90));
  matrice3 ();
  popMatrix();
  stampaMatrice3 ();

  translate(0, 0,-800);
  matrice4 ();
  stampaMatrice4 ();
}
void matrice () {
  noFill();
  noStroke();
  rect(x, y, D, D);
  stroke(50);
  strokeWeight(random(1, 6));

  // Matrice da stampare

  if (random(2) <= 1) {
    stroke(200);
    line(x, y, x+D, y+D);
    //triangle(x, y+D, x+D/2, y, x+D, y+D);
  } else {
    stroke(200);
    line(x+D, y, x, y+D);
    //triangle(x, y, x+D/2, y+D, x+D, y);
  }
}

void matrice1 () {
  noFill();
  noStroke();
  //fill(255);
  translate(0, 0);
  rect(x1, y1, D, D);

  stroke(50);
  strokeWeight(random(2, 4));
  if (random(2) <= 1) {
    stroke(200);
    line(x1, y1, x1+D, y1+D);
  } else {
    stroke(200);
    line(x1+D, y1, x1, y1+D);
  }
}
void matrice2 () {
  noFill();
  noStroke();
  rect(x2, y2, D, D);

  stroke(50);
  strokeWeight(random(2, 4));
  if (random(2) <= 1) {
    stroke(200);
    line(x2, y2, x2+D, y2+D);
  } else {
    stroke(200);
    line(x2+D, y2, x2, y2+D);
  }
}
void matrice3 () {
  noFill();
  noStroke();
  rect(x3, y3, D, D);

  stroke(50);
  strokeWeight(random(2, 4));
  if (random(2) <= 1) {
    stroke(200);
    line(x3, y3, x3+D, y3+D);
  } else {
    stroke(200);
    line(x3+D, y3, x3, y3+D);
  }
}
void matrice4 () {
  noFill();
  noStroke();
  rect(x, y, D, D, 800);
  stroke(50);
  strokeWeight(random(1, 6));

  // Matrice da stampare

  if (random(2) <= 1) {
    stroke(200);
    line(x, y, x+D, y+D);
    //triangle(x, y+D, x+D/2, y, x+D, y+D);
  } else {
    stroke(200); //random(225)
    line(x+D, y, x, y+D);
    //triangle(x, y, x+D/2, y+D, x+D, y);
  }
}
void stampaMatrice () {
  x = x + D1;
  if ( x > width-D) {
    x = width-D;
    D1= -D1;
    y = y+D;
  }
  if (x < 0) {
    x = 0;
    y = y+D;
    D1 = -D1;
  }
  if (y > height-D) {
    x = 0;
    y = 0;
    background(random(225), random(225), random(225));
  } 
}
void stampaMatrice1 () {
  x1 = x1 + D2;
  if ( x1 > width-D) {
    x1 = width-D;
    D2= -D2;
    y1 = y1+D;
  }
  if (x1 < 0) {
    x1 = 0;
    y1 = y1+D;
    D2 = -D2;
  }
  if (y1 > height-D) {
    x1 = 0;
    y1 = 0;
    background(random(225), random(225), random(225));
  } 
}
void stampaMatrice2 () {
   x2 = x2 + D3;
  if ( x2 > width-D) {
    x2 = width-D;
    D3= -D3;
    y2 = y2+D;
  }
  if (x2 < 0) {
    x2 = 0;
    y2 = y2+D;
    D3 = -D3;
  }
  if (y2 > height-D) {
    x2 = 0;
    y2 = 0;
    background(random(225), random(225), random(225));
  } 
}

void stampaMatrice3 () {
   x3 = x3 + D4;
  if ( x3 > width-D) {
    x3 = width-D;
    D4= -D4;
    y3 = y3+D;
  }
  if (x3 < 0) {
    x3 = 0;
    y3 = y3+D;
    D4 = -D4;
  }
  if (y3 > height-D) {
    x3 = 0;
    y3 = 0;
    background(random(225), random(225), random(225));
  }
}
void stampaMatrice4 () {
  x4 = x4 + D5;
  if ( x4 > width-D) {
    x4 = width-D;
    D5= -D5;
    y4 = y4+D;
  }
  if (x < 0) {
    x4 = 0;
    y4 = y4+D;
    D5 = -D5;
  }
  if (y > height-D) {
    x4 = 0;
    y4 = 0;
    background(random(225), random(225), random(225));
  } 
}
// ciclo di stampa
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
