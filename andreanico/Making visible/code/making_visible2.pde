// rev_base by Alun Moon
// 1_upgrade demo by Fupete 
// 2_upgrade by Andrea Nico
// solid revolution demo

// 2017 © Daniele @Fupete and the course DSII2017 @UniRSM  
// github.com/fupete — github.com/dsii-2017-unirsm
// github.com/andreanico — github.com/dsii-2017-unirsm
// Educational purposes, MIT License, 2017, San Marino

// --- 

// Credits to https://www.openprocessing.org/sketch/93934 by Alun Moon

// ---

// Controls: 
// [spazio] vedi forma 3D o linea generatrice
// [o] esporta OBJ 3D
// [p] esporta PDF

// ---


import peasy.*;               // libreria per Camera con ruota/zoom 3d semplice
PeasyCam cam;

import processing.pdf.*;      // import this library
boolean recordPDF;            // variable (true or false)

import nervoussystem.obj.*;   //import this library
boolean record;               // variable (true or false)

import controlP5.*;           //import this library
import java.util.*;           //import this library
ControlP5 cp5;


String m = "wireframe";                  //type of visualization (wireframe is the starting mode)
boolean cambiandoModo = false;           

PShape rev;                              
PShape f;
float scala, factor;
PImage img;
int Segments = 64;                       

boolean wireframe = true;                
boolean texture = false;
boolean solido = false;

boolean viewForma = true;                //used to visualaze the shape    

Table mytable;                           //used to import data from Csv file
int cx, cy;                              //variable coordinates x,y

color colore_solido;                     //create variable color(called colore solido) for solid mode
int colore = 1;                          // start color value is 1


public void setup() {
  fullScreen(P3D);                        //create fullscreen window and an ambient 3D
  hint(ENABLE_STROKE_PERSPECTIVE);        

  cp5 = new ControlP5(this);              //create options bar from CP5 library
  setupOPTIONS();
  cp5.setAutoDraw(false);

  cam = new PeasyCam(this, 300);          //create settings camera
  cam.setMinimumDistance(200);
  cam.setMaximumDistance(600);
  
  textureMode(NORMAL);                    
  img = loadImage("texture.png");         //load file png froma a folder
  colorMode(RGB, 255);                    //set color mode to 255 value (white)
}



public void draw() {
  background(0);                          //set background color to this() value                        
  lights();                               //create lights 
  
  hint(ENABLE_DEPTH_TEST);
  pushMatrix();

  if (recordPDF) {                                                                                          //save date PDF file
    String nomeFile = "pdf/model_"+year()+month()+day()+"_"+minute()+second()+millis()+".pdf";
    beginRaw(PDF, nomeFile);
  }

  if (record) {                                                                                             //save date OBJ file
    String nomeFile = "data/model_"+year()+month()+day()+"_"+minute()+second()+millis()+".obj";
    beginRecord("nervoussystem.obj.OBJExport", nomeFile);
  }
 
  forma();
  rev = revolve(f, img);                     //revolve section

  

  if (viewForma && !record) {
    shape(f);
  } else {
    shape(rev);
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
  noLights();                                                      //disable lights
  
    if (colore == 0) { colore_solido = #FFFFFF; }                  //color 0 is 
    if (colore == 1) { colore_solido = #08D9E1; }                  //color 1 is 
    if (colore == 2) { colore_solido = #0ABC98; }                  //color 2 is 
    if (colore == 3) { colore_solido = #07D672; }                  //color 3 is 
    if (colore == 4) { colore_solido = #CCFF00; }                  //color 4 is 
    if (colore == 5) { colore_solido = #FFF600; }                  //color 5 is 
    if (colore == 6) { colore_solido = #FFAE00; }                  //color 6 is 
    if (colore == 7) { colore_solido = #FF6300; }                  //color 7 is 
    if (colore == 8) { colore_solido = #FF0018; }                  //color 8 is 
    if (colore == 9) { colore_solido = #FF00B4; }                  //color 9 is 
    if (colore == 10) { colore_solido = #D800FF; }                 //color 10 is 
    if (colore == 11) { colore_solido = #5A00FF; }                 //color 11 is 
    
  gui();
}

void forma() {
  mytable = loadTable("coordinate.csv", "header");                 //get data from csv

  f = createShape();                                               //start to draw shape
  f.beginShape();
  f.stroke(colore_solido);                                             //line is white
  
  if (scala == 1) { factor = 0.6; }
  if (scala == 2) { factor = 0.7; }
  if (scala == 3) { factor = 0.8; }
  if (scala == 4) { factor = 0.9; }
  if (scala == 5) { factor = 1.0; }
  if (scala == 6) { factor = 1.1; }
  if (scala == 7) { factor = 1.2; }
  if (scala == 8) { factor = 1.3; }
  if (scala == 9) { factor = 1.4; }
  if (scala == 10) { factor = 1.5; }

  for (TableRow row : mytable.rows()) {
    cx = row.getInt("cx");                                         //get value cx (of the point)
    cy = row.getInt("cy");                                         //get value cy (of the point)
    f.vertex(cy*factor, cx*factor-100);                                          //adjust position cx
  }
  f.noFill();                                                      //forma does not have fill
  f.endShape();                                                    //end to draw shape
}

void keyPressed() {
  if (key=='S' || key == 's') {
    record = true;
  } else if (key=='P' || key == 'p') {                            //P key to record file PDF
    recordPDF = true;
  } else if (key == ' ') {
    viewForma = !viewForma;
  } else if (key == 'O' || key == 'o') {                          //O key to record file OBJ
    record = true;
  }
}
