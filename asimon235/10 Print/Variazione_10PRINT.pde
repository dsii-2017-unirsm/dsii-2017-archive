// paramentri iniziali
int w = 32;
int h = 32;
int index = 0;
// configurazione iniziale
void setup() {
  size(640, 640); // finestra
  background(0); // cancella lo schermo e fallo nero
  strokeWeight(2); //spessore delle linea
  stroke(225); // colore della lina
  smooth(); // anti aliasing
}
// ciclo di disegno (60 fps) 
void draw() {
  int x1 = w*index;  // crea una variabile x1 = 0 ( start 0 ) 
  int y1 = h*1;    // crea una variabil y1 = 32 (start 368)
  
  int x2 = x1 + w;  // crea una variabile x2 = 32 (16)
  int y2 = h*2;  // crea una variabile  y2 = 64 (384)
  
  int x3 = w*index;
  int y3 = h*2;
  
  int x4 = x1+w;
  int y4 = h*1;
  

  if (random(2) < 1) { // genera un numero razionale tra 0 e 2
    triangle(x1, y1, x2, y2, x3, y3); //se minore di 1 disegna un triangolo da sx
    stroke(255);
    fill(255);
  } else {
    triangle(x1, y1, x2, y2, x4, y4); //se maggiore di 1 disegna un triangolo da dx
    stroke(255);
    fill(255);
  }
  index++; // aumenta di 1 la mia variabile index
  if (index == width/w) {  // 
    PImage p = get(0, h, width, h*17); // cattura un immagine H=0 
    background(0); // cancella lo schermo e fallo nero
    set(0, 64, p); // rilascia l'immagine p alle coordinate 0, 0
    index = 0;
  }}
  /*if (mousePressed == true) { //quando il mouse è premuto ed è vero fai accadere il "for"
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
}*/
