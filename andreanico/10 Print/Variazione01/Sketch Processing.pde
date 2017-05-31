// Esercitazione_01 | 10 Print
// Studente_Andrea Nico | A.A 2106/2017 | UNIRSM

// parametri iniziali
int w = 32;     //valore intero "w" per larghezza
int h = 32;     //valore intero "h" per altezza
int index = 0;  //valore intero "w" per larghezza

//configurazione
void setup() {
     size(640, 640);       //dimensione rettangolo
     background(0);        //colore di sfondo
     strokeWeight(3);      //spessore linea
     stroke(255);          //colore linea
     smooth();             //usa l'anti alias, processing lo utilizza normalmente
}

//ciclo di disegno, un frame 60fps
void draw() {
     int x1 = w*index;         //crea una variabile "x1" (frame=0)
     int x2 = x1 + w;          //crea una variabile "x2" (frame=16)
     int x3 = w*index;         //crea una variabile "x3" 
     int x4 = x1 + w;          //crea una variabile "x4" (frame=16)
     int y1 = h*1;             //crea una variabile "y1" (frame=368)
     int y2 = h*2;             //crea una variabile "y2" (frame=384)
     int y3 = h*2;             //crea una variabile "y3" 
     int y4 = h*1;             //crea una variabile "y4" 
     
     if (random(2) < 1) {                    //genera un numero casuale tra 0 e 2
      triangle(x1, y1, x2, y2, x3, y3);      //se minore di 1 disegna una linea con queste coordinate
      fill(7,204,188);       //riempimento triangolo
      noStroke();
 } else {
      triangle(x1, y1, x2, y2, x4, y4);      //se maggiore di 1 disegna una linea con queste coordinate
      fill(230,29,254);                      //riempimento triangolo
      noStroke();
 }
    index++;                                 //aumenta di 1 la mia variabile index
     if (index == width/w) {
      PImage p = get(0, h, width, h*17);     //cattura un'immagine H=0
      background(0);                         //cancella lo schermo e fallo nero
      set(0, 64, p);                         //rilascia l'immagine p alle cordinate 0,0
      index = 0;
 }
   
   if (mousePressed == true) {          //quando il mouse viene premuto
      {
      rect (x1, y1, 32, 32);
      noStroke();                       //il colore della linea è verde
      }
   }
}
