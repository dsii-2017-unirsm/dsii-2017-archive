// spaziatura
import processing.pdf.*;
import controlP5.*;
ControlP5 cp5;

boolean record;
int spaziatura=10;
int fontSize=20;

int percentuale = 100;
int percentuale2 = 50;
int percentuale3 = 50;
int percentuale4 = 50;
int percentuale5 = 50;
int percentuale6 = 50;
int percentuale7 = 50;
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
  ////// Controllo variabili //////

  cp5 = new ControlP5(this);

  Group g1 = cp5.addGroup("g1")
    .setPosition(5, 25)
    .setWidth(250)
    .setHeight(20)
    .activateEvent(true)
    .setBackgroundColor(color(255, 80))
    .setBackgroundHeight(260)
    .setLabel("Parametri DSA")
    ;

  cp5.addSlider("percentuale")
    .setPosition(30, 15)
    .setSize(180, 9)
    .setGroup(g1)
    .setNumberOfTickMarks(20)
    .setRange(0, 100)
    .setLabel("B-D")
    ;

  cp5.addSlider("percentuale2")
    .setPosition(30, 40)
    .setSize(180, 9)
    .setGroup(g1)
    .setNumberOfTickMarks(20)
    .setRange(0, 100)
    .setLabel("A-E")
    ;
  cp5.addSlider("percentuale3")
    .setPosition(30, 65)
    .setSize(180, 9)
    .setGroup(g1)
    .setNumberOfTickMarks(20)
    .setRange(0, 100)
    .setLabel("U-N")
    ;
  cp5.addSlider("percentuale4")
    .setPosition(30, 90)
    .setSize(180, 9)
    .setGroup(g1)
    .setNumberOfTickMarks(20)
    .setRange(0, 100)
    .setLabel("N-M")
    ;
  cp5.addSlider("percentuale5")
    .setPosition(30, 115)
    .setSize(180, 9)
    .setGroup(g1)
    .setNumberOfTickMarks(20)
    .setRange(0, 100)
    .setLabel("P-B")
    ;
  cp5.addSlider("percentuale6")
    .setPosition(30, 140)
    .setSize(180, 9)
    .setGroup(g1)
    .setNumberOfTickMarks(20)
    .setRange(0, 100)
    .setLabel("D-Q")
    ;
  cp5.addSlider("percentuale7")
    .setPosition(30, 165)
    .setSize(180, 9)
    .setGroup(g1)
    .setNumberOfTickMarks(20)
    .setRange(0, 100)
    .setLabel("C-E")
    ;
  cp5.addSlider("percentuale8")
    .setPosition(30, 190)
    .setSize(180, 9)
    .setGroup(g1)
    .setNumberOfTickMarks(20)
    .setRange(0, 100)
    .setLabel("F-T")
    ;

  Group g2 = cp5.addGroup("g2")
    .setPosition(260, 25)
    .setWidth(250)
    .setHeight(20)
    .activateEvent(true)
    .setBackgroundColor(color(255, 80))
    .setBackgroundHeight(225)
    .setLabel("Lay Out Testo")
    ;
  cp5.addSlider("spaziatura")
    .setPosition(20, 15)
    .setSize(180, 9)
    .setGroup(g2)
    .setNumberOfTickMarks(20)
    .setRange(0, 100)
    .setLabel("spaziatura")
    ;
  cp5.addSlider("fontSize")
    .setPosition(20, 40)
    .setSize(180, 9)
    .setGroup(g2)
    .setNumberOfTickMarks(20)
    .setRange(8, 50)
    .setLabel("Font size")
    ;

  cp5.addButton("bang")
    .setPosition(1350, 20)
    .setSize(40, 40)
    //.setGroup(g2)
    .setLabel("Tasto Stampa");
  ;

  cp5.addButton("conferma")
    .setPosition(30, 215)
    .setSize(60, 30)
    .setGroup(g1)
    .setLabel("Conferma");
  ;

  //// set percentuali
  percentuali();


  ////// dimensioni e set up di base //////
  size(displayWidth, displayHeight);
  //fullScreen();
  frameRate(20);
  smooth();
  pixelDensity(2);

  rectMode(CORNER);
  textAlign(LEFT);
  strokeWeight(1.5);

  instantiateBoxes();
  tboxes[idx = 1].isFocused = true;
}

void draw() {

  background(#D1D9E8);
  for (int i = 0; i != NUM; tboxes[i++].display());
  stampa();
}

void mouseClicked() {
  int i = idx = -1;
  while (++i != NUM)  if (tboxes[1].checkFocus())  idx = i;
}

int lunghezzaTesto=0; // conta lettere

void keyTyped() {

  final char k = key;
  if (k == CODED | idx < 0)  return;
  final TextBox tbox = tboxes[idx];
  final int len = tbox.txt.length();
  lunghezzaTesto=len;
  if (k == BACKSPACE)  tbox.txt = tbox.txt.substring(0, max(0, len-1));
  else if (len >= tbox.lim)  return;
  else if (k == ENTER | k == RETURN)     tbox.txt += "\n";
  else if (k == TAB & len < tbox.lim-3)  tbox.txt += "    ";
  else if (k >= ' ')    tbox.txt += str(k);
  else if (k == DELETE)  tbox.txt = "";
}

void keyPressed() {

  if (key != CODED | idx < 0)  return;
  final int k = keyCode;

  final TextBox tbox = tboxes[idx];
  final int len = tbox.txtDSA.length();

  if (k == LEFT)  tbox.txt = tbox.txt.substring(0, max(0, len-1));

  else if (k == RIGHT & len < tbox.lim-3)  tbox.txt += "    ";
}

////// Variabile scatole del testo //////
void instantiateBoxes() {                                     // il testo DSA non viene inserito in questo box ma altrove
  tboxes[0] = new TextBox(                                    // non riesco a capire per bene dove e come poterlo mettere qui
    width>>2, height/4 + height/16, // x, y
    width - width/2, height/2 - height/4 - height/8, // w, h
    215, // lim
    0300 << 030, color(-1, 040), // textC, baseC
    color(-1, 0100), color(#FF00FF, 0200), 27); // bordC, slctC

  tboxes[1] = new TextBox(                                    // qui scrivo il teso OK
    width>>3, height/2 + height/8, // x, y
    width - width/4, height - height/2 - height/4, // w, h
    600, // lim
    0300 << 030, color(-1, 0200), // textC, baseC
    color(-1, 0100), color(#FFFF00, 0200), 30); // bordC, slctC
}

class TextBox { // demands rectMode(CORNER)
  final color textC, baseC, bordC, slctC;
  final short x, y, w, h, xw, yh, lim;

  int size;

  boolean isFocused;
  String txt = "  ";


  boolean DSA = false;
  String txtDSA = "  ";


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
      text(txt + blinkChar(), x, y, 300, 300);
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
      /*float cw = textWidth(str(lettere[i]))*spaziatura;
       text(str(lettere[i]), cw, 200, 300, 300);*/
      //text(str(lettere[i]), 20+i*spaziatura, 200, 300, 300);
      text(str(lettere[i]), 20+i*spaziatura, y, w, h);
      textSize(fontSize);
      println(str(lettere[i]));
      stroke(255);
      noFill();
    }
    noFill();
    rect(x, y, w, h);
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


public void conferma() {
  // record = true;
  percentuali();
}

public void bang() {
  record = true;
  println("stampa foglio");
}
void stampa() {
  if (record == true) {
    beginRecord(PDF, "DSA.pdf");
    println("ho stampato il foglio");

    background(#D1D9E8);
    for (int i = 0; i != NUM; tboxes[i++].display());

    if (record == true) {
      endRecord();
      record = false;
      println("fine stampa");
    }
  }
}
