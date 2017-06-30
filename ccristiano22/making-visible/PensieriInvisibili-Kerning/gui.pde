void setupGUI() {
  cp5 = new ControlP5(this);
  // cp5

  color activeColor = color(255, 0, 0); // STYLE GENERAL
  cp5.setColorActive(activeColor);
  cp5.setColorBackground(color(50));
  //cp5.setFont(createFont("Raleway",4));

  Group g1 = cp5.addGroup("g1")
    .setLabel("GUI")
    .setPosition(0, 10)
    .setBackgroundColor(color(170))
    .setWidth(160)
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
    .setRange(1, 100)
    .setLabel("B-D")
    ;
  cp5.addSlider("EA")
    .setPosition(15, 45)
    .setSize(100, 9)
    .setGroup(g1)
    .setNumberOfTickMarks(20)
    .setRange(1, 100)
    .setLabel("A-E")
    ;
  cp5.addSlider("NU")
    .setPosition(15, 70)
    .setSize(100, 9)
    .setGroup(g1)
    .setNumberOfTickMarks(20)
    .setRange(1, 100)
    .setLabel("N-U")
    ;
  cp5.addSlider("MN")
    .setPosition(15, 95)
    .setSize(100, 9)
    .setGroup(g1)
    .setNumberOfTickMarks(20)
    .setRange(1, 100)
    .setLabel("M-N")
    ;
  cp5.addSlider("BP")
    .setPosition(15, 120)
    .setSize(100, 9)
    .setGroup(g1)
    .setNumberOfTickMarks(20)
    .setRange(1, 100)
    .setLabel("B-P")
    ;
  cp5.addSlider("QD")
    .setPosition(15, 145)
    .setSize(100, 9)
    .setGroup(g1)
    .setNumberOfTickMarks(20)
    .setRange(1, 100)
    .setLabel("D-Q")
    ;
  cp5.addSlider("CE")
    .setPosition(15, 170)
    .setSize(100, 9)
    .setGroup(g1)
    .setNumberOfTickMarks(20)
    .setRange(1, 100)
    .setLabel("C-E")
    ;
  cp5.addSlider("FT")
    .setPosition(15, 195)
    .setSize(100, 9)
    .setGroup(g1)
    .setNumberOfTickMarks(20)
    .setRange(1, 100)
    .setLabel("F-T")
    ;
  cp5.addSlider("Doppie")
    .setPosition(15, 220)
    .setSize(100, 9)
    .setGroup(g1)
    .setNumberOfTickMarks(20)
    .setRange(1, 100)
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
    .setRange(8, 32)
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
  cp5.addSlider("SL")
    .setPosition(15, 320)
    .setSize(100, 9)
    .setGroup(g1)
    .setNumberOfTickMarks(3)
    .setRange(1, 3)
    .setLabel("SL")
    ;
  cp5.addSlider("SP")
    .setPosition(15, 345)
    .setSize(100, 9)
    .setGroup(g1)
    .setNumberOfTickMarks(3)
    .setRange(1, 3)
    .setLabel("SP")
    ;
   

 cp5.addTextlabel("label3")
    .setPosition(10, 380)
    .setGroup(g1)
    .setText("Caratteri")
    ;
 
     cp5.addToggle("fInconsolata")
    .setPosition(15, 400)
    .setSize(100, 20)
    .setGroup(g1)
    .setValue(false)
    .setLabel("Inconsolata");
  ;
  
  cp5.addToggle("fGeorgia")
    .setPosition(15, 440)
    .setSize(100, 20)
    .setGroup(g1)
    .setValue(false)
    .setLabel("Georgia");
  ;
  cp5.addToggle("fHelvetica")
    .setPosition(15, 480)
    .setSize(100, 20)
    .setGroup(g1)
    .setValue(false)
    .setLabel("helvetica");
  ;
  
  cp5.addToggle("fCourier")
    .setPosition(15, 525)
    .setSize(100, 20)
    .setGroup(g1)
    .setValue(false)
    .setLabel("Courier");
  ;
  
    cp5.addTextlabel("label2")
    .setPosition(10, 580)
    .setGroup(g1)
    .setText("Carica file")
    ;
    
     cp5.addButton("loadString1")
    .setPosition(15, 600)
    .setSize(100, 20)
    .setGroup(g1)
    .setLabel("LOAD1");
  ;
   cp5.addButton("loadString2")
    .setPosition(15, 630)
    .setSize(100, 20)
    .setGroup(g1)
    .setLabel("LOAD2");
  ;
  cp5.addButton("loadString3")
    .setPosition(15, 660)
    .setSize(100, 20)
    .setGroup(g1)
    .setLabel("LOAD3");
  ;
  
    cp5.addButton("resetString")
    .setPosition(15, 780)
    .setSize(100, 40)
    .setGroup(g1)
    .setLabel("RESET");
  ;
  
  
   cp5.addButton("bang")
    .setPosition(15, 840)
    .setSize(100, 40)
    .setGroup(g1)
    .setLabel("STAMPA");
  ;
  
   
}