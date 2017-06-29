RadioButton mode;

void gui() {
  // hint(DISABLE_DEPTH_TEST);
  cam.beginHUD();
  cp5.draw();
  cam.endHUD();
  // hint(ENABLE_DEPTH_TEST);

  // cp5.getController("colori").setValue(colore);
}

void setupOPTIONS() {

  color activeColor = color(255, 0, 0);                                 // STYLE GENERAL

  cp5.setColorActive(activeColor);
  cp5.setColorBackground(color(50));
  cp5.setColorForeground(color(170));

  Group g1 = cp5.addGroup("OPTIONS")
    .setPosition(0, 10)
    .setWidth(200)
    .setBackgroundColor(color(20, 240))                         // color barra options
    .setBackgroundHeight(height)
    ;

  g1.activateEvent(true);
  g1.setColorLabel(color(255));
  //g1.close();

  cp5.addFrameRate().setGroup("OPTIONS").linebreak();

  cp5.addSlider("scala")
    .setLabel("scale/magnitude")
    .setNumberOfTickMarks(10)
    .setPosition(10, 50)
    .setSize(100, 10)
    .setRange(1, 10)
    .setValue(5)
    .setDecimalPrecision(0)
    .setGroup("OPTIONS")
    .setSliderMode(Slider.FLEXIBLE); 

  cp5.addSlider("colore")
    .setLabel("color/intensity")
    .setNumberOfTickMarks(12)
    .setPosition(10, 90)
    .setSize(100, 10)
    .setRange(0, 11)
    .setGroup("OPTIONS")
    .setSliderMode(Slider.FLEXIBLE);

  mode = cp5.addRadioButton("meshMode")
    .setGroup("OPTIONS")
    .setPosition(10, 160)
    .setSize(130, 20)
    .setItemsPerRow(1)
    .setSpacingRow(10)
    .addItem("wireframe", 1)
    .addItem("solid", 2)
    .addItem("texture", 3);

  cp5.addBang("ExportOBJ").setGroup("OPTIONS").setSize(85, 50).setPosition(10, 800);
  cp5.addBang("ExportPDF").setGroup("OPTIONS").setSize(85, 50).setPosition(105, 800);
}

void ExportOBJ() {
  record = true;
}

void ExportPDF() {
  recordPDF = true;
}

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isFrom(mode)) {
    if (theEvent.getGroup().getValue() == 1.0) { 
      wireframe = true;
    } else { 
      wireframe = false;
    }
    if (theEvent.getGroup().getValue() == 2.0) { 
      solido = true;
    } else { 
      solido = false;
    }
    if (theEvent.getGroup().getValue() == 3.0) { 
      texture = true;
    } else { 
      texture = false;
    }
  }
}
