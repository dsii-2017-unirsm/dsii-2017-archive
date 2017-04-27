// paramentri iniziali
int w = 32;
int h = 32;
int index = 0;
// configurazione iniziale
void setup() {
  size(640, 640); // finestra
  background(0); // cancella lo schermo e fallo blu
  strokeWeight(2); //spessore delle linea
  stroke(225); // colore della lina
  smooth(); // anti aliasing
}
// ciclo di disegno (60 fps) 
void draw() {
  int x1 = w*index;  // crea una variabile x1 che è uguale a W*index ( start 0 ) 
  int x2 = x1 + w;  // crea una variabile x2 che è uguale (16)
  int y1 = h*1;    // crea una variabil y1 che è uguale al valore precedente *23 (start 368)
  int y2 = h*2;    // crea una variabile  y2 (384)

  if (random(2) < 1) { // genera un numero razionale tra 0 e 2
    line(x2, y1, x1, y2); //se minore di 1 disegna una linea
  } else {
    line(x1, y1, x2, y2); //se maggiore di 1 disegna una linea
  }
  index++; // aumenta di 1 la mia variabile index
  if (index == width/w) {  // 
    PImage p = get(0, h, width, h*17); // cattura un immagine H=0 
    background(0); // cancella lo schermo e fallo nero
    set(0, 64, p); // rilascia l'immagine p alle coordinate 0, 0
    index = 0;
  }
  if (mousePressed == true) { //quando il mouse è premuto ed è vero fai accadere il "for"
    for (int i = 0; i < 5; i++) { 
    float r = random(5); // una variabile irrazzionale random  
    strokeWeight(r*2); //lo spessore della linea e uguale al valore di r moltiplicto per 2
    }
  } else {
    strokeWeight(2); // se il mouse non è premuto accade questo
  }
}
void mouseMoved() {
  stroke(random(225), random(225), random(225)); // qunado muovi il mouse cambia colore
}
