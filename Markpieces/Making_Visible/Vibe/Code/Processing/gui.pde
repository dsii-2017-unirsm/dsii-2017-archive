

void setupGUI() {

  color activeColor = color(255);                                 // STYLE GENERAL

  cp5.setColorActive(activeColor);
  cp5.setColorBackground(color(50));
  cp5.setColorForeground(color(170));


  
  
  cp5 = new ControlP5(this);
  r1 = cp5.addRadioButton("radioButton")
         .setPosition(30,40)
         .setSize(40,20)
         .setColorForeground(color(200))
         .setColorActive(color(255))
         .setColorLabel(color(255))
         .setItemsPerRow(4)
         .setSpacingColumn(50)
         
         .addItem("Bass",1)
         .addItem("Guitar",2)
         .addItem("Kick",3)
         .addItem("Pan",4)
         
         ;
         
         // create a toggle
         cp5.addToggle("muto")
         
         .setPosition(30,80)
         .setSize(40,20)
         
         ;
         
     
     for(Toggle t:r1.getItems()) {
       t.getCaptionLabel().setColorBackground(color(0));
       t.getCaptionLabel().getStyle().moveMargin(-7,0,0,-3);
       t.getCaptionLabel().getStyle().movePadding(7,0,0,3);
       t.getCaptionLabel().getStyle().backgroundWidth = 45;
       t.getCaptionLabel().getStyle().backgroundHeight = 13;
     }
   
  
  
  
  
  
  
  
  
  //Group g1 = cp5.addGroup("gui")
  //  .setPosition(0, 10)
  //  .setWidth(width)
  //  .setBackgroundColor(color(20, 240))
  //  .setBackgroundHeight(130)
  //  ;

  //g1.activateEvent(true);
  //g1.setColorLabel(color(255));
  ////g1.close();
  
  //cp5.addToggle("mute").setGroup("gui").setPosition(0,10);
  //cp5.addRadioButton("basso").setGroup("gui").setPosition(50,10);
  //cp5.addToggle("chitarra").setGroup("gui").setPosition(100,10);
  //cp5.addToggle("cassa").setGroup("gui").setPosition(150,10);
  //cp5.addToggle("rullante").setGroup("gui").setPosition(200,10);
  
  
  
  
  
  
  
  //cp5.addFrameRate().setGroup("gui").linebreak();
  //cp5.addSlider("spessore", 0.0, 4.0).setGroup("gui").setPosition(10, 50).linebreak();
  //cp5.addSlider("risolSlider", 2, 20).setLabel("risoluzione").setNumberOfTickMarks(20).setGroup("gui").setPosition(10, 90).linebreak(); // < per ora premere 1 o 2 per resettare...
  //cp5.addSlider("meshSize", 1, 4).setLabel("ingrandimento").setNumberOfTickMarks(4).setGroup("gui").setPosition(10, 130).linebreak();
  //cp5.addSlider("apertura", 0, 400).setGroup("gui").setPosition(10, 170).linebreak();
  //cp5.addToggle("showPunti").setLabel("MOTRA NUVOLA PUNTI").setGroup("gui").setPosition(10, 250);//.setColorValue(color(232, 12, 122));
  //cp5.addToggle("showPmeshWire").setLabel("MOSTRA WIREFRAME MESH").setGroup("gui").setPosition(10, 295);
  //cp5.addToggle("showPmeshFill").setLabel("MOSTRA MESH").setGroup("gui").setPosition(10, 340);
}

void gui() {
  cp5.draw();
}