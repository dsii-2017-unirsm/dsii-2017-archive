// Inspirational Ghost demo by MorenaUgulini 
// original concept by MorenaUgulini 

// 2017 © Daniele @Fupete and the course DSII2017 @UniRSM  
// https://github.com/morenaugulini — github.com/dsii-2017-unirsm
// Educational purposes, MIT License, 2017, San Marino

// --- 

// Credits to Zach Spitulski, UCLA Version 0.3, "photoCOLLAGE"


PImage[] images = new PImage[6];
//da trovare:
//un modo per contare le immagini dentro una cartella automaticamente, questo numero dopo averlo messo in una variabile, 
// è da inserire al posto di 6 in PImage 

void setup() { 
  size(800,800);
  smooth();
  frameRate(50);
  noStroke();

  // Utilizza un Array per caricare tutte le immagini dichiarate
 // image.legth indico 6 ovvero la lunghezza del vettore(in alto)
   for ( int i = 0; i< images.length; i++ ){ 
   float r=random(9); //variabile  9 perchè ho tre cartelle
     if (r<3) { 
    images[i] = loadImage( "data/" + i + ".png" );  
  } 
   else if (r>6) {
    images[i] = loadImage( "data2/" + i + ".png" ); 
   } 
   else {
    images[i] = loadImage( "data3/" + i + ".png" ); 
   } 
  }
}

void draw() {  
  // Randomly Pick Image + Properties
  for (int i = 0; i < 500; i++){
  float imageRotation = random(-90,90);
  float imageX = random(0,800);
  float imageY = random(0,700);
  float imageScaleWidth = random(60,250);
  float imageScaleHeight = imageScaleWidth*1.08;

  
  // Disegna, ruota + scala immagine
  imageMode(CENTER);
  pushMatrix();
  translate(imageX, imageY);
  rotate(radians(imageRotation));
  //filter(BLUR,.6); serve per fare la sfocatura
  image(images[int(random(6))], 0, 0, imageScaleWidth, imageScaleHeight);
  popMatrix();
 }
 
 save("output.png");
 exit();
}


 
 
