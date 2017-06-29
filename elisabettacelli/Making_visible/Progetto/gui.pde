void setupGUI() {

  color activeColor = color(129, 215, 209);                                 // STYLE GENERAL

  cp5.setColorActive(activeColor);
  cp5.setColorBackground(color(50));
  cp5.setColorForeground(color(170));

  Group g1 = cp5.addGroup("gui")
    .setPosition(0, 10)
    .setWidth(170)
    .setBackgroundColor(color(20, 240))
    .setBackgroundHeight(height)
    ;

  g1.activateEvent(true);
  g1.setColorLabel(color(255));
  //g1.close();

  cp5.addFrameRate().setGroup("gui").linebreak();

  // attiva/disattiva CAMERA e DISEGNO
  cp5.addToggle("cam").setGroup("gui");
  cp5.addToggle("drawing").setGroup("gui");
  // attiva/disattiva visualizzazione DISEGNO BAMBINO passato da CANNY anche lui
  cp5.addToggle("child").setGroup("gui").linebreak();

  // scegli SPESSORE TRACCIA del DISEGNO
  cp5.addSlider("traccia", 1, 20).setNumberOfTickMarks(10).setGroup("gui").linebreak();
  // attiva/disattiva BLUR, utile se disattivi il CANCELLA sotto
  cp5.addToggle("blur").setGroup("gui").linebreak();

  // attiva/disattiva e setta il livello di BLUR su OPENCV prima di far partire l'algoritmo CANNY
  cp5.addToggle("blurre").setGroup("gui").linebreak();
  cp5.addSlider("blurreLevel", 1, 10).setNumberOfTickMarks(10).setGroup("gui").linebreak();
  // attiva/disattiva DILATE e ERODE su OPENCV prima di far partire l'algoritmo CANNY
  cp5.addToggle("dilate").setGroup("gui");
  cp5.addToggle("erode").setGroup("gui").linebreak();

  // scegli tra fondo BIANCO/NERO e se usare modalità COLORE VERO per il DISEGNO
  cp5.addToggle("BGBianco").setGroup("gui");
  cp5.addToggle("coloreVero").setGroup("gui").linebreak();

 

  cp5.addSlider("lineaMinima", 0, 100).setNumberOfTickMarks(30).setGroup("gui").linebreak(); 

  // modalità alternative COLORE PSICHEDELICO o BN per il DISEGNO
  cp5.addToggle("psichedelia").setGroup("gui");
  cp5.addToggle("bn").setGroup("gui");
  // attiva/disattiva cancella schermo, refresh frame...
  cp5.addToggle("cancella").setGroup("gui").linebreak();

  // per la CAM dimensione cella
  cp5.addSlider("cella", 5, 100).setNumberOfTickMarks(30).setGroup("gui").linebreak(); 

  // CAMBIARE IL DISEGNO
  cp5.addBang("cambiaDisegno").setGroup("gui").setSize(100, 25).setPosition(10, 350);


  // salva vari
  cp5.addBang("esportaPDF").setGroup("gui").setSize(100, 25).setPosition(10, 470);
  cp5.addBang("esportaIMG").setGroup("gui").setSize(100, 25).setPosition(10, 520);
}

void cella (int dim) {
  cellSize_updating = true;
  aggiornaCellSize(dim);
}

void aggiornaCellSize(int dim) {
  cols = width / dim; 
  rows = height / dim;
  cellSize = dim;
  cellSize_updating = false;
}

void esportaPDF() {
  recordPDF = true;
}

void esportaIMG() {
  recordIMG = true;
}

void controlEvent(ControlEvent theControlEvent) {
  if (theControlEvent.isFrom("cannyTs")) {
    // min and max values are stored in an array.
    // access this array with controller().arrayValue().
    // min is at index 0, max is at index 1.
    lT = int(theControlEvent.getController().getArrayValue(0));
    hT = int(theControlEvent.getController().getArrayValue(1));
    println("range update, done.");
  }
}

void cambiaDisegno() {
  
  if (caso == 0) {
    caso = int(random(0,9));
  } else{
    caso = int(random(0,9));
  }
  
  
}

void keyPressed() {
  if (key == ' ') {
    cancella=!cancella;
  } else if (key == 'P' || key == 'p') {
    recordPDF = true;
  } else if (key == 'I' || key == 'i') {
    recordIMG = true;
  }
}
