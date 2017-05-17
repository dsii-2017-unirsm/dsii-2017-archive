// spaziatura
import processing.pdf.*;
boolean saveOneFrame = false;
int spaziatura=10;

int percentuale = 70;
int percentuale2 = 40;
int percentuale3 = 80;
int percentuale4 = 10;
int percentuale5 = 30;
int percentuale6 = 10;
int percentuale7 = 40;
int percentuale8 = 50;

float[] percentualeLettere = new float[10000];
float[] percentualeLettere2 = new float[10000];
float[] percentualeLettere3 = new float[10000];
float[] percentualeLettere4 = new float[10000];
float[] percentualeLettere5 = new float[10000];
float[] percentualeLettere6 = new float[10000];
float[] percentualeLettere7 = new float[10000];
float[] percentualeLettere8 = new float[10000];


static final int NUM = 2;
final TextBox[] tboxes = new TextBox[NUM];
int idx;



void setup() {
  ////// ciclo percentuale dislessia //////
  // 0 valore della percentuale , modifica la lettera
  // 1 valore della parte restante , non modificare la lettera 

  float r = 0;

  for (int i=0; i<10000; i++ ) {
    r= random(100);
    if (r>percentuale) {
      percentualeLettere[i]=0;
    } else {  
      percentualeLettere[i]=1;
    }
  }
  for (int i=0; i<10000; i++ ) {
    r= random(100);
    if (r>percentuale2) {
      percentualeLettere2[i]=0;
    } else {  
      percentualeLettere2[i]=1;
    }
  }
  for (int i=0; i<10000; i++ ) {
    r= random(100);
    if (r>percentuale3) {
      percentualeLettere3[i]=0;
    } else {  
      percentualeLettere3[i]=1;
    }
  }
  for (int i=0; i<10000; i++ ) {
    r= random(100);
    if (r>percentuale4) {
      percentualeLettere4[i]=0;
    } else {  
      percentualeLettere4[i]=1;
    }
  }
  for (int i=0; i<10000; i++ ) {
    r= random(100);
    if (r>percentuale5) {
      percentualeLettere5[i]=0;
    } else {  
      percentualeLettere5[i]=1;
    }
  }
  for (int i=0; i<10000; i++ ) {
    r= random(100);
    if (r>percentuale6) {
      percentualeLettere6[i]=0;
    } else {  
      percentualeLettere6[i]=1;
    }
  }
  for (int i=0; i<10000; i++ ) {
    r= random(100);
    if (r>percentuale7) {
      percentualeLettere7[i]=0;
    } else {  
      percentualeLettere7[i]=1;
    }
  }
   for (int i=0; i<10000; i++ ) {
    r= random(100);
    if (r>percentuale8) {
      percentualeLettere8[i]=0;
    } else {  
      percentualeLettere8[i]=1;
    }
  }
  ////// dimensioni e set up di base //////
  size(640, 480);
  frameRate(20);
  smooth(2);

  rectMode(CORNER);
  textAlign(LEFT);
  strokeWeight(1.5);

  instantiateBoxes();
  tboxes[idx = 1].isFocused = true;
}

void draw() {
  background(#778C85);
  for (int i = 0; i != NUM; tboxes[i++].display());
  TastoStampa();
}

void mouseClicked() {
  int i = idx = -1;
  while (++i != NUM)  if (tboxes[i].checkFocus())  idx = i;
}

void keyTyped() {
  final char k = key;
  if (k == CODED | idx < 0)  return;

  final TextBox tbox = tboxes[idx];
  final int len = tbox.txt.length();

  if (k == BACKSPACE)  tbox.txt = tbox.txt.substring(0, max(0, len-1));
  else if (len >= tbox.lim)  return;
  else if (k == ENTER | k == RETURN)     tbox.txt += "\n";
  else if (k == TAB & len < tbox.lim-3)  tbox.txt += "    ";
  else if (k == DELETE)  tbox.txt = "";
  else if (k >= ' ')     tbox.txt += str(k);
}

void keyPressed() {
  if (key != CODED | idx < 0)  return;
  final int k = keyCode;

  final TextBox tbox = tboxes[idx];
  final int len = tbox.txt.length();

  if (k == LEFT)  tbox.txt = tbox.txt.substring(0, max(0, len-1));
  else if (k == RIGHT & len < tbox.lim-3)  tbox.txt += "    ";
}

////// Variabile scatole del testo testo //////
void instantiateBoxes() {
  tboxes[0] = new TextBox(
    width>>2, height/4 + height/16, // x, y
    width - width/2, height/2 - height/4 - height/8, // w, h
    215, // lim
    0300 << 030, color(-1, 040), // textC, baseC
    color(-1, 0100), color(#FF00FF, 0200), 27); // bordC, slctC

  tboxes[1] = new TextBox(
    width>>3, height/2 + height/8, // x, y
    width - width/4, height - height/2 - height/4, // w, h
    640, // lim
    0300 << 030, color(-1, 040), // textC, baseC
    color(-1, 0100), color(#FFFF00, 0200), 12); // bordC, slctC
}

class TextBox { // demands rectMode(CORNER)
  final color textC, baseC, bordC, slctC;
  final short x, y, w, h, xw, yh, lim;

  int size;

  boolean isFocused;
  String txt = "  ";

  
  boolean DSA = false;
  String txtDSA = " ";

  TextBox(int xx, int yy, int ww, int hh, int li, 
    color te, color ba, color bo, color se, int s_) {
    x = (short) xx;
    y = (short) yy;
    w = (short) ww;
    h = (short) hh;

    lim = (short) li;

    xw = (short) (xx + ww);
    yh = (short) (yy + hh);

    textC = te;
    baseC = ba;
    bordC = bo;
    slctC = se;

    size = s_;
  }

  void display() {
    if (!DSA) { 
      text(txt + blinkChar(), x, y, w, h);
    } 
    fill(0);
    DSA();
  }
////// Regole DSA  //////
  void DSA() {
    char[] lettere = txt.toCharArray();
    for (int i=0; i<lettere.length; i++ ) {
//////  BD  //////
      if (percentualeLettere[i]==0) {
        if (lettere[i]=='b') {
          lettere[i]='d';
        }
      } else {

        if (lettere[i]=='d') {
          lettere[i]='b';
        }
      }
//////  AE  //////
      if (percentualeLettere2[i]==0) {
        if (lettere[i]=='a') {
          lettere[i]='e';
        }
      } else {

        if (lettere[i]=='e') {
          lettere[i]='a';
        }
      }
//////  UN  //////
      if (percentualeLettere3[i]==0) {
        if (lettere[i]=='u') {
          lettere[i]='n';
        }
      } else {
        if (lettere[i]=='n') {
          lettere[i]='u';
        }
      }
//////  MN  //////
      if (percentualeLettere4[i]==0) {
        if (lettere[i]=='m') {
          lettere[i]='n';
        }
      } else {
        if (lettere[i]=='n') {
          lettere[i]='m';
        }
      }
//////  PB  //////
      if (percentualeLettere5[i]==0) {
        if (lettere[i]=='p') {
          lettere[i]='b';
        }
      } else {
        if (lettere[i]=='b') {
          lettere[i]='p';
        }
      }
//////  DQ  //////
      if (percentualeLettere6[i]==0) {
        if (lettere[i]=='d') {
          lettere[i]='q';
        }
      } else {
        if (lettere[i]=='q') {
          lettere[i]='d';
        }
      }
//////  CE  //////
      if (percentualeLettere7[i]==0) {
        if (lettere[i]=='c') {
          lettere[i]='e';
        }
      } else {
        if (lettere[i]=='e') {
          lettere[i]='c';
        }
      }
//////  FT  //////
      if (percentualeLettere8[i]==0) {
        if (lettere[i]=='f') {
          lettere[i]='t';
        }
      } else {
        if (lettere[i]=='t') {
          lettere[i]='f';
        }
      }
      
      
      
      
      text(str(lettere[i]), 20+i*spaziatura, 50, w, h);
    }
  }


  void regola(String txt_) {
  }

  String blinkChar() {
    return isFocused && (frameCount>>2 & 1) == 0 ? "_" : "";
  }

  boolean checkFocus() {
    return isFocused = mouseX > x & mouseX < xw & mouseY > y & mouseY < yh;
  }
}

void TastoStampa() {  // se premo a fermo il loop
  if ((mouseX > 40) && (mouseX < 80) &&
    (mouseY > 20) && (mouseY < 80) && (mouseButton == LEFT)) {
      beginRecord(PDF, "filename.pdf"); 
      fill(255);
  } else {
    endRecord();
    fill(0);
  }
  rect(20, 420, 40, 40);
  text("Expot PDF", 20, 410);
  
}


