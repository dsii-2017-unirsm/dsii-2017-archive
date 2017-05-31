// Poem
// 10 Print wall @andreanico © 2017 MIT License
// 10 print porting to P5js
// DSII2017 lab @UniRSM

var x = 0;                                                 //coordinate casella
var y = 0;

var G = 60;                                                //dimansioni casella
var G1 = 100;
var s = ["sole","mare","silenzio","posto","libro"];        //array nomi
var t = ["vuoto","buio","caldo","triste","profondo",];     //array aggettivi
//var r = ["toglie","prende","cade","resta","perde"];      //array verbi
//var y = ["sempre","soltanto","qui","sotto","ecco",];     //array avverbi




function setup() {
         createCanvas(600, 600);        // dimensioni del foglio
         background(30,30,30);          // setup colore di sfondo
         textFont("Georgia");
         textSize(20);


}

 function draw() {                      // disegna area lavoro
          area ();
          disegnaArea();
 }


function area() {                        // attributi area lavoro
         noFill();
         noStroke();
         rect(x, y, G, G);


 if (random(2) <= 1) {                  // attributi casella di testo
     fill(116,126,127);
     text(random (s), x, y, x+G, y+G);

 } else {
   fill (232,252,255);
   text(random(t), x+G, y, x, y+G);
   textAlign(RIGHT);
   textAlign(CENTER);
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
    background(30,30,30);
  }
 }


 function keyTyped() {                  // se premo "a" fermo il loop
  if (key === 'a') {
    noLoop();
  } else {

  }
  if (key === 's') {                    // se premo "f" lo fermo
    saveCanvas();
  } else {

  }
  if (key === 'd') {                    // se premo "d" riparte
    loop();
  } else {

  }
}
