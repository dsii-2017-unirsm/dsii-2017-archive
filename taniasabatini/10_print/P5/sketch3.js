var x = 0;
var y = 0;

var D = 20;
var D1 = 30;
var scaladimensioni = [120,140,180,200];


function setup() { // setup del foglio
pixelDensity(displayDensity());
//createCanvas(displayWidth,displayHeight);
createCanvas(windowWidth, windowHeight);
background(0);
}

function draw() { // disegna
   areamatrice ();
   stampaareaMatrice();
}
function areamatrice() {
  noFill();
  noStroke();
  rect(x, y, D, D);

 // Matrice da stampare
 if (random(2) <= 1) {
   fill(random(225),random(70));
   ellipse(x, y, random (D,D));
  // clear();
   //var speed = abs(winMouseX-pwinMouseX);
   //ellipse(x, y, 10+speed*5, 10+speed*5);
  //  mouseMoved(winMouseX,winMouseY);

} else {
   fill(random(225),random(70));
   //ellipse(x+D, y, x, y+D);
   ellipse(x, y, random (D1,D1));
  // clear();
  //  var speed = abs(winMouseX-pwinMouseY);
  //  ellipse(x, y, 2+speed*2, 2+speed*2);
}
frameRate(60);
}


function stampaareaMatrice() {
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

// function keyTyped() {
//   if (mouseIsPressed == true)
//   {D=scaladimensioni[i];}
//   else if (mouseIsPressed == false) {
//   }}
// //se ridimensiono la finesta, ricalcola canvas
//  function windowResized() {
//    resizeCanvas(windowWidth, windowHeight);
//  }

//  function mouseMoved() {
//    //clear();
//   //the difference between previous and
//   //current x position is the horizontal mouse speed
//   var speed = abs(winMouseX-pwinMouseX);
//   //var speed = abs(mouseMovedX-mouseMovedy); non so
//   //change the size of the circle
//   //according to the horizontal speed
//   ellipse(50, 50, 10+speed*5, 10+speed*5);
//   //move the canvas to the mouse position
// }

 // comandi da tastiera ____________________________

 function keyTyped() {  // se premo "a" imposto lo schermo intero
  if (key === 'o') {
    var fs = fullscreen();
    fullscreen(!fs);
  } else {

  }
  if (key === 's') {  // se premo "s" salvo uno screenshot
    saveCanvas('screenshot', 'png');
  } else {

  }
  if (key === 'c') { // se premo "c" pulisco il background
    background(255);
  } else {

  }
  if (key === 't') { // se premo "c" pulisco il background
  var i = int(random(3));
   D=scaladimensioni[i];
   D1=scaladimensioni[i];
 } else {
   D=20;
   D1=30;


}
}
