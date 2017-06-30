import controlP5.*;
ControlP5 cp5;



boolean muto = false;
boolean basso = false;
boolean chitarra = false;
boolean cassa = false;
boolean rullante = false;

import processing.serial.*; 

RadioButton r1;

// VIDEO BG
import processing.video.*;

import ddf.minim.*;

AudioPlayer pan, kick, bass, guitar, vibration;


//VIDEO BG
Movie myMovie;

Minim minim;

Serial port;

void setup() {
  
  
  
  cp5 = new ControlP5(this);
  setupGUI();

  println(Serial.list()); 

  port = new Serial(this, Serial.list()[1], 9600); 


  fullScreen(P2D);

  minim = new Minim(this);
  vibration = minim.loadFile("totalebuono.mp3", 2048);
  vibration.play();
  vibration.loop();


  minim = new Minim(this);
  pan = minim.loadFile("panbuono.mp3", 2048);
  pan.play();
  pan.loop();
  

  minim = new Minim(this);
  kick = minim.loadFile("kickbuono.mp3", 2048);
  kick.play();
  kick.loop();


  minim = new Minim(this);
  bass = minim.loadFile("bassobuono.mp3", 2048);
  bass.play();
  bass.loop();


  minim = new Minim(this);
  guitar = minim.loadFile("guitarbuona.mp3", 2048);
  guitar.play();
  guitar.loop();


  //VIDEO BG

  myMovie = new Movie(this, "caccadue.mp4");
  myMovie.loop();
  myMovie.play();
}

void draw() {
  background(0);
  colorMode(RGB);
  smooth();
  
  int count = 0;

  int lowTotBass =0;
  int lowTotGuitar =0;
  int lowTotKick =0;
  int lowTotPan=0;
  int lowTotTotal=0;
  int lowTotPandim=0;

 if (muto == true) { 
    vibration.mute();
    pan.mute();
    kick.mute();
    guitar.mute();
    bass.mute();
  } else {
    vibration.unmute();
    pan.unmute();
    kick.unmute();
    guitar.unmute();
    bass.unmute();
  }

  




  //VIDEO BG ----------------------------------------------------

  image(myMovie, 0, 0, width, height);

  //VIBRATION TOTAL -------------------------------------------------------------

  for (int i = 0; i < vibration.left.size()/3.0; i+=5) {
    lowTotTotal+= (abs(vibration.left.get(i)) * 50 );
    count++;
  }


  float vibe = map( lowTotTotal, 0, count * 30, 0, 255 );
  
  //KICK -----------------------------------------------------------------------------------------------------------


  for (int i = 0; i < kick.mix.size()/3.0; i++) {
    lowTotKick+= (abs(kick.mix.get(i)) * 50 );
    count++;
  }
  

  float vibeKick = map( lowTotKick, 0, count , 0, 255 );
  

  //stroke(255);
  noFill();
  strokeWeight(map( lowTotKick, 0, count *100, 0, 255 ));
  stroke(255);
  
  ellipse(width/2-15, height/2+300, map( lowTotKick, 0, count *10, 0, 255 ), map( lowTotKick, 0, count*10 , 0, 255 ));
  

  
 
  
  

  //PAN -----------------------------------------------------------------------------------------------------------


  for (int i = 0; i < pan.mix.size()/3.0; i++) {
    lowTotPan+= (abs(pan.mix.get(i)) * 130 );
    count++;
  }
for (int i = 0; i < pan.mix.size()/3.0; i++) {
    lowTotPandim+= (abs(pan.mix.get(i)) * 40 );
    count++;
  }

float vibePan = map( lowTotPan, 0, count , 0, 255 );

float dimensionPan =map( lowTotPandim, 0, count , 0, 255 );


  //strokeWeight(40);
  //stroke(200,200,200);

  noFill();
  strokeWeight(map( lowTotPan, 0, count*60 , 0, 255 ));
  stroke(255);

  ellipse(width/2, height/2, dimensionPan,dimensionPan);

  // BASS --------------------------------------------------------------------------------------------------------

  for (int i = 0; i < bass.mix.size(); i++) {
    lowTotBass+= (abs(bass.mix.get(i)) * 10 );
    count++;
   
  }


float vibeBass = map( lowTotBass, 0, count , 0, 255 );


  //strokeWeight(map( lowTotBass, 0, count * 20, 0, 255 ));
  //stroke(vibeKick,50,50);

  noFill();
  strokeWeight(map( lowTotBass, 0, count*10, 0, 255 ));
  stroke(255);

  ellipse(width/2+400, height/2+15, map( lowTotBass, 0, count, 0, 255 ), map( lowTotBass, 0, count , 0, 255 ));

  //GUITAR -----------------------------------------------------------------------------------------------------------


  for (int i = 0; i < guitar.mix.size()/3.0; i++) {
    lowTotGuitar+= (abs(guitar.mix.get(i)) * 40 );
    count++;
    
  
  }


float vibeGuitar = map( lowTotGuitar, 0, count, 0, 255 );


  //strokeWeight(map( lowTotGuitar, 0, count * 10, 0, 255 ));
  //stroke(vibeKick,255,255);

  noFill();
  strokeWeight(map( lowTotGuitar, 0, count*10 , 0, 255 ));
  stroke(255);

  ellipse(width/2-460, height/2+15, map( lowTotGuitar, 0, count , 0, 255 ), map( lowTotGuitar, 0, count , 0, 255 ));


// VIBRATION BASS -----------------------------------------------------------------------------------------------------------

if (basso == true){
  
  // cp5.getController("muto").deActivate;
  

  if (vibeBass > 200)
    port.write('A'); 
  else if (vibeBass >100 && vibeBass <200)
    port.write('B'); 
  else if (vibeBass >90 && vibeBass <100)
    port.write('C'); 
  else if (vibeBass >80 && vibeBass <90)
    port.write('D');
  else if (vibeBass >70 && vibeBass <80)
    port.write('E');
  else if (vibeBass >60 && vibeBass <70)
    port.write('F');
  else if (vibeBass >50 && vibeBass <60)
    port.write('G');
  else if (vibeBass >40 && vibeBass <50)
    port.write('H'); 
  else if (vibeBass >20 && vibeBass <30)
    port.write('I'); 
  else if (vibeBass >10 && vibeBass <20)
    port.write('J');
  else if (vibeBass >5 && vibeBass <10)
    port.write('K');
  else if (vibeBass >1 && vibeBass <5)
    port.write('L');
  else if (vibeBass >0.1 && vibeBass <1)
    port.write('M');
  else if (vibeBass <0.1)
    port.write('N');

} 
  
  // VIBRATION GUITAR -----------------------------------------------------------------------------------------------------------

if (chitarra == true){

  
  
  
  
  if (vibeGuitar > 300)
    port.write('A'); 
  else if (vibeGuitar >150 && vibeGuitar <300)
    port.write('B'); 
  else if (vibeGuitar >120 && vibeGuitar <150)
    port.write('C'); 
  else if (vibeGuitar >100 && vibeGuitar <120)
    port.write('D');
  else if (vibeGuitar >70 && vibeGuitar <100)
    port.write('E');
  else if (vibeGuitar >60 && vibeGuitar <70)
    port.write('F');
  else if (vibeGuitar >50 && vibeGuitar <60)
    port.write('G');
  else if (vibeGuitar >40 && vibeGuitar <50)
    port.write('H'); 
  else if (vibeGuitar >20 && vibeGuitar <30)
    port.write('I'); 
  else if (vibeGuitar >10 && vibeGuitar <20)
    port.write('J');
  else if (vibeGuitar >5 && vibeGuitar <10)
    port.write('K');
  else if (vibeGuitar >1 && vibeGuitar <5)
    port.write('L');
  else if (vibeGuitar >0.1 && vibeGuitar <1)
    port.write('M');
  else if (vibeGuitar <0.1)
    port.write('N');

} 
  
// VIBRATION KICK -----------------------------------------------------------------------------------------------------------
if (cassa == true){
  
  muto = false;
  
  if (vibeKick > 200)
    port.write('A'); 
  else if (vibeKick >100 && vibeKick <200)
    port.write('B'); 
  else if (vibeKick >90 && vibeKick <100)
    port.write('C'); 
  else if (vibeKick >80 && vibeKick <90)
    port.write('D');
  else if (vibeKick >70 && vibeKick<80)
    port.write('E');
  else if (vibeKick >60 && vibeKick <70)
    port.write('F');
  else if (vibeKick >50 && vibeKick <60)
    port.write('G');
  else if (vibeKick>40 && vibeKick <50)
    port.write('H'); 
  else if (vibeKick >20 && vibeKick <30)
    port.write('I'); 
  else if (vibeKick >10 && vibeKick <20)
    port.write('J');
  else if (vibeKick >5 && vibeKick<10)
    port.write('K');
  else if (vibeKick >1 && vibeKick <5)
    port.write('L');
  else if (vibeKick >0.1 && vibeKick <1)
    port.write('M');
  else if (vibeKick <0.1)
    port.write('N');

}  
  
  // VIBRATION PAN -----------------------------------------------------------------------------------------------------------
if (rullante == true){
  
  
  if (vibePan > 200)
    port.write('A'); 
  else if (vibePan  >100 && vibePan  <200)
    port.write('B'); 
  else if (vibePan  >90 && vibePan  <100)
    port.write('C'); 
  else if (vibePan  >80 && vibePan  <90)
    port.write('D');
  else if (vibePan  >70 && vibePan  <80)
    port.write('E');
  else if (vibePan  >60 && vibePan  <70)
    port.write('F');
  else if (vibePan  >50 && vibePan  <60)
    port.write('G');
  else if (vibePan  >40 && vibePan  <50)
    port.write('H'); 
  else if (vibePan  >20 && vibePan  <30)
    port.write('I'); 
  else if (vibePan  >10 && vibePan  <20)
    port.write('J');
  else if (vibePan  >5 && vibePan  <10)
    port.write('K');
  else if (vibePan  >1 && vibePan  <5)
    port.write('L');
  else if (vibePan  >0.1 && vibePan  <1)
    port.write('M');
  else if (vibePan  <0.1)
    port.write('N');
}  

println(vibePan);

 // VIBRATION TOTALE -----------------------------------------------------------------------------------------------------------
if (rullante == false && basso == false && chitarra == false && cassa == false){

  
  
  if (vibe > 200)
      port.write('A'); 
    else if (vibe >100 && vibe <200)
      port.write('B'); 
    else if (vibe >90 && vibe <100)
      port.write('C'); 
    else if (vibe >80 && vibe <90)
      port.write('D');
    else if (vibe >70 && vibe <80)
      port.write('E');
    else if (vibe >60 && vibe <70)
      port.write('F');
    else if (vibe >50 && vibe <60)
      port.write('G');
    else if (vibe >40 && vibe <50)
      port.write('H');
    else if (vibe >20 && vibe <30)
      port.write('I'); 
    else if (vibe >10 && vibe <20)
      port.write('J');
    else if (vibe >5 && vibe <10)
      port.write('K');
    else if (vibe >1 && vibe <5)
      port.write('L');
    else if (vibe >0.1 && vibe <1)
      port.write('M');
    else if (vibe <0.1)
      port.write('N');
  
}
  
  //println(vibe);
  gui();
  
}



//VIDEO BG

void movieEvent(Movie m) {
  m.read();
}

void controlEvent(ControlEvent theEvent) {
  if(theEvent.isFrom(r1)) {
    if (theEvent.getGroup().getValue() == 1.0) { basso = true; } else { basso = false; }
    if (theEvent.getGroup().getValue() == 2.0) { chitarra = true; } else { chitarra = false; }
    if (theEvent.getGroup().getValue() == 3.0) { cassa = true; } else { cassa = false; }
    if (theEvent.getGroup().getValue() == 4.0) { rullante = true; } else { rullante = false; }
    // if (theEvent.getGroup().getValue() == 5.0) { muto = true; } else { muto = false; }
  }
}




// VIBRATION TOTAL-----------------------------------------------------------------------------------------------------------
//if (basso == false && chitarra==false && basso==false && cassa==false && rullante==false){



//}


//void keyPressed() {
//  if (key == '1') port.write('A');
//  else if (key =='2') port.write('B'); 
//  else if (key =='0') port.write('C');
//}


//void stop() {
//  kick.close();
//  minim.stop(); 
//  super.stop();
//}