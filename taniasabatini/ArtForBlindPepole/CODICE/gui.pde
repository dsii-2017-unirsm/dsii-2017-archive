void setupGUI() {

  color activeColor = color(255, 0, 0);                                 // STYLE GENERAL

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
  cp5.addSlider("spessore", 0.0, 4.0).setGroup("gui").linebreak();
  cp5.addSlider("risolSlider", 2, 20).setLabel("risoluzione").setNumberOfTickMarks(20).setGroup("gui").linebreak(); // < per ora premere 1 o 2 per resettare...
  cp5.addSlider("meshSize", 1, 4).setLabel("ingrandimento").setNumberOfTickMarks(4).setGroup("gui").linebreak();
  cp5.addSlider("apertura", 0, 400).setGroup("gui").linebreak();
  cp5.addToggle("showPunti").setLabel("MOTRA NUVOLA PUNTI").setGroup("gui").setPosition(10, 200);
  cp5.addToggle("showPmeshWire").setLabel("MOSTRA WIREFRAME MESH").setGroup("gui").setPosition(10, 240);
  cp5.addToggle("showPmeshFill").setLabel("MOSTRA MESH").setGroup("gui").setPosition(10, 280);
  cp5.addBang("esportaOBJ").setGroup("gui").setSize(100, 40).setPosition(10, 380);
  cp5.addBang("esportaPDF").setGroup("gui").setSize(100, 40).setPosition(10, 450);
}

void risolSlider(int ris) {
  risoluzione = ris;
  carica(fileName1);
}

void esportaOBJ() {
  record = true;
}

void esportaPDF() {
  recordPDF = true;
}
