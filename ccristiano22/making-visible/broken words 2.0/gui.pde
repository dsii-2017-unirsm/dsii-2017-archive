void setupGUI() {
  cp5 = new ControlP5(this);
  // cp5

  color activeColor = color(255, 0, 0);                                 // STYLE GENERAL
  cp5.setColorActive(activeColor);
  cp5.setColorBackground(color(50));


Group g1 = cp5.addGroup("g1")
    .setLabel("GUI")
    .setPosition(0, 10)
    .setBackgroundColor(color(170))
    .setWidth(150)
    .setBackgroundHeight(height)
    ;
    
cp5.addTextlabel("label")
    .setPosition(10, 5)
    .setGroup(g1)
    .setText("Paramentri DSA")
    ;
  cp5.addSlider("BD")
    .setPosition(15, 20)
    .setSize(100, 9)
    .setGroup(g1)
    .setNumberOfTickMarks(20)
    .setRange(0.5, 1)
    .setLabel("B-D")
    ;
  cp5.addSlider("EA")
    .setPosition(15, 45)
    .setSize(100, 9)
    .setGroup(g1)
    .setNumberOfTickMarks(20)
    .setRange(0.5, 1)
    .setLabel("A-E")
    ;
  cp5.addSlider("NU")
    .setPosition(15, 70)
    .setSize(100, 9)
    .setGroup(g1)
    .setNumberOfTickMarks(20)
    .setRange(0.5, 1)
    .setLabel("N-U")
    ;
  cp5.addSlider("MN")
    .setPosition(15, 95)
    .setSize(100, 9)
    .setGroup(g1)
    .setNumberOfTickMarks(20)
    .setRange(0.5, 1)
    .setLabel("M-N")
    ;
  cp5.addSlider("BP")
    .setPosition(15, 120)
    .setSize(100, 9)
    .setGroup(g1)
    .setNumberOfTickMarks(20)
    .setRange(0.5, 1)
    .setLabel("B-P")
    ;
  cp5.addSlider("QD")
    .setPosition(15, 145)
    .setSize(100, 9)
    .setGroup(g1)
    .setNumberOfTickMarks(20)
    .setRange(0.5, 1)
    .setLabel("D-Q")
    ;
  cp5.addSlider("CE")
    .setPosition(15, 170)
    .setSize(100, 9)
    .setGroup(g1)
    .setNumberOfTickMarks(20)
    .setRange(0.5, 1)
    .setLabel("C-E")
    ;
  cp5.addSlider("FT")
    .setPosition(15, 195)
    .setSize(100, 9)
    .setGroup(g1)
    .setNumberOfTickMarks(20)
    .setRange(0.5, 1)
    .setLabel("F-T")
    ;
  cp5.addSlider("Doppie")
    .setPosition(15, 220)
    .setSize(100, 9)
    .setGroup(g1)
    .setNumberOfTickMarks(20)
    .setRange(0, 1)
    .setLabel("Doppie")
    ;
cp5.addTextlabel("label1")
    .setPosition(10, 255)
    .setGroup(g1)
    .setText("Layout")
    ;
  cp5.addSlider("FS")
    .setPosition(15, 270)
    .setSize(100, 9)
    .setGroup(g1)
    .setNumberOfTickMarks(20)
    .setRange(0, 32)
    .setLabel("FS")
    ;
  cp5.addSlider("IL")
    .setPosition(14, 295)
    .setSize(100, 9)
    .setGroup(g1)
    .setNumberOfTickMarks(3)
    .setRange(1, 3)
    .setLabel("IL")
    ;

  cp5.addButton("bang")
    .setPosition(14, 320)
    .setSize(100, 40)
    .setGroup(g1)
    .setLabel("STAMPA");
  ;
}
