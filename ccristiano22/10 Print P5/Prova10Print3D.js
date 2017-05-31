var x = 0;
var y = 0;
var x1 = 0;
var y1 = 0;
var x2 = 0;
var y2 = 0;
var x3 = 0;
var y3 = 0;
var x4 = 0;
var y4 = 0;
var D = 30;
var D1 = 30;
var D2 = 30;
var D3 = 30;
var D4 = 30;
var D5 = 30;

function setup() { // set up del foglio
   //pixelDensity(displayDensity());
   createCanvas(600, 600, WEBGL); // crea un foglio grande come lo schermo
   background(0); // cancella tutto e fallo chiaro
//
   //url = getURL(); // url è uguale prendiURL
   //strokeJoin(ROUND); // le linee saranno arrotondate
 }

function draw() { // disegna

push();
translate(0, height);
rotateX(-PI/2);
matrice ();
pop();
stampaMatrice ();


push();
rotateY(PI/2);
translate(0, height);
rotate(radians(-90));
matrice1 ();
pop();
stampaMatrice1 ();

push();
rotateX(-PI/2);
translate(0, 0);
rotate(radians(0));
matrice2 ();
pop();
stampaMatrice2 ();

push();
translate(width, 0);
rotateY(-PI/2);
rotate(radians(90));
matrice3 ();
pop();
stampaMatrice3 ();

 }
function matrice() {
  noFill();
  noStroke();
  rect(x, y, D, D);

 stroke(50);
 strokeWeight(random(1, 6));

 // Matrice da stampare
 if (random(2) <= 1) {
   stroke(random(225));
   line(x, y, x+D, y+D);
   //triangle(x, y+D, x+D/2, y, x+D, y+D);
 } else {
   stroke(random(225));
   line(x+D, y, x, y+D);
   //triangle(x, y, x+D/2, y+D, x+D, y);
 }
 }
 function matrice1() {
   noFill();
  noStroke();
  //fill(255);
  translate(0, 0);
  rect(x1, y1, D, D);

  stroke(50);
  strokeWeight(random(2, 4));
  if (random(2) <= 1) {
    stroke(random(225));
    line(x1, y1, x1+D, y1+D);
  } else {
    stroke(random(225));
    line(x1+D, y1, x1, y1+D);
  }
  }
  function matrice2() {
    noFill();
    noStroke();
    rect(x2, y2, D, D);

    stroke(50);
    strokeWeight(random(2, 4));
 if (random(2) <= 1) {
   stroke(random(225));
   line(x2, y2, x2+D, y2+D);
 } else {
   stroke(random(225));
   line(x2+D, y2, x2, y2+D);
 }
   }
   function matrice3() {
   noFill();
   noStroke();
   rect(x3, y3, D, D);

   stroke(50);
   strokeWeight(random(2, 4));
 if (random(2) <= 1) {
   stroke(random(225));
   line(x3, y3, x3+D, y3+D);
 } else {
   stroke(random(225));
   line(x3+D, y3, x3, y3+D);
 }
    }
function stampaMatrice() {
  x = x + D1;
  if ( x > width-D) {
    x = width-D;
    D1= -D1;
    y = y+D;
  }
  if (x < 0) {
    x = 0;
    y = y+D;
    D1 = -D1;
  }
  if (y > height-D) {
    x = 0;
    y = 0;
    background(random(225), random(225), random(225));
  }
 }
 function stampaMatrice1() {
   x1 = x1 + D2;
     if ( x1 > width-D) {
       x1 = width-D;
       D2= -D2;
       y1 = y1+D;
     }
     if (x1 < 0) {
       x1 = 0;
       y1 = y1+D;
       D2 = -D2;
     }
     if (y1 > height-D) {
       x1 = 0;
       y1 = 0;
       background(random(225), random(225), random(225));
     }
}
function stampaMatrice2() {
  x2 = x2 + D3;
    if ( x2 > width-D) {
      x2 = width-D;
      D3= -D3;
      y2 = y2+D;
    }
    if (x2 < 0) {
      x2 = 0;
      y2 = y2+D;
      D3 = -D3;
    }
    if (y2 > height-D) {
      x2 = 0;
      y2 = 0;
      background(random(225), random(225), random(225));
    }
}
function stampaMatrice3() {
  x3 = x3 + D4;
  if ( x3 > width-D) {
    x3 = width-D;
    D4= -D4;
    y3 = y3+D;
  }
  if (x3 < 0) {
    x3 = 0;
    y3 = y3+D;
    D4 = -D4;
  }
  if (y3 > height-D) {
    x3 = 0;
    y3 = 0;
    background(random(225), random(225), random(225));
  }
}
function stampaMatrice4() {
  x4 = x4 + D5;
  if ( x4 > width-D) {
    x4 = width-D;
    D5= -D5;
    y4 = y4+D;
  }
  if (x < 0) {
    x4 = 0;
    y4 = y4+D;
    D5 = -D5;
  }
  if (y > height-D) {
    x4 = 0;
    y4 = 0;
    background(random(225), random(225), random(225));
  }
}
 // se ridimensiona la finestra ricalcola width e height canvas
 function keyTyped() {  // se premo a fermo il loop
  if (key === 'a') {
    noLoop();
  } else {

  }
  if (key === 's') {  // se premo f lo fermo
    saveCanvas();
  } else {

  }
  if (key === 'd') { // se premo d riparte
    loop();
  } else {

  }
}
