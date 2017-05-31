// VENTAGLIO by Fupete
// for/arc/coloreHSV    V

// 2017 © Daniele @Fupete and the course DSII2017 @UniRSM  
// github.com/fupete — github.com/dsii-2017-unirsm
// Educational purposes, MIT License, 2017, San Marino

// keys:
// Key [SPACE] ... step 10/1

int step = 1;
float stepR = radians(step);

void setup() {
  size(800, 800); 
  pixelDensity(displayDensity());
  
  // tipo linea
  noStroke();
  strokeWeight(2);
  strokeJoin(ROUND);
  
  // formattazione colore
  colorMode(HSB);
  
  // colore di riempimento iniziale = rosso
  fill(0, 255, 255);
}

void draw() {
  background(0);
  
  // per tutti i 360 gradi, ogni "step" gradi fai...
  for (int a = 0; a <= 360; a += step) {
    
    // riempimento e linea del tono della ruota colori
    fill(a, 255, 255);
    stroke(a, 255, 255);
    
    // angolo in radianti per disegnare un arco
    float aR = radians(a);
    
    // arco della sfumatura e dell'angolo, ci si somma "step" in radianti ogni pezzo di "torta"
    arc(width/2, height/2, 500, 500, aR, aR+stepR, PIE);
  }
  
  // e poi un bel cerchio nero per fare un anello
  noStroke();
  fill(0);
  ellipse(width/2, height/2, 200, 200);
}

void step(int s) {
  // funzione di creazione dello "step" sia in gradi che radianti
  step = s;
  stepR = radians(step);
}

void keyPressed() {
  if (key == ' ') {
    if (step == 1) {
      step(10);
    } else {
      step(1);
    }
  }
}
