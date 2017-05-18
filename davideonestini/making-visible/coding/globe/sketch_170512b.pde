import peasy.*;

PeasyCam cam;

PVector[][] globe;
int total = 100;

Table table;



void setup() {
  fullScreen(P3D);
  colorMode(RGB, 255, 255, 255, 100);
  cam = new PeasyCam(this, 200);
  globe = new PVector[total+1][total+1];
  table = loadTable("ciri-data.csv", "header");
}

void draw() {
  background(25,25,25,100);
  lights();
  fill(255);
  
  //translate(width/2, height/2);
  //sphere(200);
  
  float r = 200;
  
  for (int i = 0; i < total+1; i++) {
    float lat = map(i, 0, total, 0, PI);
    for (int j = 0; j < total+1; j++) {
      float lon = map(j, 0, total, 0, TWO_PI);
      
      float x = r * sin(lat) * cos(lon);
      float y = r * sin(lat) * sin(lon);
      float z = r * cos(lat);
      
      //stroke(255);
      //strokeWeight(1);
      //point(x,y,z);
      
      globe[i][j] = new PVector(x,y,z);
    }
  }
  
  //for (int i = 0; i < total; i++) {
  //  beginShape(TRIANGLE_STRIP);
  //  for (int j = 0; j < total+1; j++) {
  //    stroke(100);
  //    strokeWeight(1);
  //    fill(100);
      
  //    PVector v1 = globe[i][j];
  //    vertex(v1.x,v1.y,v1.z);
      
  //    PVector v2 = globe[i+1][j];
  //    vertex(v2.x,v2.y,v2.z);
  //  }
  //  endShape();
  //}
  
  for (TableRow row : table.rows()) {
    float lt1 = row.getFloat("latitude");
    float ln1 = row.getFloat("longitude");
    int year = row.getInt("year");
    int KILL = row.getInt("KILL");
   
    // println(lat,lon,year);
    
    if (year == 2011) {
    
      // float ln1 = 0;
      // float lt1 = 0;
      float lon1 = map(ln1, -180, 180, 0, TWO_PI);
      float lat1 = map(lt1, -90, 90, 0, PI);
      
      float x1 = r * sin(lon1) * cos(lat1);
      float y1 = r * sin(lon1) * sin(lat1);
      float z1 = r * cos(lon1);
      
      if (KILL == 0) {
        stroke(199,0,57,100);
        strokeWeight(5);
        point(x1,y1,z1);
      } else if (KILL == 1) {
        stroke(144,12,63,100);
        strokeWeight(5);
        point(x1,y1,z1);
      } else if (KILL == 2) {
        stroke(88,24,69,100);
        strokeWeight(5);
        point(x1,y1,z1);
      } else {
        stroke(255,255,255,20);
        strokeWeight(5);
        point(x1,y1,z1);
      }
      
    }
  }
}