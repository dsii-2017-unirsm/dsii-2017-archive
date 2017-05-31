//Alphabet wall @andreanico © 2017 MIT License
// 10 print porting to P5js
// DSII2017 lab @UniRSM

var x = 0;  //coordinate casella
var y = 0;

var G = 30;  //dimensioni casella
var G1 = 30;

var vocali = ["A","E","I","O","U"];                          //array vocali
var consonanti = ["B","C","D","F","G","H","J","K","L","M",
             "N","P","Q","R","S","T","V","W","X","Y","Z"];   //array consonanti


function setup() {
         createCanvas(600, 600);        // dimensioni del foglio
         background(58,63,64);          // setup colore di sfondo
}

 function draw() {
          area ();
          disegnaArea();
 }


function area() {
         noFill();
         noStroke();
         rect(x, y, G, G);

 // disegna casella
 if (random(2) <= 1) {
     fill(116,126,127);
     textSize(20);
     text(random (vocali), x, y, x+G, y+G);
     textFont("Georgia");

 } else {
   fill (232,252,255);
   text(random(consonanti), x+G, y, x, y+G);
   textSize(30);
   textFont("Georgia");
   textAlign(RIGHT);
 }
}

function disegnaArea() {
  x = x + G1;
  if ( x > width-G) {
    x = width-G;
    G1= -G1;
    y = y+G;
  }
  if (x < 0) {
    x = 0;
    y = y+G;
    G1 = -G1;
  }
  if (y > height-G) {
    x = 0;
    y = 0;
    background(58,63,64);
  }
 }

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
