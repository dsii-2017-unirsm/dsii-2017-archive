Auto nuovaAuto1;
Auto nuovaAuto2;
Auto nuovaAuto3;
Auto nuovaAuto4;
Auto nuovaAuto5;
Auto nuovaAuto6;
Auto nuovaAuto7;
Auto nuovaAuto8;
Auto nuovaAuto9;

void setup() {
  colorMode(RGB,100);
  size(600,600);
  nuovaAuto1 = new Auto(color(20),0,60,3);
  nuovaAuto2 = new Auto(color(30),0,120,6);
  nuovaAuto3 = new Auto(color(40),0,180,9);
  nuovaAuto4 = new Auto(color(50),0,240,12);
  nuovaAuto5 = new Auto(color(60),0,300,15);
  nuovaAuto6 = new Auto(color(70),0,360,18);
  nuovaAuto7 = new Auto(color(80),0,420,21);
  nuovaAuto8 = new Auto(color(90),0,480,24);
  nuovaAuto9 = new Auto(color(100),0,540,27);
}

void draw() {
  background(10);
  noStroke();
  nuovaAuto1.move();
  nuovaAuto1.display();
  nuovaAuto2.move();
  nuovaAuto2.display();
  nuovaAuto3.move();
  nuovaAuto3.display();
  nuovaAuto4.move();
  nuovaAuto4.display();
  nuovaAuto5.move();
  nuovaAuto5.display();
  nuovaAuto6.move();
  nuovaAuto6.display();
  nuovaAuto7.move();
  nuovaAuto7.display();
  nuovaAuto8.move();
  nuovaAuto8.display();
  nuovaAuto9.move();
  nuovaAuto9.display();
}

class Auto {
  color c;
  float x;
  float y;
  float speed;

  Auto(color colore, float posx, float posy, float velocita) {
    c = colore;
    x = posx;
    y = posy;
    speed = velocita;
  }

  void move() {
    x = x + speed;
    if (x > width) {
      x = 0;
    }
  }
  
  void display() {
    fill(c);
    ellipse(x,y,30,10);
  }
}
