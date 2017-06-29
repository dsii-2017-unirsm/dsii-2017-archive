// Inspirational Ghost demo by MorenaUgulini 
// original concept by MorenaUgulini 

// 2017 © Daniele @Fupete and the course DSII2017 @UniRSM  
// https://github.com/morenaugulini — github.com/dsii-2017-unirsm
// Educational purposes, MIT License, 2017, San Marino

// --- 

// Credits to Zach Spitulski, UCLA Version 0.3, "photoCOLLAGE"



PImage[] images = new PImage[6];
int caso;
int dove;

//int N = 10; // numero immagini all'interno delle cartelle


void setup() {

  String[] dirdata = new String[3];   //righe= cartelle 
  dirdata[0] = "data1";
  dirdata[1] = "data2";
  dirdata[2] = "data3";  


String pathGlobal = dataPath(""); //percorso globale per entrare nella cartella data
println(pathGlobal); //mi stampa il percorso per arrivare alla cartella data

String[][] filedata = new String[dirdata.length][]; //array multidimensionali/ matrice - tabella ordinata di elementi 

if ( !doesFolderExist(pathGlobal) ) { //!(logica NOT)in processing il punto esclamativo è la negazione
println ("non esiste la cartella data");
exit();
      
} else {

  for (int i = 0; i < dirdata.length; i++) {  //mi prende una cartella per volta (dirdata)   
//println ("Esiste la cartella " + dirdata[i]);


File dir = new File( pathGlobal + "/" + dirdata[i]); 
//crea un nuovo file con il percorso globale/il nome della cartella data1 - ecc a seconda del ciclo

//println ("dir " + dir + "\n");  //\n serve nel print per andare a capo
      
File[] namesFiles = dir.listFiles();

if (namesFiles == null) { // < non ci sono file nella cartella
println("no file found"); 
exit();
      
} else {

filedata[i] = new String[namesFiles.length]; //colonna cartella + nome cartella = nuova stringa con i nomi dei file
for (int j = 0; j < namesFiles.length; j++) {
    
//if (fileIsOK(namesFiles[j].getAbsolutePath() )) { // se è un tipo di file png o jpg
        
String filename = namesFiles[j].getAbsolutePath(); // trova il nome e path 
filedata[i][j] = filename; //colonna cartella
          
//println(filedata[i][j]);
        
//} else {
//println ("skipped " + namesFiles[j]); // < non è un file png o jpg
//}
             
} // end for               
 } // end if
  } // end for
   }
      
  size(800,800);
  smooth();
  frameRate(50);
  noStroke();
 
  String[] seiImgs = new String[6]; //vettore dove mettero le directory delle immagini con cui fare collage

  //String[] dirdata1 = new String[N];//vettore che cointiene le directory di ogni immagine della cartella data1(per il momento ancora vuoto)
  //String[] dirdata2 = new String[N];
  //String[] dirdata3 = new String[N];

  //for (int i = 0; i < N; i++) {
    //dirdata1[i]= "data1/disegno_00" + i + ".png"; // riempimento vettori dirdata con directory
    //dirdata2[i]= "data2/disegno_00" + i + ".png";
    //dirdata3[i]= "data3/disegno_00" + i + ".png";
  //}

  scegliDue(filedata[0], 0, 1, seiImgs); //scegliamo da dirdata1 due percorsi a caso con la funzione sceglidue, e le immettiamo nei posto 0 e 1 di seiImgs
  scegliDue(filedata[1], 2, 3, seiImgs);
  scegliDue(filedata[2], 4, 5, seiImgs);
 
  for(int i=0; i<seiImgs.length;i++) {
    
    println(seiImgs[i]);
    images[i] = loadImage(seiImgs[i]);  
  }
}


void draw() {  
  
  // Randomly Pick Image + Properties
  for (int i = 0; i < 500; i++){
    float imageRotation = random(-90,90);
    float imageX = random(0,800);
    float imageY = random(0,700);
    float imageScaleWidth = random(60,250);
    float imageScaleHeight = imageScaleWidth*1.08;
   
  
    // Disegna, ruota + scala immagine
    imageMode(CENTER);
    pushMatrix();
    translate(imageX, imageY);
    rotate(radians(imageRotation));
    //filter(BLUR,.6); serve per fare la sfocatura
    dove = int(random(6));
    image(images[dove], 0, 0, imageScaleWidth, imageScaleHeight);
    
    popMatrix();
 }
 
 save("output.png");
 exit();
}




void scegliDue(String[] dir, int idA, int idB, String[] seiImgs ) {
  int dado1 =(int)random(dir.length); // < il primo file è uno a caso della directory
  seiImgs[idA] = dir[dado1]; // < lo mettiamo nel posto idA del nostro array
  int dado2 = (int)random(dir.length); // il secondo file è più complicato, perché deve essere uno a caso ma non il primo già estratto magari...
  while (dado1 == dado2) { // < quindi se è uscito lo stesso numero, la stessa faccia del dado... continuiamo ad estrarre finché non è diverso! :-)
    dado2 = (int)random(dir.length);
  }
  //seiImgs[idB] = dir[(int)random(dir.length)]; // < lo mettiamo nel posto idB del nostro array !!!! ci va dado2 non un altro random, poichè non siamo sicuri che sia diverso da dado1
    seiImgs[idB] = dir[dado2];
}


boolean doesFolderExist(String strPath) { // < è VERO se esiste la cartella
  File folderPath = new File (strPath);
  boolean Buffer = folderPath.exists();
  folderPath = null; 
  return ( Buffer ); //buffer può esistere o non esistere / vero o falso
}

/*
boolean fileIsOK (String name) { // < è vero se è un file PNG

  if (name==null) { 
    return false; // not ok
  }

  name=trim(name);
  
  if (name.equals("")) return false;  
  if (name.substring (  name.length()-4 ).equals (".PNG")  ) return true; 
  if (name.substring (  name.length()-4 ).equals (".png")  ) return true; 
  if (name.substring (  name.length()-4 ).equals (".JPG")  ) return true;
  if (name.substring (  name.length()-4 ).equals (".jpg")  ) return true;
  // quando l'estensione non è corretta  
  return false;
}
*/
