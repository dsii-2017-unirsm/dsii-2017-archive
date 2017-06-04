// heightmap_mesh demo by Fupete
// 2017 © Daniele @Fupete and the course DSII2016 @UniRSM  
// github.com/fupete — github.com/dsii-2017-unirsm
// Educational purposes, MIT License, 2017, San Marino

// da usare ControlP5 per rendere parametrizzabile il risultato a video
// da esplorare le possibilità di esportazione come obj

// Credits to Anastasis Chasandras / Original code inspired on http://www.openprocessing.org/sketch/9290 / Original code by Anastasis Chasandras
// Credits to Daniel Shiffman / https://github.com/shiffman/Video-Lesson-Materials/tree/master/code_challenges/PerlinNoiseTerrain

String fileName1 = "basquiat.jpg";
String fileName2 = "scoiattolo_junkie2.png";

import processing.pdf.*; //export pdf
boolean recordPDF;

import nervoussystem.obj.*;   //export obj
boolean record;

import controlP5.*;
ControlP5 cp5;

float rotationX = 0, rotationY = 0, rotationZ = 0;

PImage img;
int W ;                  
int H ;                  

ArrayList points = new ArrayList(); // < per nuvola punti
float[][] mesh;                     // < per piano mesh superficie

// qui le variabili che controllano la visualizzazione

float spessore = .5;                 // < scala delle altezze visualizzate
int risoluzione = 3;                    // < risoluzione, un punto ogni risoluzione dell'immagine
int meshSize = 2;                   // < scala del piano mesh superficie
int apertura = 0;

boolean showPmeshWire, showPmeshFill= true, showPunti ; //mostra wireframe, mesh riempimento, nuvola di punti

void setup()
{
  //size (800, 800, P3D);
  fullScreen(P3D);
  pixelDensity(displayDensity());

  hint(ENABLE_STROKE_PERSPECTIVE); 

  cp5 = new ControlP5(this);
  setupGUI();

  colorMode(HSB, 100);
  background(0);

  carica(fileName1);
}

void draw()
{
  hint(ENABLE_DEPTH_TEST); //attiva la prova di profondità
  pushMatrix();
  
  if (recordPDF) {
    String nomeFile = "pdf/model_"+year()+month()+day()+"_"+minute()+second()+millis()+".pdf";
    beginRaw(PDF, nomeFile); //(ENABLE_DEPTH_SORT)- abilità il tipo di profondità, può migliorare le forme della geometria
  }

  background(0);
  lights();

  // immagine di riferimento in basso a dx, metà risoluzione
  image(img, width-W/2, height-H/2, W/2, H/2); 

  if (record) {
    String nomeFile = "data/model_"+year()+month()+day()+"_"+minute()+second()+millis()+".obj";
    beginRecord("nervoussystem.obj.OBJExport", nomeFile);
  }

  // spostati e ruota il mondo col mouse
  translate(width/2, height/2, 0);
  rotateY(rotationY);
  rotateX(rotationX);
  rotateZ(rotationZ);

  // disegna la nuvola di punti al centro in alto
  strokeWeight(4);
  if (showPunti && !record) displayNuvolaPunti(); // < disegna

  // spostati e disegna il piano mesh al centro wireframe
  translate(-W/2*meshSize, -H/2*meshSize, -apertura);
  noFill();
  stroke(#ff0000);
  strokeWeight(1);
  if (showPmeshWire && !record) displayMesh(); // < disegna

  // spostati e disegna il piano mesh al centro wireframe
  translate(0, 0, -apertura);
  fill(0, 0, 255);
  noStroke();
  if (showPmeshFill || record) displayMesh();

  if (record) {
    endRecord();
    record = false;
  }
  
  if (recordPDF) {
    endRaw();
    recordPDF = false;
  }

  popMatrix();
  hint(DISABLE_DEPTH_TEST);
}

void displayNuvolaPunti() {
  // visualizza la heightmap di punti a schermo
  // si potrebbe disegnare la superficie
  for (int i = 0; i<points.size(); i++) {
    PVector p = (PVector) points.get(i);
    stroke(p.z);
    point(p.x*meshSize, p.y*meshSize, p.z*spessore);//*cos(hgt));
  }
}

void displayMesh() {
  for (int x = 0; x<W-risoluzione; x+=risoluzione) {
    for (int y = 0; y<H-risoluzione; y+=risoluzione) {
      beginShape(QUADS); //(TRIANGLE_STRIP);(QUADS);(LINES); //registro i vertici
      vertex(x*meshSize, y*meshSize, mesh[x][y]*spessore );                //up point vertex (the first) coodinate (x,y,z)
      vertex((x+risoluzione)*meshSize, y*meshSize, mesh[x+risoluzione][y]*spessore );         //up point vertex(the second)  coodinate (x+1,y,z)
      vertex((x+risoluzione)*meshSize, (y+risoluzione)*meshSize, mesh[x+risoluzione][y+risoluzione]*spessore );  //down point vertex(the second) coodinate (x+1,y+1,z) 
      vertex(x*meshSize, (y+risoluzione)*meshSize, mesh[x][y+risoluzione]*spessore );       //down point vertex (the first) coodinate (x,y+1,z) 
      endShape(CLOSE);
    }
  }
}


void mouseDragged()
{
  if (!cp5.isMouseOver()) {

    rotationX+= map(mouseY-pmouseY, 0, 100, 0, 2);

    if (keyPressed && key == 'z') { 
      rotationZ+= map(mouseX-pmouseX, 0, 100, 0, 2);
    } else {
      rotationY+= map(mouseX-pmouseX, 0, 100, 0, 2);
    }
  }
}

void keyPressed() {
  if (key=='1') {
    carica(fileName1);
  } else if (key=='2') {
    carica(fileName2);
  } else if (key=='o' || key=='O') {
    record = true;
  } else if (key=='p' || key=='P') {
    recordPDF = true;
  }
  // puoi caricare n file, potresti anche 
  // caricare in modo dinamico l'immagine
  // vedi es. https://processing.org/reference/selectInput_.html
}
