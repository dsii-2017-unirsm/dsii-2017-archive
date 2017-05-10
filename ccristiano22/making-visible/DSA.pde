String live = " ";

void setup () {
  size (600, 400);
}

void draw() {
  background(0);
  text(live, 0, 0, width, height);
}

void keyPressed(){
  mod(key);
}
void mod ( char tasto) {
  //if (random(-1, 1)>0) {
    live += tasto;
  //} else {
    live += ' ';
    live += ' ';
  //}
  //if (random(-1, 2)>0) {
    //textSize(random(10, 30));
  //}
}
