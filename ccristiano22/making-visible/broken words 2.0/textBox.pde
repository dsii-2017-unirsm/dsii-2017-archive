
class TextBox { // demands rectMode(CORNER)
  final color textC, baseC, bordC, slctC;
  final short x, y, w, h, xw, yh, lim;

  char[] lettere;
  int size;

  boolean isFocused;
  String txt = " ";
  String txtDys = " ";



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
    fill(baseC);
    stroke(bordC);
    rect(x, y, w, h);
    fill(textC);

    // editor
    textSize(12);
    textLeading(12);
    text(txt + blinkChar(), x, y, w, h);

    // visualizzatore dys
    // inizio style
    textSize(FS);
    textLeading(FS * IL);
    // fine style
    text(txtDys, x, y-300, w, h);
  }


  void dys() {
    lettere = txt.toCharArray();
    for (int i=0; i<lettere.length-1; i++ ) {
      char c = lettere[i];
      char c1 = lettere[i+1];

      // metaCASO QUI IL BUSILLISI
      
      float metaCaso = Doppie
        + map(FS, 8, 32, 0.0, 0.20)
        + map(IL, 8, 32, 0.0, 0.10) // font size 8-32
        + map(SL, 8, 32, 0.0, 0.10)  // spaziatura lettere ?
      /*+ map(SP, 8, 32, 0.0, 0.25)  // spaziatura parole
       // interlinea*/
        ;
      println(metaCaso);
      //

      if (random(1) >= metaCaso) { // < qui varia la % totale di incontrare errori... 
        // .1 = molto probabile, .9 = molto rara

        if (c == c1 /*&& random(1) < casoDoppie*/) rimuovi(i+1);  // 0 doppie

      }

      float metaCaso1 = BD
        + map(FS, 8, 32, 0.0, 0.20)
        + map(IL, 8, 32, 0.0, 0.10) // font size 8-32
        + map(SL, 8, 32, 0.0, 0.10)  // spaziatura lettere ?
      /*+ map(SP, 8, 32, 0.0, 0.25)  // spaziatura parole
       // interlinea*/
        ;
      println(metaCaso1);
      //

      if (random(1) >= metaCaso1) { // < qui varia la % totale di incontrare errori... 
        // .1 = molto probabile, .9 = molto rara

        if (c == c1 /*&& random(1) < casoDoppie*/) rimuovi(i+1);  // 0 doppie

        else if (c == 'b') c = 'd'; // 1 b-d
        else if (c == 'd') c = 'b';
      }
      float metaCaso2 = EA
        + map(FS, 8, 32, 0.0, 0.20)
        + map(IL, 8, 32, 0.0, 0.10) // font size 8-32
        + map(SL, 8, 32, 0.0, 0.10)  // spaziatura lettere ?
      /*+ map(SP, 8, 32, 0.0, 0.25)  // spaziatura parole
       // interlinea*/
        ;
      println(metaCaso2);
      //

      if (random(1) >= metaCaso2) { // < qui varia la % totale di incontrare errori... 
        // .1 = molto probabile, .9 = molto rara

        if (c == c1 /*&& random(1) < casoDoppie*/) rimuovi(i+1);  // 0 doppie

        else if (c == 'a') c = 'e'; // 2 a-e
        else if (c == 'e') c = 'a';
      }

      float metaCaso3 = NU
        + map(FS, 8, 32, 0.0, 0.20)
        + map(IL, 8, 32, 0.0, 0.10) // font size 8-32
        + map(SL, 8, 32, 0.0, 0.10)  // spaziatura lettere ?
      /*+ map(SP, 8, 32, 0.0, 0.25)  // spaziatura parole
       // interlinea*/
        ;
      println(metaCaso3);
      //

      if (random(1) >= metaCaso3) { // < qui varia la % totale di incontrare errori... 
        // .1 = molto probabile, .9 = molto rara

        if (c == c1 /*&& random(1) < casoDoppie*/) rimuovi(i+1);  // 0 doppie

        else if (c == 'u') c = 'n'; // 3 u-n
        else if (c == 'n') c = 'u';
      }
      float metaCaso4 = MN
        + map(FS, 8, 32, 0.0, 0.20)
        + map(IL, 8, 32, 0.0, 0.10) // font size 8-32
        + map(SL, 8, 32, 0.0, 0.10)  // spaziatura lettere ?
      /*+ map(SP, 8, 32, 0.0, 0.25)  // spaziatura parole
       // interlinea*/
        ;
      println(metaCaso4);
      //

      if (random(1) >= metaCaso4) { // < qui varia la % totale di incontrare errori... 
        // .1 = molto probabile, .9 = molto rara

        if (c == c1 /*&& random(1) < casoDoppie*/) rimuovi(i+1);  // 0 doppie

        else if (c == 'n') c = 'm'; // 4 m-n < condtraddizione n/m
        else if (c == 'm') c = 'n';
      }  

      float metaCaso5 = BP
        + map(FS, 8, 32, 0.0, 0.20)
        + map(IL, 8, 32, 0.0, 0.10) // font size 8-32
        + map(SL, 8, 32, 0.0, 0.10)  // spaziatura lettere ?
      /*+ map(SP, 8, 32, 0.0, 0.25)  // spaziatura parole
       // interlinea*/
        ;
      println(metaCaso5);
      //

      if (random(1) >= metaCaso5) { // < qui varia la % totale di incontrare errori... 
        // .1 = molto probabile, .9 = molto rara

        if (c == c1 /*&& random(1) < casoDoppie*/) rimuovi(i+1);  // 0 doppie

        else if (c == 'p') c = 'b'; // 5 p-b
        else if (c == 'b') c = 'p';
      } 
      float metaCaso6 = QD
        + map(FS, 8, 32, 0.0, 0.20)
        + map(IL, 8, 32, 0.0, 0.10) // font size 8-32
        + map(SL, 8, 32, 0.0, 0.10)  // spaziatura lettere ?
      /*+ map(SP, 8, 32, 0.0, 0.25)  // spaziatura parole
       // interlinea*/
        ;
      println(metaCaso6);
      //

      if (random(1) >= metaCaso6) { // < qui varia la % totale di incontrare errori... 
        // .1 = molto probabile, .9 = molto rara

        if (c == c1 /*&& random(1) < casoDoppie*/) rimuovi(i+1);  // 0 doppie

        else if (c == 'd') c = 'q'; // 6 d-q
        else if (c == 'q') c = 'd';
      }
      
      float metaCaso7 = CE
        + map(FS, 8, 32, 0.0, 0.20)
        + map(IL, 8, 32, 0.0, 0.10) // font size 8-32
        + map(SL, 8, 32, 0.0, 0.25)  // spaziatura lettere ?
      /*+ map(SP, 8, 32, 0.0, 0.25)  // spaziatura parole
       // interlinea*/
        ;
      println(metaCaso7);
      //

      if (random(1) >= metaCaso7) { // < qui varia la % totale di incontrare errori... 
        // .1 = molto probabile, .9 = molto rara

        if (c == c1 /*&& random(1) < casoDoppie*/) rimuovi(i+1);  // 0 doppie

        else if (c == 'c') c = 'e'; // 7 e-c
        else if (c == 'e') c = 'c';
      }
      
      float metaCaso8 = BP
        + map(FS, 8, 32, 0.0, 0.20)
        + map(IL, 8, 32, 0.0, 0.10) // font size 8-32
        + map(SL, 8, 32, 0.0, 0.20)  // spaziatura lettere ?
      /*+ map(SP, 8, 32, 0.0, 0.25)  // spaziatura parole
       // interlinea*/
        ;
      println(metaCaso8);
      //

      if (random(1) >= metaCaso8) { // < qui varia la % totale di incontrare errori... 
        // .1 = molto probabile, .9 = molto rara

        if (c == c1 /*&& random(1) < casoDoppie*/) rimuovi(i+1);  // 0 doppie

        else if (c == 'f') c = 't'; // 8 f-t
        else if (c == 't') c = 'f';
      } 

      lettere[i] = c;
    }
    txtDys = new String(lettere);
  }


  void rimuovi(int i) {
    char[] letterePrima = subset(lettere, 0, i);
    char[] lettereDopo = subset(lettere, i+1);
    lettere = concat(letterePrima, lettereDopo);
  }


  String blinkChar() {
    return isFocused && (frameCount>>2 & 1) == 0 ? "_" : "";
  }


  boolean checkFocus() {
    return isFocused = mouseX > x & mouseX < xw & mouseY > y & mouseY < yh;
  }
}