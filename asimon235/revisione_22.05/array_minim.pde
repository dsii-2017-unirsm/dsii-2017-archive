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


void setup() {
  size(512, 200, P3D);

  minim = new Minim(this);
  player[0] = minim.loadFile("data/cat.mp3"); //carico file da percorso
  player[1] = minim.loadFile("data/ear.mp3");
  player[2] = minim.loadFile("data/duck.mp3");
  player[3] = minim.loadFile("data/rooster.mp3");


  player[count].play();

  fft=new FFT(player[count].bufferSize(), player[count].sampleRate());
}

void draw()
{
  if(!player[count].isPlaying())
  {
    count++;
    if(count>3)count=0;
    player[count].play();   
  }
  
  float posx = map(count.position(), 0, count.length(), 0, width);
  stroke(0,200,0);
  line(posx, 0, posx, height);
  
  stroke(255);
  text("Press f to skip forward and r to skip backward.", 10, 20);
   
  /*
  fft.forward(player[count].mix);
  background(255);

  for (int i = 0; i < fftSize; i++)
  {
    float band = fft.getBand(i);
    float control,afactor=10;
    control=band*afactor;
    if(control>1023)control=1023;
   
      val=map(control, 0, 1023, 0, 255);
      val2=int(val);

      print("chanel ");
      print(i);
      print("  actual value ");
      print(val2);
      println();

      fill(0);
      ellipse(5+i*(width/8), height-val2, 10, 10);

      }
    line(0, height-255, width,height-255);*/

}

void keyPressed()
{
  if ( key == 'f' )
  {
    // skip forward 1 second (1000 milliseconds)
    groove.skip(1000);
  }
  if ( key == 'r' )
  {
    // skip backward 1 second (1000 milliseconds)
    groove.skip(-1000);
  }}
  
/*void stop()
{
  //player.close();
  //minim.stop();
 //super.stop();
}  */
