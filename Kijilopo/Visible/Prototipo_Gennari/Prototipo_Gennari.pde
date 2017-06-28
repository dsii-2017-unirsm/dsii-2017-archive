// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com
// Kijilopo & Fupete

// Example 16-13: Simple motion detection


import processing.pdf.*;
import controlP5.*;
ControlP5 cp5;

float circleRadius = 0;
float fadeOutTime = 10000;
float x = 1;
float y = 1;
int colore = 100;
ArrayList <PVector> points = new ArrayList <PVector> ();


import processing.video.*;
// Variable for capture device
Capture video;
// Previous Frame
PImage prevFrame;
// How different must a pixel be to be a "motion" pixel
float threshold = 50;

float diffMedio = 0;

void setup() {
  cp5 = new ControlP5(this);
  color(0);
  cp5.addSlider("colore").setPosition(10,10).setRange(0,255).setValue(100).setWidth(255).setHeight(15).setColorValue(color(0, 0, 0)).setColorBackground(color(156, 158, 159)).setColorValue(color(0, 0, 0)).setColorForeground(color(255));
  //frameRate(1);
  size(640, 480);
  beginRecord(PDF, "everything.pdf");
  
  video = new Capture(this, width, height, 30);
  video.start();
  // Create an empty image the same size as the video
  prevFrame = createImage(video.width, video.height, RGB);
}

void captureEvent(Capture video) {
  // Save previous frame for motion detection!!
  prevFrame.copy(video, 0, 0, video.width, video.height, 0, 0, video.width, video.height); // Before we read the new frame, we always save the previous frame for comparison!
  prevFrame.updatePixels();  // Read image from the camera
  video.read();
}

void draw() {

  background(0, 0, 0);

  // loadPixels();
  video.loadPixels();
  prevFrame.loadPixels();

  diffMedio = 0;

  // Begin loop to walk through every pixel
  for (int x = 0; x < video.width; x ++ ) {
    for (int y = 0; y < video.height; y ++ ) {


      int loc = x + y*video.width;            // Step 1, what is the 1D pixel location
      color current = video.pixels[loc];      // Step 2, what is the current color
      color previous = prevFrame.pixels[loc]; // Step 3, what is the previous color

      // Step 4, compare colors (previous vs. current)
      float r1 = red(current); 
      float g1 = green(current); 
      float b1 = blue(current);
      float r2 = red(previous); 
      float g2 = green(previous); 
      float b2 = blue(previous);
      float diff = dist(r1, g1, b1, r2, g2, b2);

      diffMedio += diff;

      //   updatePixels();
      // Step 5, How different are the colors?
      // If the color at that pixel has changed, then there is motion at that pixel.
      /*     if (diff > threshold) { 
       // If motion, display black
       pixels[loc] = color(0);
       } else {
       // If not, display white
       pixels[loc] = color(255);
       }*/
    }
  }

  diffMedio /= video.width * video.height;

  for (int i=points.size()-1; i>=1; i--) {
    PVector p = points.get(i);
    PVector pPrima = points.get(i-1);
    float timeAlive = millis() - p.z;
    if (timeAlive > fadeOutTime) {
      points.remove(i);
    } else {
      float transparency = map(timeAlive, 0, fadeOutTime, 255, 0);
      fill(0, 0, 0, transparency);
      //ellipse(p.x, p.y, circleRadius, circleRadius);
      colorMode(HSB);
      stroke(colore, 255, 255, transparency);
      strokeWeight(1);
      line(p.x, p.y, pPrima.x, pPrima.y);
      noFill();
    }
  }
  points.add(new PVector(x, y, millis()));
  x = x + random(-diffMedio, diffMedio);
  y = y + random(-diffMedio, diffMedio);

  x = constrain(x, 0, width-1);
  y = constrain(y, 0, height-1);



  // textSize(32);
  // fill(0, 102, 153);
  // text(diffMedio, 10, 60);
}

void keyPressed() {
  if (key == 'q') {
    endRecord();
    exit();
  }
}