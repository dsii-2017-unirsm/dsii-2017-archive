// link utile per spaziatura caratteri > https://forum.processing.org/one/topic/change-character-spacing.html
import processing.pdf.*;
import controlP5.*;

ControlP5 cp5;
TextBox tbox;
boolean record;
int idx;
// ci va aggiunta % per ognuna delle tipologie
// ci va aggiunta % su dimensione font (FS) 
// e spaziatura lettere (SL), spaziatura parole (SP) e interlinea (IL)

int FS = 32;
int IL = 0;
int SL = 0;
float BD;
float EA;
float NU;
float MN;
float BP;
float QD;
float CE;
float FT;
float Doppie;
int fontXPos = 10;


void setup() {
  //  fullScreen();
  size(1024, 800);
  pixelDensity(displayDensity());
  textSize(FS);

  setupGUI();

  tbox = new TextBox(                                  
    width>>3, height/2 + height/8, // x, y
    width - width/4, height - height/2 - height/4, // w, h
    600, // lim
    0300 << 030, color(-1, 0200), // textC, baseC
    color(-1, 0100), color(#FFFF00, 0200), 30);      // bordC, slctC

  tbox.isFocused = true;
}


void draw() {
  background(125);
  if (record == true){
  stampa();
  }
   tbox.display();
  if (frameCount%60 == 0) tbox.dys();
}


void mouseClicked() {
  int i = idx = -1;
  while (++i != 1)  if (tbox.checkFocus())  idx = i;
}


void keyPressed() {
  if (key != CODED | idx < 0)  return;
  final int k = keyCode;
  final int len = tbox.txt.length();

  if (k == LEFT)  tbox.txt = tbox.txt.substring(0, max(0, len-1));
  else if (k == RIGHT & len < tbox.lim-1)  tbox.txt += " ";
}


void keyTyped() {
  final char k = key;
  if (k == CODED | idx < 0)  return;
  final int len = tbox.txt.length();
  if (k == BACKSPACE)  tbox.txt = tbox.txt.substring(0, max(0, len-1));
  else if (len >= tbox.lim)  return;
  else if (k == ENTER | k == RETURN)     tbox.txt += "\n";
  else if (k == TAB & len < tbox.lim-3)  tbox.txt += "    ";
  else if (k >= ' ')    tbox.txt += str(k);
  else if (k == DELETE)  tbox.txt = "";
}

void drawText(String message, int fontXPos, int fontYPos, int charSpacing) {
  for (int i = 0; i < message.length(); i++) {
    text(message.charAt(i), fontXPos, fontYPos);
    fontXPos += charSpacing;
  }
}