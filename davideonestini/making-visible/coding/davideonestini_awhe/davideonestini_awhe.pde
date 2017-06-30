// Are we human enough?
// Demo by @davideonestini and @Fupete
// original concept by Davide Onestini

// 2017 © @davideonestini @Fupete and the course DSII2017 @UniRSM  
// github.com/davideonestini — github.com/dsii-2017-unirsm
// Educational purposes, MIT License, 2017, San Marino

// Controls:
// [e/E] = EARTH
// [c/C] = COORDINATES
// [t/T] = TIME
// [p/P] = PULSATION
// [i/I] = INSIGHTS
// [r/R] = RECORD PDF
 
// Filters:
// [1] = Extrajudicial Killing
// [2] = Political Imprisonment
// [3] = Torture
// [4] = Freedom of Assembly and Association
// [5] = Freedom of Foreign Movement
// [6] = Freedom of Domestic Movement 
// [7] = Freedom of Speech
// [8] = Electoral Self-Determination
// [9] = Freedom of Religion
// [0] = Worker's Rights
// [x/X] = No filters


import peasy.*;
import toxi.geom.Vec3D;
import controlP5.*;
import processing.pdf.*;

PeasyCam cam;
Vec3D[][] globe;
ControlP5 cp5;

int total = 100;

Table table;
Table table2;
Table table3;

color c_0 = #DD378B; // 0 #E84A5F #C70039 #982D43 #A5678E #CE516B
color c_1 = #A645CE; // 1 #FECEA8 #FF5733 #ECAEAA #C0B8DA #594E86
color c_2 = #024FA5; // 2 #99B898 #FFC305 #AEA38D #7FABD7 #024FA5
color c_un = #ffffff;
color c_bg = #151515;
color c_c = #404040;
color c_e = #505050;
color c_ee = #ffffff;

float ellipse_width = 11;

float arc = TWO_PI/12.5;
float arc_gap = TWO_PI/50;
float arc_stroke = 3;
float arc_f_stroke = 1.5;
float arc_width;
float arc_f_width;

float r = 360;
float e_r = 350;
float lt1, ln1, e_lt1, e_ln1, ee_ln1, ee_lt1;
float l_latitude, l_longitude;
int year, KILL, POLPRIS, TORT, ASSN, FORMOV, DOMMOV, SPEECH, ELECSD, RELFRE, WORKER, TOTAL;
boolean kill, polpris, tort, assn, formov, dommov, speech, elecsd, relfre, worker;

boolean insights = false;
boolean movement = true;
boolean stop_time = true;
boolean show_earth = true;
boolean show_coordinates = true;
boolean recordPDF;

int slider = 1981;
int timer;

void setup() {
  fullScreen(P3D);
  colorMode(RGB, 255, 255, 255, 100);

  cp5 = new ControlP5(this);
  setupGUI();
  cp5.setAutoDraw(false);

  cam = new PeasyCam(this, 900);
  cam.setMinimumDistance(500);
  cam.setMaximumDistance(1400);

  // globe = new Vec3D[total+1][total+1];
  table = loadTable("ciri-data.csv", "header");
  table2 = loadTable("earth.csv", "header");
  table3 = loadTable("earth-dots.csv", "header");
}

void draw() {
  if (recordPDF) {
    String nomeFile = "pdf/davideonestini_awhe_model_"+year()+month()+day()+"_"+hour()+minute()+second()+millis()+".pdf";
    beginRaw(PDF, nomeFile);
    // background(c_bg, 100);
  }

  String latitude = cp5.get(Textfield.class, "input_latitude").getText();
  l_latitude = float(latitude);

  String longitude = cp5.get(Textfield.class, "input_longitude").getText();
  l_longitude = float(longitude);

  background(c_bg, 100);
  lights();

  rotateY(PI/2);

  if (show_earth) { 
    earth_dots();
  }

  if (show_coordinates) {
    coordinates();
  }
  
  earth_input();

  if (stop_time) {
    if (millis() - timer >= 500) {
      if (slider < 2011) {
        slider ++;
      } else if (slider >= 2011) {
        slider = 1981;
      }
      timer = millis();
    }
  }


  for (TableRow row : table.findRows(str(slider), "year")) {
    lt1 = row.getFloat("latitude");
    ln1 = row.getFloat("longitude");
    year = row.getInt("year");

    KILL = row.getInt("KILL");
    POLPRIS = row.getInt("POLPRIS");
    TORT = row.getInt("TORT");
    ASSN = row.getInt("ASSN");
    FORMOV = row.getInt("FORMOV");
    DOMMOV = row.getInt("DOMMOV");
    SPEECH = row.getInt("SPEECH");
    ELECSD = row.getInt("ELECSD");
    RELFRE = row.getInt("RELFRE");
    WORKER = row.getInt("WORKER");

    if ((KILL >= 0) && (POLPRIS >= 0) && (TORT >= 0) && (ASSN >= 0) && (FORMOV >= 0) && 
      (DOMMOV >= 0) && (SPEECH >= 0) && (ELECSD >= 0) && (RELFRE >= 0) && (WORKER >= 0)) {
      TOTAL = KILL + POLPRIS + TORT + ASSN + FORMOV + DOMMOV + SPEECH + ELECSD + RELFRE + WORKER;
      // println(TOTAL);
    }

    arc_width = ellipse_width + 3;
    arc_f_width = ellipse_width + 1;

    float vibration_value = map(TOTAL, 0, 20, 40, 0);
    float vibrating_r = r + random(0, vibration_value);

    float theta = radians(lt1) + PI/2;
    float phi = radians(-ln1) + PI;

    if (movement == false) {
      vibrating_r = r;
    }

    float x1 = vibrating_r * sin(theta) * cos(phi);
    float z1 = vibrating_r * sin(theta) * sin(phi);
    float y1 = vibrating_r * cos(theta);

    Vec3D pos = new Vec3D (x1, y1, z1);
    Vec3D alto = new Vec3D(0, 1, 0);
    Vec3D tar = pos.getNormalized();
    Vec3D assi = alto.cross( tar );
    assi.normalize();

    float angolo = acos(alto.dot(tar));

    pushMatrix();
    translate(pos.x, pos.y, pos.z); // spostati al punto in questione
    rotate(angolo, assi.x, assi.y, assi.z); // ruota in modo da essere parallelo al raggio del punto in questione
    rotate(HALF_PI, 1, 0, 0); // ruota di 90 gradi in modo da essere tangente e disegna il cerchio

    noStroke();
    fill(255, 255, 255, 100);
    ellipse(0, 0, ellipse_width, ellipse_width);

    ellipse_coloring(KILL);
    ellipse(0, 0, ellipse_width, ellipse_width);
    ellipse_coloring(POLPRIS);
    ellipse(0, 0, ellipse_width, ellipse_width);
    ellipse_coloring(TORT);
    ellipse(0, 0, ellipse_width, ellipse_width);
    ellipse_coloring(ASSN);
    ellipse(0, 0, ellipse_width, ellipse_width);
    ellipse_coloring(FORMOV);
    ellipse(0, 0, ellipse_width, ellipse_width);
    ellipse_coloring(DOMMOV);
    ellipse(0, 0, ellipse_width, ellipse_width);
    ellipse_coloring(SPEECH);
    ellipse(0, 0, ellipse_width, ellipse_width);
    ellipse_coloring(ELECSD);
    ellipse(0, 0, ellipse_width, ellipse_width);
    ellipse_coloring(RELFRE);
    ellipse(0, 0, ellipse_width, ellipse_width);
    ellipse_coloring(WORKER);
    ellipse(0, 0, ellipse_width, ellipse_width);

    if (insights) {
      arc_coloring(KILL);
      arc(0, 0, arc_width, arc_width, arc_gap, arc_gap+arc);
      arc_coloring(POLPRIS); 
      arc(0, 0, arc_width, arc_width, arc_gap*2+arc, arc_gap*2+arc*2);
      arc_coloring(TORT);
      arc(0, 0, arc_width, arc_width, arc_gap*3+arc*2, arc_gap*3+arc*3);
      arc_coloring(ASSN);
      arc(0, 0, arc_width, arc_width, arc_gap*4+arc*3, arc_gap*4+arc*4);
      arc_coloring(FORMOV);
      arc(0, 0, arc_width, arc_width, arc_gap*5+arc*4, arc_gap*5+arc*5);
      arc_coloring(DOMMOV);
      arc(0, 0, arc_width, arc_width, arc_gap*6+arc*5, arc_gap*6+arc*6);
      arc_coloring(SPEECH);
      arc(0, 0, arc_width, arc_width, arc_gap*7+arc*6, arc_gap*7+arc*7);
      arc_coloring(ELECSD);
      arc(0, 0, arc_width, arc_width, arc_gap*8+arc*7, arc_gap*8+arc*8);
      arc_coloring(RELFRE);
      arc(0, 0, arc_width, arc_width, arc_gap*9+arc*8, arc_gap*9+arc*9);
      arc_coloring(WORKER);
      arc(0, 0, arc_width, arc_width, arc_gap*10+arc*9, arc_gap*10+arc*10);
      
      noFill();
      stroke(c_ee);
      strokeWeight(arc_f_stroke);
      if (kill == true) { arc(0, 0, arc_f_width, arc_f_width, arc_gap, arc_gap+arc); }
      if (polpris == true) { arc(0, 0, arc_f_width, arc_f_width, arc_gap*2+arc, arc_gap*2+arc*2); }
      if (tort == true) { arc(0, 0, arc_f_width, arc_f_width, arc_gap*3+arc*2, arc_gap*3+arc*3); }
      if (assn == true) { arc(0, 0, arc_f_width, arc_f_width, arc_gap*4+arc*3, arc_gap*4+arc*4); }
      if (formov == true) { arc(0, 0, arc_f_width, arc_f_width, arc_gap*5+arc*4, arc_gap*5+arc*5); }
      if (dommov == true) { arc(0, 0, arc_f_width, arc_f_width, arc_gap*6+arc*5, arc_gap*6+arc*6); }
      if (speech == true) { arc(0, 0, arc_f_width, arc_f_width, arc_gap*7+arc*6, arc_gap*7+arc*7); }
      if (elecsd == true) { arc(0, 0, arc_f_width, arc_f_width, arc_gap*8+arc*7, arc_gap*8+arc*8); }
      if (relfre == true) { arc(0, 0, arc_f_width, arc_f_width, arc_gap*9+arc*8, arc_gap*9+arc*9); }
      if (worker == true) { arc(0, 0, arc_f_width, arc_f_width, arc_gap*10+arc*9, arc_gap*10+arc*10); }
    }
    
    popMatrix();
  }

  if (recordPDF) {
    endRaw();
    recordPDF = false;
  }
  
  noLights();
  gui();
}

void arc_coloring(int HUMANRIGHT) {
  if (HUMANRIGHT == 0) {
    noFill();
    stroke(c_0, 100);
    strokeWeight(arc_stroke);
  } else if (HUMANRIGHT == 1) {
    noFill();
    stroke(c_1, 100);
    strokeWeight(arc_stroke);
  } else if (HUMANRIGHT == 2) {
    noFill();
    stroke(c_2, 100);
    strokeWeight(arc_stroke);
  } else {
    noFill();
    stroke(c_un, 20);
    strokeWeight(arc_stroke);
  }
}

void ellipse_coloring(int HUMANRIGHT) {
  if (HUMANRIGHT == 0) {
    noStroke();
    fill(c_0, 15);
  } else if (HUMANRIGHT == 1) {
    noStroke();
    fill(c_1, 15);
  } else if (HUMANRIGHT == 2) {
    noStroke();
    fill(c_2, 15);
  } else {
    noStroke();
    fill(0, 0, 0, 15);
  }
}

void keyPressed() {
  if (key == 'e' || key == 'E') {
    show_earth = !show_earth;
  } else if (key == 'c' || key == 'C') {
    show_coordinates = !show_coordinates;
  } else if (key == 't' || key == 'T') {
    stop_time = !stop_time;
  } else if (key == 'p' || key == 'P') {
    movement = !movement;
  } else if (key == 'i' || key == 'I') {
    insights = !insights;
  } else if (key == 'r' || key == 'R') {
    if (!recordPDF) recordPDF = true;
  }
  
  switch(key) {
    case('X'): r1.deactivateAll(); break;
    case('x'): r1.deactivateAll(); break;
    case('1'): r1.activate(0); break;
    case('2'): r1.activate(1); break;
    case('3'): r1.activate(2); break;
    case('4'): r1.activate(3); break;
    case('5'): r1.activate(4); break;
    case('6'): r1.activate(5); break;
    case('7'): r1.activate(6); break;
    case('8'): r1.activate(7); break;
    case('9'): r1.activate(8); break;
    case('0'): r1.activate(9); break;
  }
}

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isFrom(r1)) {
    if (theEvent.getGroup().getValue() == 1.0) { kill = true; } else { kill = false; }
    if (theEvent.getGroup().getValue() == 2.0) { polpris = true; } else { polpris = false; }
    if (theEvent.getGroup().getValue() == 3.0) { tort = true; } else { tort = false; }
    if (theEvent.getGroup().getValue() == 4.0) { assn = true; } else { assn = false; }
    if (theEvent.getGroup().getValue() == 5.0) { formov = true; } else { formov = false; }
    if (theEvent.getGroup().getValue() == 6.0) { dommov = true; } else { dommov = false; }
    if (theEvent.getGroup().getValue() == 7.0) { speech = true; } else { speech = false; }
    if (theEvent.getGroup().getValue() == 8.0) { elecsd = true; } else { elecsd = false; }
    if (theEvent.getGroup().getValue() == 9.0) { relfre = true; } else { relfre = false; }
    if (theEvent.getGroup().getValue() == 10.0) { worker = true; } else { worker = false; }   
  }
}