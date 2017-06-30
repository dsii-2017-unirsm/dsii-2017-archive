class TextBox { // demands rectMode(CORNER)
  final color textC, baseC, bordC, slctC;
  final short x, y, w, h, xw, yh, lim;

  char[] lettere;
  char[] lettere2;
  int size;

  boolean isFocused;
  String[] lines1 = loadStrings("list1.txt");
  String[] lines2 = loadStrings("list2.txt");
  String[] lines3 = loadStrings("list3.txt");
  String txt = " ";
  String txtDys = " " ;
  
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


public void display() {
    fill(baseC);
    stroke(bordC);
    rect(x, y, w, h);
    fill(textC);
  // editor
     if (font0 == true){
       Inconsolata = createFont("Inconsolata", 20);
       textFont(Inconsolata);
       font0 = false;
    } else {  }
     if (font1 == true){
       Georgia = createFont("Georgia", 20);
       textFont(Georgia);
       font1 = false;
    } else {  }
    if (font2 == true){
       Helvetica = createFont("Helvetica", 20);
       textFont(Helvetica);
       font2 = false;
    } else {  }
     if (font3 == true){
       Courier = createFont("Courier New", 20);
       textFont(Courier);
       font3 = false;
    } else {  }

    
    textSize(20);
    textLeading(20);
    
    text(txt + blinkChar(), x, y, w, h);
    if (load1 == true){
    txt = " "  + join(lines1, ENTER);
    text(txt + blinkChar(), x, y, w, h);
    load1 = false;
    } else if (load1 == false){
    text(txt + blinkChar(), x, y, w, h);
    }
    if (load2 == true){
    txt = " "  + join(lines2, ENTER);
    text(txt + blinkChar(), x, y, w, h);
    load2 = false;
    } else if (load2 == false){
    text(txt + blinkChar(), x, y, w, h);
    }
    if (load3 == true){
    txt = " "  + join(lines3, ENTER);
    text(txt + blinkChar(), x, y, w, h);
    load3 = false;
    } else if (load3 == false){
    text(txt + blinkChar(), x, y, w, h);
    }
    // visualizzatore dys 
    // inizio style
    textSize(FS);
    textLeading(FS * IL);
    // fine style
    text(txtDys, x, y-300, w, h);
// drawText con kerning (modificare anche la gui e +map qui sotto aumentando il range della variabile SL)    
    //drawText(txtDys, x, SL);
}
// seprimentazione del kerning attraverso la funzione drawText
void drawText(String message, int fontXPos, int charSpacing) {
  for (int i = 0; i < message.length()-1; i++) {
    text(message, fontXPos, fontYPos, width, height);
    fontXPos += charSpacing;
  }
}
// Simulazione degli errori dislessia
 void dys() {
    lettere = txt.toCharArray();
    for (int i=0; i<lettere.length-1; i++) {
      char c = lettere[i];
      char c1 = lettere[i+1];
      
      // metaCASO QUI IL BUSILLISI
      float metaCaso = Doppie
        + map(FS, 8, 32, 1, 20)
        + map(IL, 1, 3, 1, 10) // font size 8-32
        + map(SL, 1, 3, 1, 10)  // spaziatura lettere ?
        + map(SP, 1, 3, 1, 25)  // spaziatura parole
        ;

      //

      if (random(101) >= metaCaso) { // < qui varia la % totale di incontrare errori... 
        // 0 = molto probabile, 100 = molto rara

        if (c == c1 /*&& random(1) < casoDoppie*/) rimuovi(i+1);  // 0 doppie
      }
      map(Doppie, 50, 101, 50, 100);
            
      float metaCaso1 = BD
        + map(FS, 8, 32, 1, 20)
        + map(IL, 1, 3, 1, 10) // font size 8-32
        + map(SL, 1, 3, 1, 10)  // spaziatura lettere ?
        + map(SP, 1, 3, 1, 25)  // spaziatura parole
        ;
      println(metaCaso1);
      //

      if (random(101) >= metaCaso1) { // < qui varia la % totale di incontrare errori... 
        // 0 = molto probabile, 100 = molto rara

        if (c == 'b') c = 'd'; // 1 b-d
        else if (c == 'd') c = 'b';
      }
      
      
      map(BD, 50, 101, 50, 100);
      
      
      float metaCaso2 = EA
        + map(FS, 8, 32, 1, 15)
        + map(IL, 1, 3, 1, 10) // font size 8-32
        + map(SL, 1, 3, 1, 10)  // spaziatura lettere ?
        + map(SP, 1, 3, 1, 15)  // spaziatura parole
        ;
        ;
      //

      if (random(101) >= metaCaso2) { // < qui varia la % totale di incontrare errori... 
        // 0 = molto probabile, 100 = molto rara

        if (c == 'a') c = 'e'; // 2 a-e
        else if (c == 'e') c = 'a';
      }
      
       map(EA, 50, 101, 50, 100);

      float metaCaso3 = NU
        + map(FS, 8, 32, 1, 20)
        + map(IL, 1, 3, 1, 10) // font size 8-32
        + map(SL, 1, 3, 1, 10)  // spaziatura lettere ?
        + map(SP, 1, 3, 1, 25)  // spaziatura parole
        ;
   
      //

      if (random(101) >= metaCaso3){ // < qui varia la % totale di incontrare errori... 
        // 0 = molto probabile, 100 = molto rara

        if (c == 'u') c = 'n'; // 3 u-n
        else if (c == 'n') c = 'u';
      }
      
       map(NU, 50, 101, 50, 100);
      
      float metaCaso4 = MN
        + map(FS, 8, 32, 1, 20)
        + map(IL, 1, 3, 1, 10) // font size 8-32
        + map(SL, 1, 3, 1, 10)  // spaziatura lettere ?
        + map(SP, 1, 3, 1, 25)  // spaziatura parole
        ;

      //

      if (random(101) >= metaCaso4){  // < qui varia la % totale di incontrare errori... 
        // 0 = molto probabile, 100 = molto rara
        
        if (c == 'n') c = 'm'; // 4 m-n < condtraddizione n/m
        else if (c == 'm') c = 'n';
      }
      
      map(MN, 50, 101, 50, 100);

      float metaCaso5 = BP
        + map(FS, 8, 32, 1, 20)
        + map(IL, 1, 3, 1, 10) // font size 8-32
        + map(SL, 1, 3, 1, 10)  // spaziatura lettere ?
        + map(SP, 1, 3, 1, 25)  // spaziatura parole
        ;

      //

      if (random(101) >= metaCaso5) { // < qui varia la % totale di incontrare errori... 
        // 0 = molto probabile, 100 = molto rara
        if (c == 'p') c = 'b'; // 5 p-b
        else if (c == 'b') c = 'p';
      }
      
      map(BP, 50, 101, 50, 100);
      
      float metaCaso6 = QD
        + map(FS, 8, 32, 1, 20)
        + map(IL, 1, 3, 1, 10) // font size 8-32
        + map(SL, 1, 3, 1, 10)  // spaziatura lettere ?
        + map(SP, 1, 3, 1, 25)  // spaziatura parole
        ;

      //

      if (random(101) >= metaCaso6) { // < qui varia la % totale di incontrare errori... 
        // 0 = molto probabile, 100 = molto rara
        if (c == 'd') c = 'q'; // 6 d-q
        else if (c == 'q') c = 'd';
      }
      
      map(NU, 50, 101, 50, 100);

      float metaCaso7 = CE
        + map(FS, 8, 32, 1, 20)
        + map(IL, 1, 3, 1, 10) // font size 8-32
        + map(SL, 1, 3, 1, 10)  // spaziatura lettere ?
        + map(SP, 1, 3, 1, 25)  // spaziatura parole
        ;

      //

      if (random(101) >= metaCaso7) { // < qui varia la % totale di incontrare errori... 
        // 0 = molto probabile, 100 = molto rara
        if (c == 'c') c = 'e'; // 7 e-c
        else if (c == 'e') c = 'c';
      }
      
      map(CE, 50, 101, 50, 100);

      float metaCaso8 = BP
        + map(FS, 8, 32, 1, 20)
        + map(IL, 1, 3, 1, 10) // font size 8-32
        + map(SL, 1, 3, 1, 10)  // spaziatura lettere ?
        + map(SP, 1, 3, 1, 25)  // spaziatura parole
        ;

      //

      if (random(101) >= metaCaso8) { // < qui varia la % totale di incontrare errori... 
        // 0 = molto probabile, 100 = molto rara
        if (c == 'f') c = 't'; // 8 f-t
        else if (c == 't') c = 'f';
      }
      map(BP, 50, 101, 50, 100);

      lettere[i] = c;
    }
    txtDys = new String(lettere);
  }
  
 // funzione doppie
  void rimuovi(int i) {
    char[] letterePrima = subset(lettere, 0, i);
    char[] lettereDopo = 
 
subset(lettere, i+1);
    lettere = concat(letterePrima, lettereDopo);
  }
  String blinkChar() {
    return isFocused && (frameCount>>2 & 1) == 0 ? "_" : "";
  }

  boolean checkFocus() {
    return isFocused = mouseX > x & mouseX < xw & mouseY > y & mouseY < yh;
  }
}