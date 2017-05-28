// Francesco Paolini @francescopaolini © 2017 MIT License
// 10 print porting to P5js
// Made for DSII2017 lab @UniRSM

var x = 0;
var y = 0;
var dimensioni = [ 20, 40, 80, 100 ];
var D;
var x1 = 10;
var y1 = 10;
var x3 = 10;
var y3 = 10;
var x4 = 10;
var y4 = 10;

function setup() {
  createCanvas(1310, 700);
  background(255); //sfondo bianco
  frameRate(60); //60 frame a secondo

  var i = int(random(4));
D = dimensioni[i];

  y1 = (height-D);
  x3 = (width-D);
  y3 = (height-D);
  x4 = (width-D);
}

function draw() {
  forma1();
  forma2();
  forma3();
  forma4();
}

//------------------------------forma 1------------------------------//
function forma1() {
  fill(random(255,40));
  noStroke();
  rect(x, y, D, D);

  x = x + D;
  if (x >= width) {
    x=0;
    y = y+D;
  }
  if (y >= height) {
    background(random(255)); //sfondo random ad un canale
    x=0;
    y=0;
  }
}
//------------------------------forma 2------------------------------//
function forma2() {
  fill(100, 40);
  noStroke();
  ellipse(x3, y3, D, D);


  if (y1 <= 0) {
    y1 = (height);
    x1 = x1+D;
  }
  y1 = y1 - D;

  if (x1 >= width ) {
    background(255); //sfondo random ad un canale
    x1 = 0;
    y1 = (height-D);
  }
}
//------------------------------forma 3------------------------------//
function forma3() {
  fill(100, 40);
  noStroke();
  ellipse(x3, y3, D, D);
  x3 = x3 - D;
  if (x3 < 0) {
    x3 = width-D;
    y3 = y3-D;
  }

  if (y3 <= 0-D) {
    background(random(255));
    x3 = (width-D);
    y3 = (height-D);
  }
}
//------------------------------forma 4------------------------------//
function forma4() {
  fill(random(255));
  noStroke();
triangle(x4, y4+D, x4+D/2, y4, x4+D, y4+D);

  y4 = y4 + D;
  if (y4 >= height) {
    y4 = 0;
    x4 = x4 -D;
  }

  if (x4 <= 0-D) {
    setup();
    background(random(255));
    x4 = (width-D);
    y4 = 0;
  }
}

//------------------------------utilizzo tastiera------------------------------//
function keyTyped() {

  if (key == 'a') { // se premi "a" si blocca il loop
    noLoop();
  } else {
  }
  if (key == 's') {  // se premi "s" fai uno screenshot del canvas
    saveCanvas('variazione', 'png'); //viene salvato nella cartella download col nome "variazione.png"
  } else {
  }
  if (key == 'd') { // se premi "d" riparte il loop
    loop();
  } else {
  }if (key == 'q') { // se premi "q" si pulisce il canvas
    background(255);
  }
}
