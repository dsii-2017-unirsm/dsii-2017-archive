// LINEE ANIMATE
// arraylist/oggetti-classi/linee (oop)

// 2017 © Daniele @Fupete and the course DSII2017 @UniRSM  
// github.com/fupete — github.com/dsii-2017-unirsm
// Educational purposes, MIT License, 2017, San Marino

// keys:
// Key [SPACE] ... riGeneraLinee!

ArrayList<Linea> linee;
int quanteLinee = 15;

void setup() {
  size(400, 400);

  // stile
  noFill();
  stroke(255);
  strokeWeight(2);

  // il nostro "contenitore" di oggetti di classe Linea
  linee = new ArrayList();

  generaLinee();
}

void generaLinee() {
  // funzione di generazione di "quanteLinee" linee
  // ogni linea ha un indice e un inizio e una coda a caso sullo schermo
  // in situazione iniziale
  for (int i=0; i<quanteLinee; i++) {
    linee.add(new Linea(i, random(width), random(height), random(width), random(height)));
  }
}

void draw() {

  background(0);

  // per ogni frame "mostra" e "muovi" ogni oggetto 
  // di classe "Linea" contenuti nel contenitore "linee"
  for (int i=0; i<linee.size(); i++) {
    linee.get(i).mostra();
    linee.get(i).muovi();
  }
}


class Linea {

  PVector capo, coda;
  float dx, dy;
  float speed;
  int id;
  
  // costruttore

  Linea(int id_, float capoX_, float capoY_, float codaX_, float codaY_) {
    // inizio e fine della linea
    capo = new PVector (capoX_, capoY_);
    coda = new PVector (codaX_, codaY_);
    // velocità di spostamento, legata a chi
    // è la Linea, l'ultima generata sarà
    // sempre la più veloce
    dx = random(-id_-1, id_+1);
    dy = random(-id_-1, id_+1);
    // indice, ogni Linea sa in che posizione 
    // è nell'Array
    id = id_;
  }

  // funzioni 
  
  void muovi() {
    coda.x += dx;
    coda.y += dy;
    if (coda.x > width || coda.x < 0) {
      // se la coda tocca a destra o a sinistra 
      // la fine dello schermo mandala indietro
      dx *= -1;
    }
    if (coda.y > height || coda.y < 0) {
      // se la coda tocca sotto o sopra 
      // la fine dello schermo mandala indietro
      dy *= -1;
    }
  }

  void mostra() {
    // ogni linea ha un capo fermo fatto da un punto di 10px
    // collegata ad una coda in movimento per lo schermo
    ellipse(capo.x, capo.y, 10, 10);
    line(capo.x, capo.y, coda.x, coda.y);
  }
}


void keyPressed() {
  if (key == ' ') {
    // se premo spazio, controlla che "linee" non sia vuoto
    // se non è vuoto cancellalo e genera una nuova serie di
    // oggetti di classe "Linea", da 1 a 30 oggetti
    if (linee.size() > 0) {
      linee.clear();
      quanteLinee = (int) random(1, 30);
      generaLinee();
    }
  }
}
