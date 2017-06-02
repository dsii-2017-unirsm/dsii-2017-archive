import processing.video.*;


// Dimensione di ciascuna cella nella griglia
int cellSize = 10;
// Numero di colonne e righe
int cols, rows;
// Variabile per il dispositivo di cattura
Capture video;

PImage disegno;
// Memorizzo il dato dell'imagine chiamata disegno

void setup() {
  size(640, 480);
  //frameRate(30);
  cols = width / cellSize; // divido la larghezza della finistra per 10
  rows = height / cellSize;
  colorMode(RGB, 255, 255, 255, 100);

 // disegno = loadImage("disegno3.jpg"); // Carico l'immagine
 
 String url = "http://i.imgur.com/CKnCChq.jpg";
  // Load image from a web server
  disegno = loadImage(url, "jpg");
  
  disegno.loadPixels();
  
   
  // Esempio se trova un errore
  video = new Capture(this, width, height);

  // inizio a vedere il video
  video.start();  

  background(0);
}


void draw() { 
  if (video.available()) {
    video.read();
    video.loadPixels();

    // Inizia il ciclo per le colonne
    for (int i = 0; i < cols; i++) {
      // Inizia il ciclo per le righe
      for (int j = 0; j < rows; j++) {

        // Where are we, pixel-wise?
        int x = i*cellSize;
        int y = j*cellSize;
        int loc = (video.width - x - 1) + y*video.height; // Reversing x to mirror the image

        // Definire le componenti del colore del disegno
        float rd = red(disegno.pixels[loc]);
        float gd = green(disegno.pixels[loc]);
        float bd = blue(disegno.pixels[loc]);
        //color cdisegno = disegno.get(x, y);
        
        
        // Definire le componenti del colore della videocamera
        float r = red(video.pixels[loc]);
        float g = green(video.pixels[loc]);
        float b = blue(video.pixels[loc]);
        
         // Definire la c come somma di rgb della webcam più quelli del disegno
        color c = color((r/2)+(rd/2), (g/2)+(gd/2), (b/2)+(bd/2));

        

        // Renderela videocamera uno specchio
        pushMatrix();
        
        translate(x+cellSize/2, y+cellSize/2);
        // ruotare i quadrati
        rotate((2 * PI * brightness(c) / 255.0));
        rectMode(CENTER);
        fill(c);
        //noStroke();
        stroke(r,g,b); 
        rect(0, 0, cellSize+6, cellSize+6);
        
        popMatrix();
      }
    }
  }
}
