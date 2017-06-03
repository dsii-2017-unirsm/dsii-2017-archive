/* 
QUICKSANDS, Simone Angelini
comandi: 
"1" seleziona traccia 0
"2" seleziona traccia 1
"3" seleziona traccia 2
"4" seleziona traccia 3

"h" avanza di 1h 
"m" avanza di 1m
"r" rewind 30sec

*/


import ddf.minim.*;
import ddf.minim.analysis.*;
AudioPlayer[] player = new AudioPlayer[4];
Minim minim;
FFT fft;
float val;
int val2;
int bufferSize = 8;
int fftSize = floor(bufferSize*.9)+1;
int count=0;

float secondi;
float minuti;
float ore;

int prog=0;
int incrMin=0;
int incrOra=0;


void setup() {

  size(512, 200, P3D);

  minim = new Minim(this);
  player[0] = minim.loadFile("data/stain.mp3");
  player[1] = minim.loadFile("data/skin.mp3");
  player[2] = minim.loadFile("data/beep.mp3");
  player[3] = minim.loadFile("data/divine.mp3");

  player[count].loop();

  fft=new FFT(player[count].bufferSize(), player[count].sampleRate());
}

void draw(){

  background(255);

  if (!player[count].isPlaying()) {
    count++;
    if (count>3)count=0;
    player[count].play();
  }
  
  //richiamo l'orologio
   ore=hour();
  minuti=minute();
 secondi=second();

  fill(0);  
  text(int(ore+incrOra), 30, 30);
  text(":", 50, 30);
  text(int(minuti+incrMin), 60, 30);
  text(":", 80, 30);
  text(int(secondi), 90, 30);
}


void stop(){
  //player.close();
  //minim.stop();
  //super.stop();
}  

void keyPressed(){
  
    if ( key == '1' ){
  for (int i=0; i<4; i++) {
      player[i].pause();
    }
    
    player[0].play();
    player[1].pause();
    player[2].pause();
    player[3].pause();
  }
  
    if ( key == '2' ){
  for (int i=0; i<4; i++) {
      player[i].pause();
    }
    
    player[1].play();
    player[0].pause();
    player[2].pause();
    player[3].pause();
  }
  
  if ( key == '3' ){
    for (int i=0; i<4; i++) {
      player[i].pause();
    }
    
    player[2].play();
    player[0].pause();
    player[1].pause();
    player[3].pause();
  }
  
    if ( key == '4' ){
  for (int i=0; i<4; i++) {
      player[i].pause();
    }
    
    player[3].play();
    player[0].pause();
    player[1].pause();
    player[2].pause();
  }

  if ( key == 'h' ){
    // skip forward 1 hour
    prog=600000;
    incrOra++;
    player[count].skip(prog);
  }
    if ( key == 'm' )
  {
    // skip forward 1 minute
    prog=60000;
    incrMin++;
    player[count].skip(prog);
  }
  
  if ( key == 'r' )
  {
    // skip backward 30 sec
    player[count].skip(-30000);
  }
}
