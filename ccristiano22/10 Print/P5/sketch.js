var x = 0;  // store current x position on the grid
var y = 0;  // store current y position on the grid
var g = 50; // grid size
var i;
var colore = 200; // current grid color

function setup() { // set up del foglio
   pixelDensity(displayDensity());
   createCanvas(windowWidth, windowHeight); // crea un foglio grande come lo schermo
//
   background(200); // cancella tutto e fallo scuro
//
   url = getURL(); // url è uguale prendiURL
   strokeJoin(ROUND); // le linee saranno arrotondate
 }

 function draw() { // disegna
   preparaQuadretto(); //prepara un quadretto che sarà l'oggetto base da stampare nel foglio
   // riga proporzionale alla griglia
   strokeWeight(g/10); // lo spessore delle linee sarà ugule a g diviso 10
   // ora lancio una monetina e disegna la linea contenut nella riga corrispondente
   if (testa()) {
   line(x*g,height-g*y,x*g+g,height-g*y-g);
   } else {
   line(x*g,height-g*y-g,x*g+g,height-g*y);
   }
   // passo alla casella a lato
   x++;
   // se sono in fondo alla riga vado a capo alla riga successiva
   if (x*g >= width) {
     x=0;
     y++;
     preparaRiga();
   }
   // se sono in fondo alla pagina ricomincio con colore e griglia differente
   if (y*g >= height) {
     y=0;
     x++
     preparaRiga();
   }
 }
function preparaQuadretto() {
   colorMode(RGB);
   noFill(colore);
   noStroke();
   rect(x*g,height-g*(y+1),g-1,g-1,);
   rect(x*g,height-g*(y+1),g-(g/20),g-(g/20),);
   stroke(255-mouseY,255-mouseX,mouseY-255);
 }
function preparaRiga() {
   fill(colore);
   noStroke();
   rect(0,height-g*y-g-1,width,g+1,);
 }
function testa() {
   if (random(2) <= 1) {
     return(true); // testa
   } else {
     return(false); // croce
   }
 }
 // se ridimensiona la finestra ricalcola width e height canvas
function windowResized() {
   resizeCanvas(windowWidth, windowHeight);
 }
 function keyTyped() {
  if (key === 'a') {
    noLoop();
  } else {

  }
  if (key === 's') {
    saveCanvas();
  } else {

  }
  if (key === 'd') {
    loop();
  } else {

  }
}
