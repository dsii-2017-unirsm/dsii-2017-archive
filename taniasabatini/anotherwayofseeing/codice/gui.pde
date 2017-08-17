RadioButton radiobutton;

void setupGUI() {

  color activeColor = color(232, 12, 122);                                 // STYLE GENERAL

  cp5.setColorActive(activeColor);
  cp5.setColorBackground(color(50));
  cp5.setColorForeground(color(200));

  Group g1 = cp5.addGroup("gui")
    .setPosition(0, 10)
    .setWidth(185)
    .setBackgroundColor(color(20, 240))
    .setBackgroundHeight(height)
    ;

  g1.activateEvent(true);
  g1.setColorLabel(color(255));
  //g1.close();

  cp5.addFrameRate().setGroup("gui").linebreak();
  cp5.addSlider("spessore", 0.0, 4.0).setLabel("thickness").setGroup("gui").setPosition(10, 50).linebreak();
  cp5.addSlider("risolSlider", 2, 20).setLabel("resolution").setNumberOfTickMarks(20).setGroup("gui").setPosition(10, 90).linebreak(); // < per ora premere 1 o 2 per resettare...
  cp5.addSlider("meshSize", 0.6, 4).setLabel("scale").setNumberOfTickMarks(10).setGroup("gui").setPosition(10, 130).linebreak();
  cp5.addSlider("apertura", 0, 400).setLabel("distance").setGroup("gui").setPosition(10, 170).linebreak();
  cp5.addToggle("showPunti").setLabel("SHOW POINT CLOUD").setGroup("gui").setPosition(10, 250);
  cp5.addToggle("showPmeshWire").setLabel("SHOW WIREFRAME MESH").setGroup("gui").setPosition(10, 295);
  cp5.addToggle("showPmeshFill").setLabel("SHOW MESH").setGroup("gui").setPosition(10, 340);

  radiobutton = cp5.addRadioButton("mode")
    .setPosition(10, 450).setSize(40,40)
    .addItem("brightness", 1)
    .addItem("saturation", 2);
    
    

  cp5.addBang("esportaOBJ").setLabel("export OBJ").setGroup("gui").setSize(40, 40).setPosition(10, 600);
  cp5.addBang("recordPDF").setLabel("export PDF").setGroup("gui").setSize(40, 40).setPosition(10, 665);
  cp5.addBang("recordFrame").setLabel("save FRAME").setGroup("gui").setSize(40, 40).setPosition(10, 730);
}

void gui() {
  cp5.draw();

}

void risolSlider(int ris) {
  risoluzione = ris;
  carica(fileName1);
  carica(fileName2);
  carica(fileName3);
  carica(fileName4);
}

void esportaOBJ() {
  record = true;
}

void esportaPDF() {
  recordPDF = true;
}