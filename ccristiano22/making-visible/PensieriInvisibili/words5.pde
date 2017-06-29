// link utile per spaziatura caratteri > https://forum.processing.org/one/topic/change-character-spacing.html
import processing.pdf.*;
import controlP5.*;

ControlP5 cp5;
TextBox tbox;
boolean record;
boolean load1 = false;
boolean load2 = false;
boolean load3 = false;
boolean reset = false;
int idx;
// ci va aggiunta % per ognuna delle tipologie
// ci va aggiunta % su dimensione font (FS) 
// e spaziatura lettere (SL), spaziatura parole (SP) e interlinea (IL)

int FS = 20;
int IL = 1;
int SL = 1;
int SP = 1;

float BD;
float EA;
float NU;
float MN;
float BP;
float QD;
float CE;
float FT;

float Doppie;

String[] parole1;
String[] parole2;
String[] parole3;
int index = 0;

PFont Georgia;
PFont Helvetica;
PFont Inconsolata;
PFont Courier;

boolean font0 = false;
boolean font1 = false;
boolean font2 = false;
boolean font3 = false;

void setup() {
  fullScreen();
  //size(1024, 800);
  pixelDensity(displayDensity());
  textSize(FS);

  
  String[] lines1 = loadStrings("list1.txt");
  String entireplay1 = join(lines1, "  ");
  String[] lines2 = loadStrings("list2.txt");
  String entireplay2 = join(lines2, "  ");
  String[] lines3 = loadStrings("list3.txt");
  String entireplay3 = join(lines3, "  ");
  printArray(lines1);
  printArray(lines2);
  printArray(lines3);
  printArray(entireplay1);
  printArray(entireplay2);
  printArray(entireplay3);
  parole1 = split(entireplay1, "   ");
  parole2 = split(entireplay2, "   ");
  parole3 = split(entireplay3, "   ");
  
  cp5 = new ControlP5(this);
  cp5.addFrameRate().setInterval(10).setPosition(width-20,10);

  tbox = new TextBox(                                  
    width>>2, height/2 + height/8, // x, y
    width - width/3, height - height/2 - height/4, // w, h
    600, // lim
    0300 << 030, color(-1, 0200), // textC, baseC
    color(-1, 0100), color(#FFFF00, 0200), 30);      // bordC, slctC

    tbox.isFocused = true;
    setupGUI();
}

void draw() {
  background(150);
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
  if (k == ' ' && SP == 2 & len < tbox.lim-2)  tbox.txt += "  ";
  if (k == ' ' && SP == 3 & len < tbox.lim-3)  tbox.txt += "    ";
  if (k >= ' ' && SL == 2 & len < tbox.lim-2)  tbox.txt += "  ";
  if (k >= ' ' && SL == 3 & len < tbox.lim-3)  tbox.txt += "    ";
} 