// Another way of seeing by taniasabatini - Tania Sabatini
// 2017 © taniasabatini, Daniele @fupete and the course DSII2017 @UniRSM 
// github.com/fupete — github.com/dsii-2017-unirsm
// Educational purposes, MIT License, 2016, San Marino
// -
// Credits to Anastasis Chasandras / Original code inspired on http://www.openprocessing.org/sketch/9290 / Original code by Anastasis Chasandras
// Credits to Daniel Shiffman / https://github.com/CodingTrain/Rainbow-Code/blob/master/CodingChallenges/CC_11_PerlinNoiseTerrain/CC_11_PerlinNoiseTerrain.pde
// -
// Another way of seeing. Create heightmaps to allow blind people to touch the Visual Art.
// Load an image and extrudes pixels for create a 3D Mesh.
// The height of each point was calculated depending on the colour of each 
// of the image pixels. Black colour will represent the lowest value and white the highest one.


String fileName1 = "basquiat.jpg";
String fileName2 = "basquiat_disturbo5.jpg";
String fileName3 = "basquiat_disturbo10.jpg";
String fileName4 = "basquiat_sfocat3.jpg";

boolean tasto1 = true;
boolean tasto2 = false;
boolean tasto3 = false;
boolean tasto4 = false;

import processing.pdf.*;
boolean recordPDF;

import nervoussystem.obj.*;   //export obj
boolean record;


import controlP5.*;
ControlP5 cp5;

boolean brightness = true;
boolean saturation = false;

float rotationX = 0, rotationY = 0, rotationZ = 0;

PImage img;
int W ;                  
int H ;                  

ArrayList points = new ArrayList(); // < per nuvola punti
float[][] mesh;                     // < per piano mesh superficie

// qui le variabili che controllano la visualizzazione

float spessore = 0.2;                     // < scala delle altezze visualizzate
int risoluzione = 3;                    // < risoluzione, un punto ogni risoluzione dell'immagine
float meshSize = 0.5;                   // < scala del piano mesh superficie
int apertura = 0;

boolean showPunti = false;
boolean showPmeshWire = false; 
boolean showPmeshFill = true;
boolean recordFrame = false;

void setup()
{
  //size (800, 800, P3D);
  fullScreen(P3D);
  pixelDensity(displayDensity());

  hint(ENABLE_STROKE_PERSPECTIVE); 

  cp5 = new ControlP5(this);
  setupGUI();

  radiobutton.activate(0);

  colorMode(HSB, 100);
  background(0);
}

void draw()
{
  hint(ENABLE_DEPTH_TEST);
  pushMatrix();

  if (tasto1 == true) { carica(fileName1); }
  if (tasto2 == true) { carica(fileName2); }
  if (tasto3 == true) { carica(fileName3); }
  if (tasto4 == true) { carica(fileName4); }

  if (recordPDF) {
    String nomeFile = "pdf/model_"+year()+month()+day()+"_"+minute()+second()+millis()+".pdf";
    beginRaw(PDF, nomeFile);
  }

  background(0);
  lights();

  // immagine di riferimento in basso a dx 
  image(img, width-170, height-170*H/W, 150, 150*H/W);

  if (record) { //nome del file obj esportato
    String nomeFile = "data/model_"+year()+month()+day()+"_"+minute()+second()+millis()+".obj";
    beginRecord("nervoussystem.obj.OBJExport", nomeFile);
  }

  // spostati e ruota col mouse
  translate(width/2, height/2, 0);
  rotateY(rotationY);
  rotateX(rotationX);
  rotateZ(rotationZ);

  // MOSTRA NUVOLA PUNTI

  if (showPunti && !record) {
    pushMatrix();
    colorMode(HSB, 100);
    strokeWeight(4);
    displayNuvolaPunti(); // < disegna
    popMatrix();
  }

  // MOSTRA WIREFRAME MESH

  if (showPmeshWire && !record) {
    pushMatrix();

    // spostati e disegna il piano mesh al centro wireframe
    translate(-W/2*meshSize, -H/2*meshSize, -apertura);

    noFill();
    strokeWeight(1);
    colorMode(RGB, 255);
    stroke(232, 12, 122);

    displayMesh(); // < disegna
    popMatrix();
  }


  // MOSTRA MESH

  if (showPmeshFill || record) {
    pushMatrix();

    //translate(0, 0, -apertura);

    // spostati e disegna il piano mesh al centro wireframe
    translate(-W/2*meshSize, -H/2*meshSize, -apertura);
    colorMode(RGB, 255);
    fill(255, 255, 255);
    noStroke();

    displayMesh();
    popMatrix();
  }



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

  gui();

  if (recordFrame) {
    saveFrame("screenshot/schermata_"+year()+month()+day()+"_"+minute()+second()+millis()+".tiff");
    recordFrame = false;
  }

} //end draw


void displayNuvolaPunti() {
  // visualizza la heightmap di punti a schermo
  for (int i = 0; i<points.size(); i++) {
    PVector p = (PVector) points.get(i);
    stroke(p.z);
    point(p.x*meshSize, p.y*meshSize, p.z*spessore);//*cos(hgt));
  }
}

void displayMesh() {
  for (int x = 0; x<W-risoluzione; x+=risoluzione) {
    for (int y = 0; y<H-risoluzione; y+=risoluzione) {
      //PImage image = loadImage("texture-green.jpg");
      beginShape(QUAD); //(TRIANGLE_STRIP);(QUADS);(LINES); //registro i vertici
      //textureMode(NORMAL);
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
    tasto1= true;
    tasto2= false;
    tasto3= false;
    tasto4= false;
  } else if (key=='2') {
    tasto2 = true;
    tasto1= false;
    tasto3= false;
    tasto4= false;
  } else if (key=='3') {
    tasto3 = true;
    tasto1= false;
    tasto2= false;
    tasto4= false;
  } else if (key=='4') {
    tasto4 = true;
    tasto1= false;
    tasto2= false;
    tasto3= false;
  } else if (key=='o' || key=='O') {
    record = true;
  } else if (key=='p' || key=='P') {
    recordPDF = true;
  } else if (key=='f' || key=='F') {
    recordFrame = true;
  }else if (key==' ') {
    rotationX=0;
    rotationY=0;
    rotationZ=0;
  }
} 


// puoi caricare n file, potresti anche 
// caricare in modo dinamico l'immagine
// vedi es. https://processing.org/reference/selectInput_.html