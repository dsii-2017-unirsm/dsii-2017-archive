// OCCHIO DI BUE by @fupete
// forma/ellisse/stroke V

// 2017 © Daniele @Fupete and the course DSII2017 @UniRSM  
// github.com/fupete — github.com/dsii-2017-unirsm
// Educational purposes, MIT License, 2017, San Marino

// keys:
// Key [SPACE] ... hints ON/OFF

boolean hints = false;
int pad = 150;
int diam = 100;

void setup() {
  size(800, 800); 
  pixelDensity(displayDensity());
  
  // stile
  stroke(255);
  strokeWeight(200);
  noFill();
}

void draw() {
  background(0);
  
  // usa il "pad" per calcolare dove posizionare 
  // i quattro elementiCircolari...
  translate(width/2-pad, height/2-pad);
  elementoCircolare (diam);
  translate (pad*2, 0);
  elementoCircolare (diam);
  translate(0, pad*2);
  elementoCircolare (diam);
  translate (-pad*2, 0);
  elementoCircolare (diam);
}

void elementoCircolare(int d) {
  // funzione di generazione degli elementi circolari
  // fatti da un ellisse di diametro d e
  // da un punto... 
  ellipse (0, 0, d, d);
  punto();
}

void punto() {
  // funzione di generazione dei punti
  // fatti da piccoli ellissi pieni 
  // usiamo push/pop style per non cambiare
  // la formattazione generale
  pushStyle();
  fill(255);
  noStroke();
  ellipse(0, 0, 20, 20);
  popStyle();
}

void keyPressed() {
  if (key == ' ') hints = !hints;
}
