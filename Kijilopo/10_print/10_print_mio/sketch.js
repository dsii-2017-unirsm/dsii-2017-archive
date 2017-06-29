var w = 12; // int diventa var
var h = 12;
var index = 0;
var righe;
var s = 0;
var c = 0;


function setup() { // void diventa function
  createCanvas(windowWidth, windowHeight); // in modo che si adatti allo schermo
  colorMode(HSB);
  background(255, 0, 100);
  strokeWeight(2);
  righe = int(windowHeight/h); // è il numero intero per l'altezza della finestra diviso h
}

function draw() {

  c++;
  if (c > 255) {
    c = 0;
  }
  stroke(c, 255, 100);

  var x1 = w*index;
  var x2 = x1 + w;
  var y1 = h*(righe-1); //indice della riga
  var y2 = h*righe; // qui come sopra è necessario dare righe e non numeri fissi se no non si riadatta

  if (random(2) < 1) {
    line(x2, y1, x1, y2);
  } else {
    line(x1, y1, x2, y2);
  }

  if (mouseIsPressed)
  line(x2, y1, x1, y2) == line(mouseX, mouseY, x2, y2);

  if (random(2) <1) {
    s = 20;
  } else {
    s = 100;
  }


  index++;
  if (index >= windowWidth/w) {  //cambiato da == a >=, ma perchè?
    image = get(0, h, windowWidth, h*(righe-3)); // perchè? da rivedere
    colorMode(HSB);
    background(255, 0, 100);
    set(0, -s, image);
    index = 0;
    }

  // se ridimensiona la finestra ricalcola width e height canvas
// da inserire sempre se si utlizzano windowWidth e windowHeight
function windowResized() {
  resizeCanvas(windowWidth, windowHeight);
}
}
