// Variazione_01 10Print by francescopaolini
// 2017 © francescopaolini, Daniele @Fupete and the course DSII2017 @UniRSM  
// github.com/fupete — github.com/dsii-2017-unirsm
// Educational purposes, MIT License, 2017, San Marino

//paramtri iniziali
int w = 16;     //valore intero "w" per larghezza
int h = 16;     //valore intero "h" per l'altezza
int index = 0;  //valore intero "index"

//configurazione 
void setup() {
  size(640, 384);          //dimensione rettangolo
  background(255);     //colore sfondo
  strokeWeight(3);         //spessore linea
  stroke(0);             //colore linea
  smooth();                //usa l'anti-alias, processing lo utilizzada normalemente
}

//ciclo di disegno, un frame 60fps
void draw() {
  int x1 = w*index;        //crea una variabile "x1" (frame=0) 
  int x2 = x1 + w;         //crea una variabile "x2" (frame=16)
  int y1 = h*23;           //crea una variabile "y1" (frame=368)
  int y2 = h*24;    //crea una variabile "y2" (frame=384)

  if (random(2) < 1) {     //generami un numero razionale tra 0 e 2
    rect(x2, mouseY, mouseX, y2);  //se minore di 1 disegnami una linea
  } else {
    rect(x1, y1, x2, y2);  //se maggiore di 1 disegnami uan linea
  }
  index++;                 //incrementa di 1 la variabile index
  if (index == width/w) {  
    PImage p = get(0, h, width, h*23);  //cattura un immagine
    background(255);                //cancella lo sfondo, coloro in giallo
    set(0, 0, p);                       //rilascia l'immagine "p" alle cordinate 0-0
    index = 0;                          //
  }
if (mousePressed) {                  //se premi il cursore del mouse cambia colore
    colorMode(HSB, 360, 100, 100);     //parametri che gestiscono il cambiamento colore in realzione alla posizione del cursore 
    fill(mouseY, 100, mouseX);
  } else {
    //background(255); //da provare
  }
}
