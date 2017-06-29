
// Arrey di punti (fuochi d'artificio)
var fireworks = [];
var gravity;


function setup (){

  createCanvas(windowWidth,windowHeight);

  gravity = createVector(0,0.1);


  stroke(255);
  strokeWeight(4);

  background(0);
colorMode (HSB);
}



function draw (){
colorMode (RGB);
  background(0,0,0,4);

// Ogni frame ha una possibilità del 10% di far comparire un nuovo punto
if (random (1) < 0.1) {
  fireworks.push (new Firework());

}



  for (var i = fireworks.length - 1; i >= 0 ; i--) {
    fireworks [i].update();
    fireworks [i].show();
    if (fireworks[i].done()){

      fireworks.splice(i,1);
    }


  }

console.log(fireworks.length);

}
