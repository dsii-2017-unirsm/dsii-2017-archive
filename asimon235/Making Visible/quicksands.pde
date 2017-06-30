// quicksands | player audio files demo and reactive visualization by asimon235 

// 2017 @asimon235 and the course DSII2017 @UniRSM  
// github.com/asimon235 — github.com/dsii-2017-unirsm
// Educational purposes, MIT License, 2017, San Marino

// --- 

// Credits time_machine Daniele Tabellini, Audio Reactive visuals with Minim Library by
//inexhaleuk

// --- 

// Controls: 
// [1-4] play seleziona tracce 0-3
// [0] play seleziona ultima traccia cartella
// [+|-] play prossima o precedente traccia nella cartella


import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer song;
BeatDetect beat;
BeatListener bl;

class BeatListener implements AudioListener
{
  private BeatDetect beat;
  private AudioPlayer source;

  BeatListener(BeatDetect beat, AudioPlayer source) {
    this.source = source;
    this.source.addListener(this);
    this.beat = beat;
  }

  void samples(float[] samps) {
    beat.detect(source.mix);
  }

  void samples(float[] sampsL, float[] sampsR) {
    beat.detect(source.mix);
  }
}


float GV_Y001 = 95;
float GV_Y002 = 95;


float GV_Y005 = 625;
float GV_Y006 = 625;


float GV_Y009 = 50;

float GV_SPD001 = 10;
float GV_SPD002 = 5;
float GV_SPD003 = 50;

float GV_VT = 625; 
float GV_VB = 95;

ArrayList<AudioPlayer> player;
boolean inCambio = false, autoPlayAll = false, folderDoesExist;
int quale = 0;

void setup () {
  size (1280, 720);
  smooth ();
  minim = new Minim(this);

  player = new ArrayList();
  caricaSuoniDaCartella();

  beat = new BeatDetect();
  beat.setSensitivity(300);
}

void draw () {

  background (0);


  if (quale != 99) 
    if (player.get(quale).isPlaying() || player.get(quale).isLooping()) {
      beat.detect(player.get(quale).mix); // < beat detect
      if (player.get(quale).isLooping()) { // < se siamo in un loop
        // println("Loop left: " + player.get(quale).loopCount());
        if (player.get(quale).loopCount() <= 0) { // < se ha finito di fare i loop blocca
          println("finito play");
          player.get(quale).pause();
          player.get(quale).rewind();
          quale = 99;
        }
      }
    } else {
      println("finito play");
      player.get(quale).pause();
      player.get(quale).rewind();
      quale = 99;
    }

  PTRN();
}   

void PTRN () {

  stroke (255);
  fill (255);

  for (int i = 0; i < 5; i = i + 1 ) {
    for (int j = 0; j < 5; j = j + 1 ) {

      // BARSET

      if ( beat.isOnset() ) {
        rect (0, GV_Y001, width/2, beat.detectSize());
        GV_Y001 = GV_Y001 + GV_SPD001;
        if (GV_Y001 == GV_VT) { 
          GV_Y001 = random (GV_VT, GV_VB);
          if (GV_Y001 < 626) { 
            GV_Y001 = 95;
          }
        }

        rect (0, GV_Y001, width/2, random (1, 70));
        GV_Y001 = GV_Y001 + GV_SPD001;
        if (GV_Y001 == GV_VT) { 
          GV_Y001 = random (GV_VT, GV_VB);
          if (GV_Y001 < 626) { 
            GV_Y001 = 95;
          }
        }

        rect (width/2, GV_Y002, width, beat.detectSize());
        GV_Y002 = GV_Y002 + GV_SPD002;
        if (GV_Y002 == GV_VT) { 
          GV_Y002 = random(GV_VT, GV_VB);
          if (GV_Y002 < 626) { 
            GV_Y002 = 95;
          }
        } 

        rect (width/2, GV_Y002, width, random (1, 50) );
        GV_Y002 = GV_Y002 + GV_SPD002;
        if (GV_Y002 == GV_VT) { 
          GV_Y002 = random(GV_VT, GV_VB);
          if (GV_Y002 < 626) { 
            GV_Y002 = 95;
          }
        } 

        // BARSET_002 (Inverted)

        rect (0, GV_Y005, width/2, beat.detectSize());
        GV_Y005 = GV_Y005 - GV_SPD001;
        if (GV_Y005 == GV_VB) { 
          //GV_Y005 = random(GV_VT, GV_VB);
          if (GV_Y005 < 94) { 
            GV_Y005 = 625;
          }
        }

        rect (0, GV_Y005, width/2, random (1, 70));
        GV_Y005 = GV_Y005 - GV_SPD001;
        if (GV_Y005 == GV_VB) { 
          GV_Y005 = random(GV_VT, GV_VB);
          if (GV_Y005 < 94) { 
            GV_Y005 = 625;
          }
        }

        rect (width/2, GV_Y006, width, beat.detectSize());
        GV_Y006 = GV_Y006 - GV_SPD002;
        if (GV_Y006 == GV_VB) { 
          GV_Y006 = random(GV_VT, GV_VB);
          if (GV_Y006 < 94) { 
            GV_Y002 = 625;
          }
        }
      }
    }
  }
}

void cambia(int song, int nLoops) {
  if (quale != song) {
    inCambio = true;
    if (quale != 99) 
      if (player.get(quale).isPlaying()) {
        player.get(quale).pause();
        player.get(quale).rewind();
      }
    quale = song;
    println("Caricando traccia > " + quale + "   per loops > " + nLoops);
    player.get(quale).rewind();
    if (nLoops == 1) 
      player.get(quale).play();
    else if (nLoops == 2) 
      player.get(quale).loop(nLoops); 
    else if (nLoops > 2) 
      player.get(quale).loop(nLoops-1); 
    inCambio = false;
  }
}

void keyPressed() {

  if ( key == '1' ) cambia(0, 1);
  else if ( key == '2' ) cambia(1, 3);
  else if ( key == '3' ) cambia(2, 1);
  else if ( key == '4' ) cambia(3, 2); // occhio che in questo test devono esserci almeno 4 file audio dentro la cartella data/
  else if ( key == '0' ) cambia(player.size()-1, 4);  // < suona ultimo file cartella 4 volte

  else if ( key == '+' ) {
    int dove = quale + 1;
    if (dove == player.size()) dove = 0;  // < per fare il giro se sono all'ultima
    cambia(dove, 1);
  } else if (key == '-' ) {
    int dove = quale - 1;
    if (dove < 0) dove = player.size()-1;  // per fare il giro contrario se sono alla prima
    cambia(dove, 1);
  }
}

void stop() {
  if (quale!=99)
    player.get(quale).close();
  minim.stop();
  super.stop();
}  

void exit() {
  stop();
}
