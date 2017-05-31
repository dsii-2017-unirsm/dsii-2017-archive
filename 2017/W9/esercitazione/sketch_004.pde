// OCCHIO DI BUE RIMBALZA by @Fupete
// anim condizionale per bordi

// 2017 © Daniele @Fupete and the course DSII2017 @UniRSM  
// github.com/fupete — github.com/dsii-2017-unirsm
// Educational purposes, MIT License, 2017, San Marino


int radius = 50;
PVector c;
PVector speed = new PVector(2.8, 2.2);
PVector direction = new PVector(1, 1);


void setup() {
  size(400, 400); 
  stroke(255);
  strokeWeight(200);
  noFill();

  ellipseMode(RADIUS);
  c = new PVector(width/2, height/2);
}

void draw() {
  background(0);
  c.x = c.x + (speed.x * direction.x);
  c.y = c.y + (speed.y * direction.y);

  if (c.x > width-radius || c.x < radius) {
    direction.x *= -1;
  }
  if (c.y > height-radius || c.y < radius) {
    direction.y *= -1;
  }

  ellipse(c.x, c.y, radius, radius);
  punto(c.x,c.y);
}

void punto(float x, float y) {
  pushStyle();
  fill(255);
  noStroke();
  ellipse(x, y, 10, 10);
  popStyle();
}
