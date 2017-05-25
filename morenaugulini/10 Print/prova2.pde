// 10Print morenaugulini
// 2017 © morenaugulini, Daniele @Fupete and the course DSII2017 @UniRSM  
// github.com/fupete — github.com/dsii-2017-unirsm
// Educational purposes, MIT License, 2017, San Marino

//Mare


int w =42;       // larghezza finestra
int h = 15;      // altezza finestra
int a = 0;      // dove mi inizia la prima riga

 
void setup() {
  size(900, 400);                        //dimensione finestra
  background(#efbb60);                  //colore sfondo
  strokeWeight(4);                     //spessore linea
  stroke(131,random(180,255),255);    //colore linea
  smooth();                          //anti-alias
}

//ciclo di disegno, un frame 60fps
void draw() {
  int x1 = 40;             //crea una variabile "x1" utilizzata come diametro circonferenze
  

  if ( a%2==0 ) {            //verifica se il resto della divisione di a per 2 è uguale a 0, quindi se a è pari o dispari
    noFill();
    arc(50+(a*x1),50, x1, x1,PI,TWO_PI);   //se minore di 1 disegnami una semicirconferenza verso l'alto
  } else {
    arc(50+(a*x1), 50, x1, x1,0,PI);  //se maggiore di 1 disegnami una semicirconferenza verso il basso
  }
  a++; //incrementa di 1 la variabile a

  if (a == width /w) {      // un = assegna variabile 2== uguaglianza-confronto
    PImage p = get(0, h, width, h*20);   //cattura un'immagine
    background(#efbb60) ;               //cancella lo sfondo e lo ricoloro
    set(0, x1+x1, p);                      //rilascia l'immagine "p" alle cordinate 0-2x1 ( se modifico cambio la distanza delle circonferenze)
    a = 0;
    stroke(131,random(180,255),255);  // coloro le linee su gradazioni azzurre
  }
}
void mouseMoved() {    //quando muovo il mouse
  a ++;               //aumenta a
  if (a > 1) {      //se a è maggiore di 20
   a = 0;           // a deve essere 0
 }
}

void keyPressed() {  //quando premo un tasto nella tastiera
  stroke(255);      //coloro le linee di bianco
}
