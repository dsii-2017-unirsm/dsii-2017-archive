RadioButton r1;

void setupGUI() {

  color active_color = color(225);
  color background_color = color(0);
  color off_color = color(75);
  color on_color = color(150);
  int group_width_1 = 150;
  int group_width_2 = 180;

  cp5.setColorActive(active_color);
  cp5.setColorBackground(off_color);
  cp5.setColorForeground(on_color);


  // SETTINGS

  Group g1 = cp5.addGroup("settings")
    .setPosition(0, 10)
    .setWidth(group_width_1)
    .setBackgroundColor(background_color)
    .setBackgroundHeight(height)
    ;

  cp5.addToggle("show_earth").setLabel("earth").setGroup("settings").setSize(60, 20).setPosition(10, 20);
  cp5.addToggle("show_coordinates").setLabel("coordinates").setGroup("settings").setSize(60, 20).setPosition(80, 20);
  cp5.addToggle("stop_time").setLabel("time").setGroup("settings").setSize(60, 20).setPosition(10, 60);
  cp5.addToggle("movement").setLabel("pulsation").setGroup("settings").setSize(60, 20).setPosition(80, 60);

  cp5.addSlider("ellipse_width")
    .setGroup("settings")
    .setLabel("circles size")
    .setPosition(10, 120)
    .setWidth(60)
    .setRange(3, 19)
    .setValue(11)
    .setNumberOfTickMarks(5)
    ;
  cp5.getController("ellipse_width").getValueLabel().hide();

  cp5.addSlider("slider")
    .setGroup("settings")
    .setLabel("year")
    .setPosition(10, 180)
    .setSize(10, 465)
    .setRange(1981, 2011)
    //.setNumberOfTickMarks(31)
    .setSliderMode(Slider.FLEXIBLE)
    ;

  cp5.addBang("recordPDF").setLabel("record pdf").setGroup("settings").setSize(130, 40).setPosition(10, height-70);


  // LEGEND

  Group g2 = cp5.addGroup("legend")
    .setPosition(width-group_width_2, 10)
    .setWidth(group_width_2)
    .setBackgroundColor(background_color)
    .setBackgroundHeight(130)
    ;

  cp5.addButton("2").setLabel("no rights violations").setGroup("legend").setSize(20, 20).setPosition(10, 20);
  cp5.addButton("1").setLabel("seldom rights violations").setGroup("legend").setSize(20, 20).setPosition(10, 50);
  cp5.addButton("0").setLabel("frequent rights violations").setGroup("legend").setSize(20, 20).setPosition(10, 80);

  cp5.getController("2").getCaptionLabel().align(ControlP5.LEFT, ControlP5.CENTER).setPaddingX(25);
  cp5.getController("1").getCaptionLabel().align(ControlP5.LEFT, ControlP5.CENTER).setPaddingX(25);
  cp5.getController("0").getCaptionLabel().align(ControlP5.LEFT, ControlP5.CENTER).setPaddingX(25);

  setLock(cp5.getController("2"), true, c_2);
  setLock(cp5.getController("1"), true, c_1);
  setLock(cp5.getController("0"), true, c_0);


  // LOCATION

  Group g4 = cp5.addGroup("location")
    .setPosition(width-group_width_2, 150)
    .setWidth(group_width_2)
    .setBackgroundColor(background_color)
    .setBackgroundHeight(height/2-160)
    ;  

  cp5.addTextfield("input_latitude")
    .setGroup("location")
    .setLabel("latitude")
    .setPosition(10, 20)
    .setSize(group_width_2-20, 20)
    .setFocus(true)
    ;

  cp5.addTextfield("input_longitude")
    .setGroup("location")
    .setLabel("longitude")
    .setPosition(10, 70)
    .setSize(group_width_2-20, 20)
    .setFocus(false)
    ;


  // FILTERS

  Group g3 = cp5.addGroup("filters")
    .setPosition(width-group_width_2, height/2)
    .setWidth(group_width_2)
    .setBackgroundColor(background_color)
    .setBackgroundHeight(height/2)
    ;

  cp5.addToggle("insights").setLabel("insights").setGroup("filters").setSize(60, 20).setPosition(10, 20);

  r1 = cp5.addRadioButton("radioButton")
    .setGroup("filters")
    .setPosition(10, 80)
    .setSize(20, 20)
    .setItemsPerRow(1)
    .setSpacingRow(10)
    .addItem("Extrajudicial Killing", 1)
    .addItem("Political Imprisonment", 2)
    .addItem("Torture", 3)
    .addItem("Assembly and Association", 4)
    .addItem("Foreign Movement", 5)
    .addItem("Domestic Movement", 6)
    .addItem("Speech", 7)
    .addItem("Electoral Self-Determination", 8)
    .addItem("Religion", 9)
    .addItem("Worker's Rights", 10)
    ;
}

void gui() {
  cam.beginHUD();
  cp5.draw();
  cam.endHUD();

  cp5.getController("slider").setValue(slider);
}


void setLock(Controller theController, boolean theValue, color bg_color) {
  theController.setLock(theValue);
  if (theValue) {
    theController.setColorBackground(bg_color);
  }
}