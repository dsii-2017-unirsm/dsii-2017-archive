// Morena Ugulini @morenaugulini© 2017 MIT License
// 10 print porting to P5js - prova 1
// Educational purpose, made for DSII2017 lab @UniRSM


var w =42;        // larghezza finestra
var h = 15;      // altezza finestra
var a = 0;      // dove mi inizia la prima riga


function setup() {
  createCanvas(882, 400);                //dimensione finestra
  background('#efbb60');                //colore sfondo
  strokeWeight(4);                     //spessore linea
  stroke(131,random(180,255),255);    //colore linea
  smooth();                          //anti-alias
}

//ciclo di disegno, un frame 60fps
function draw() {
  var x1 = 40;             //crea una variabile "x1" utilizzata come diametro circonferenze
    stroke(131,random(180,255),255);

  if ( a%2==0 ) {            //verifica se il resto della divisione di a per 2 è uguale a 0, quindi se a è pari o dispari
    noFill();
    arc(50+(a*x1),50, x1, x1,PI,TWO_PI);   //se minore di 1 disegnami una semicirconferenza verso l'alto
  } else {
    noFill()
    arc(50+(a*x1), 50, x1, x1,0,PI);  //se maggiore di 1 disegnami una semicirconferenza verso il basso
  }
  a++; //incrementa di 1 la variabile a

  if (a == width /w) {             // un = assegna variabile 2== uguaglianza-confronto
    p = get(0, h, width, h*20);   //cattura un'immagine
    background('#efbb60') ;      //cancella lo sfondo e lo ricoloro
    set(0, x1+x1, p);           //rilascia l'immagine "p" alle cordinate 0-2x1 ( se modifico cambio la distanza delle circonferenze)
    a = 0;
    stroke(131,random(180,255),255);  // coloro le linee su gradazioni azzurre
  }
}
