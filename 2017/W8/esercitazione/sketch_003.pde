// Words by @Fupete
// dati/array/testo/frameCount   V

// 2017 © Daniele @Fupete and the course DSII2017 @UniRSM  
// github.com/fupete — github.com/dsii-2017-unirsm
// Educational purposes, MIT License, 2017, San Marino

String[] nomi = {"abra", "kadabra", "astro", "nascente", "mago", "merlino", "domani", "al mare", "leggo", "akrobata quadrato", "leggo pesci molli", "kris"};

void setup() {
  size(800, 800);
  pixelDensity(displayDensity());
  
  // 5 frame al secondo ... lento e scattoso ...
  frameRate(5);
  
  // formattazione del testo
  textSize(50);
  textAlign(CENTER);
}

void draw() {
  background(0);
  
  // nel centro dello schermo
  translate(width/2, height/2);
  
  // quale nome
  int i = frameCount%nomi.length;
  
  text(nomi[i], 0, 0);
}
