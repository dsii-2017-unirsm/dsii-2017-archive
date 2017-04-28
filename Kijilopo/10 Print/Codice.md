// paramentri iniziali
int w = 32;
int h = 32;
int index = 0;
// configurazione iniziale
void setup() {
  size(640, 768); // finestra 
  background(255); //colore blu sfondo
  strokeWeight(2); //spessore delle linea
  stroke(225); // colore della lina
  smooth(); // anti aliasing
}
// ciclo di disegno ( un frame) (60 fps) 
void draw() {
  int x1 = w*index;  // crea una variabile x1 che è uguale a W*index ( start 0 ) 
  int x2 = x1 + w;  // crea una variabile x2 che è uguale (16)
  int y1 = h*23;    // crea una variabil y1 che è uguale al valore precedente *23 (start 368)
  int y2 = h*24;    // crea una variabile  y2 ( 384)
  

  if (random(2) < 1) { // genera un numero razionale tra 0 e 2
    line(x2, y1, x1, y2); //se minore di 1 disegna una linea
  } else {
    line(x1, y1, x2, y2); //se maggiore di 1 disegna una linea
  }
  index++; // aumenta di 1 la mia variabile index
  if (index == width/w) {  // 
    PImage p = get(0, h, width, h*23); // cattura un immagine H=0 
    background(255); // cancella lo schermo e fallo blu
    set(0, 0, p); // rilascia l'immagine p alle coordinate 0, 0
    index = 0; 
  }
  if (mousePressed) {
    colorMode(HSB);
    strokeWeight(4);
    stroke(mouseY, 100, mouseX);
  } else {
    strokeWeight(2);
    stroke(0);
  }
}
