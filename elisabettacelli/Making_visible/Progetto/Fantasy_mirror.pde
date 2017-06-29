
// Fantasy Mirror demo by Fupete and Elisabetta Celli
// original concept by Elisabetta Celli

// 2017 © Daniele @Fupete and the course DSII2017 @UniRSM  
// github.com/fupete - github.com/elisabettacelli — github.com/dsii-2017-unirsm
// Educational purposes, MIT License, 2017, San Marino

// --- 

// Credits to Daniel Shiffman

// --- 

// Controls: 
// [SPAZIO] attiva/disattiva cancella
// [P] salva PDF
// [I] salve JPG
// in CP5 interfaccia per:
// attiva/disattiva la videocamere i contorni ridiseganti e il disegno del bambino
// modificare lo spessore della traccia
// attiva/disattiva BLUR
// attiva/disattiva e setta il livello BLURRE
// attiva/disattiva DILATE e ERODE
// scegli tra fondo BIANCO/NERO o COLORE REALE
// setta lo spessore della linea
// scegli tra il colore della linea o PSICADELICO o in BN
// setta la dimensione della cella
// cambia il disegno del bambino 
// esporta in PDF
// esporta in IMG


import controlP5.*;
ControlP5 cp5;

import processing.pdf.*;

import processing.video.*;
import gab.opencv.*;           // < usiamo anche OPEN CV (Libreria che permette 
// di lavorare con la Computer Vision... 
// per poter "creare" simil disegni, tanto per accentuare
// l'idea di gioco. Usiamo nello specifico 
// l'algoritmo di ricerca bordi chiamato Canny 
// vedi anche wikipedia...

Capture video;
OpenCV opencv, opencvDisegno;

PImage disegno, disegnoCanny;
int caso = 0;

int cols, rows;

// variabilie usiamo per i settaggi parametrici in Cp5
int cellSize = 5;
int lineaMinima = 10;
int traccia = 5;
int blurreLevel = 2;
boolean fondoBianco = false;
boolean psichedelia = false, bn = true;
boolean drawing = true, cam = false, cancella = true;
boolean dilate = false, erode = false, blurre = true, child = true;
boolean blur = false;
boolean coloreVero = true;
boolean cambiaDisegno = true;
int lT=50, hT=90;

// per poter cambiare anche la dimensione della cella in Cp5 dobbiamo fare
// in modo che mentre si cambia non va l'algoritmo per non avere errori
boolean cellSize_updating = false;

// per i salvataggi
boolean recordPDF = false, recordIMG = false;

void setup() {
  size(800, 600);
  //fullScreen();
  //pixelDensity(displayDensity());


  colorMode(RGB, 255, 255, 255, 100);

  cp5 = new ControlP5(this);
  setupGUI();                               // < vedi tab a fianco

  cols = width / cellSize; 
  rows = height / cellSize;
  
  video = new Capture(this, width, height); // < LA WEBCAM
  opencv = new OpenCV(this, width, height); // < PASSIAMO LA WEBCAM A OPENCV 
  video.start();
  
  strokeJoin(ROUND);
}


void draw() { 

  // se c'è il video e non si sta aggiornando in cp5 la dimensione cella allora vai!
  if (video.available() && !cellSize_updating) {

    if (recordPDF) {
      String nomeFile = "pdf/pdf_"+year()+month()+day()+"_"+minute()+second()+millis()+".pdf";
      //beginRaw(PDF, nomeFile);
      beginRecord(PDF, nomeFile);
    }

    if (cancella) 
      if (!fondoBianco) background(0); 
      else background(255);

    video.read();

    // passiamo poi il frame a opencv
    opencv.loadImage(video);
    // e ad alcuni algoritmi/filtri successivi
    if (blurre) opencv.blur(blurreLevel);
    if (dilate) opencv.dilate();
    if (erode) opencv.erode();
    opencv.findCannyEdges(lT, hT); // < qui estraiamo i bordi stile disegno... 
                                   // parametri gestibili da cp5


    // PARTE DI "TRASPOSIZIONE" CON MIX PIXEL CON IMMAGINE PREDEFINITA
    if (cam) {
      video.loadPixels();

      for (int i = 0; i < cols; i++) {
        for (int j = 0; j < rows; j++) {

          int x = i*cellSize;
          int y = j*cellSize;
          int loc = (video.width - x - 1) + y*video.width; // Reversing x to mirror the image

          float rd = red(disegno.pixels[loc]);
          float gd = green(disegno.pixels[loc]);
          float bd = blue(disegno.pixels[loc]);

          float r = red(video.pixels[loc]);
          float g = green(video.pixels[loc]);
          float b = blue(video.pixels[loc]);

          color c = color((r/2)+(rd/2), (g/2)+(gd/2), (b/2)+(bd/2));

          pushMatrix();

          translate(x+cellSize/2, y+cellSize/2);
          // si potrebbe mettere in cp5 anche l'opzione rotate, e i colori/formati di questi sotto

          rotate((2 * PI * brightness(c) / 255.0));
          rectMode(CENTER);
          fill(c, 100);
          noStroke();
          //stroke(r, g, b);  
          rect(0, 0, cellSize*1.5, cellSize*1.5);

          popMatrix();
        }
      }
    } 

    if (blur && !recordPDF) filter(BLUR); // < se è attivo il filtro blur vai! occhio che non va nel 
                                          // PDF quindi lo disattiviamo se stiamo salvando un PDF



     //DISEGNO
     if (cambiaDisegno)
     takerandomimage("disegno_" + nf(caso, 3) + ".jpg"); //le immagini si devono chiamare "disegno_000.jpg"

    // PARTE DI "DISEGNO" CERCANDO I BORDI DALLA CAMERA
    if (drawing) {

      pushMatrix();                      // < per specchiare orizzontalmente andiamo
      translate(width, 0);        // al bordo destro e ribaltiamo la scala
      scale(-1, 1);                      // orizzontale

      //noFill();
      strokeWeight(traccia);


      // se vogliamo tracciare anche il disegno
      if (child) {
        for (Contour contour : opencvDisegno.findContours()) {
          
          // scegliamo un colore
          if (coloreVero) {
            //PVector point = contour.getPoints().get(0); 
            ArrayList P = contour.getPoints();
            //PVector point = (PVector) P.get((int) P.size()/2);
            PVector point = (PVector) P.get((int) random(P.size()-1)); // < colore da un punto a caso del bordo in modo da "tremolare..."
            color c = disegno.get((int)point.x, (int)point.y);
            stroke(c);
          } else if (psichedelia) stroke(random(255), random(255), random(255));
          else if (bn) stroke(random(255));
          else if (fondoBianco) stroke(0); 
          else stroke(255);
          
          // e ora disegniamo
          if (contour.getPoints().size() > lineaMinima)
            contour.draw();
        }
      }

      // ora tracciamo i contorni che si trovano nell'immagine passata
      // attraverso l'algoritmo di Canny, così avremo il nostro disegno... 
      // anche vettoriale...
      for (Contour contour : opencv.findContours()) {
        
        // scegliamo un colore
        if (coloreVero) {
          //PVector point = contour.getPoints().get(0);
          ArrayList P = contour.getPoints();
          PVector point = (PVector) P.get((int) P.size()/2); // < colore da un punto centrale del bordo, colore "medio"?
          color c = video.get((int)point.x, (int)point.y);
          stroke(c);
        } else if (psichedelia) stroke(random(255), random(255), random(255));
        else if (bn) stroke(random(255));
        else if (fondoBianco) stroke(0); 
        else stroke(255);
        
        // e ora disegniamo
        if (contour.getPoints().size() > lineaMinima)
          contour.draw();
      }

      popMatrix();
    }

   

    if (recordPDF) {
      //endRaw();
      endRecord();
      recordPDF = false;
    }

    if (recordIMG) {
      String nomeFile = "img/img"+year()+month()+day()+"_"+minute()+second()+millis()+".jpg";
      saveFrame(nomeFile);
      recordIMG = false;
    }
  }
}

void exit() {
  // chiudiamo la webcam in uscita
  video.stop();
}

void takerandomimage(String immagine) {
   disegno = loadImage(immagine); //mi carica una immagine random
   
   int wd = disegno.width;
  int hd = disegno.height;
  int rd = (int) wd/hd;
  disegno.resize(width, width*rd); // < mantenendo le proporzioni..,

  disegno.loadPixels();

  
  
  opencvDisegno = new OpenCV(this, width, height); // < PASSIAMO IL DISEGNO A OPECV

  opencvDisegno.loadImage(disegno); //"data/image1.jpg"
  opencvDisegno.findCannyEdges(20, 75);
  disegnoCanny = opencvDisegno.getSnapshot();
  
}
