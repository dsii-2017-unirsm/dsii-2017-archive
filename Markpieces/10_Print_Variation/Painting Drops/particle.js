
function Particle (x,y,hue,firework) {

  this.pos = createVector (x , y);
  this.firework = firework;
  this.lifespan = 255;
  this.hue = hue;


if (this.firework) {
  this.vel = createVector (0 , random (-15,-5));
} else {
  this.vel = p5.Vector.random2D();
  this.vel.mult(random (2,14));
}

  this.acc = createVector (0 , 0);

  this.applyForce = function (force) {
  this.acc.add(force);
}
this.acc = createVector (0,0);

this.applyForce = function (force) {

this.acc.add (force);

}


  this.update = function (){

if (!this.firework) {

    this.vel.mult(5);
    this.lifespan -= 4;

}

    this.vel.add(this.acc);
    this.pos.add(this.vel);
    this.acc.mult(2);
  }


this.done = function (){

  if (this.lifespan < 0) {

  return true;

} else {

  return false;

}

}



  this.show = function () {

colorMode (HSB);


if (!this.firework) {
    fill (hue,255,255);
    strokeWeight(4);
    stroke (hue,255,255,this.lifespan);
  } else {
    fill (hue,255,255);
    stroke (hue,255,255);
    strokeWeight(6);
  }


    ellipse (this.pos.x , this.pos.y,random(6),random(30));

  }

}
