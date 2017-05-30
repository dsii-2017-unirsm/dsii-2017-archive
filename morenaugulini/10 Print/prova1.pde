// 10Print morenaugulini
// 2017 © morenaugulini, Daniele @Fupete and the course DSII2017 @UniRSM  
// github.com/fupete — github.com/dsii-2017-unirsm
// Educational purposes, MIT License, 2017, San Marino

//Mare


int w = 15;       // larghezza finestra
int h = 15;      // altezza finestra
int a = 1;      // dove mi inizia la prima riga

 
void setup() {
  size(640, 384);                        //dimensione finestra
  background(#efbb60);                  //colore sfondo
  strokeWeight(4);                     //spessore linea
  stroke(131,random(180,255),255);    //colore linea
  smooth();                          //anti-alias
}

//ciclo di disegno, un frame 60fps
void draw() {
  int x1 = w*a;             //crea una variabile "x1" (frame=15) 
  int x2 = x1 + w;         //crea una variabile "x2" (frame=30)
  int y1 = h*21;          //crea una variabile "y1" (frame=315)
  int y2 = h*20;         //crea una variabile "y2" (frame=300)

  if ( a%2==0 ) {            //verifica se il resto della divisione di a per 2 è uguale a 0
    line(x2, y1, x1, y2);   //se minore di 1 disegnami una linea "con punta" verso destra
  } else {
    line(x1, y1, x2, y2);  //se maggiore di 1 disegnami uan linea "con punta" verso sinistra
  }
  a++;                      //incrementa di 1 la variabile index
  if (a == width/w) {      // un = assegna variabile 2== uguaglianza-confronto
    PImage p = get(0, h, width, h*23);   //cattura un'immagine
    background(#efbb60) ;               //cancella lo sfondo e lo ricoloro
    set(0, 0, p);                      //rilascia l'immagine "p" alle cordinate 0-0 ( se modifico cambio la distanza delle linee)
    a = 1;
    stroke(131,random(180,255),255);  // coloro le linee su gradazioni azzurre
  }
}
void mouseMoved() {    //quando muovo il mouse
  a ++;               //aumenta a
  if (a > 20) {      //se a è maggiore di 20
   a = 0;           // a deve essere 0
 }
}

void keyPressed() {  //quando premo un tasto nella tastiera
  stroke(255);      //coloro le linee di bianco
}
