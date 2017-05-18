# CONCEPT FANTASIA   

Facoltà della mente umana di creare o rappresentare immagini o fatti, che traggono ispirazione dalla realtà anche discostandosene liberamente o di inventarne di irreali.   
“*La fantasia, rispetto all’invenzione alla creatività e all’immaginazione, è la facoltà più libera, essa infatti può anche non tener conto della realizzabilità o del funzionamento di ciò che ha pensato. È libera di pensare qualunque cose, anche la più assurda, incredibile, impossibile.”* Fantasia di Bruno Munari.   
Attraverso il disegno è possibile esprimere al meglio la fantasia, riuscendo a raffigurare le immagine che la nostra mente produce.   
I bambini attraverso i loro disegni modificano la realtà attraverso la fantasia, Picasso diceva *“A quattro anni dipingevo come Raffaello, poi ho impiegato una vita per imparare a dipingere come un bambino”*.    
Il progetto consiste nel trasformare la realtà attraverso gli occhi fantasiosi dei bambini.   
Utilizzando la videocamera del computer o creando un'istallazione con uno specchio sarà possibile visualizzare sullo schermo l’immagine modificata attraverso una serie di disegni fatti dai bambini.   
Lo specchio l'unico mezzo con il quale l'uomo impara a conoscere la propria immagina, infatti secondo gli studi di Jacques Lacan, lo specchio è il primo elemento che aiuta il bambino nella formazione dell'Io. 
Riconoscere come se stessi l'immagine di sé riflessa in uno specchio è una capacità che posseggono solo alcune specie biologiche, tra cui l'uomo, alcuni altri mammiferi.   
Il progetto dunque consiste nel modificare ed alterare questa percezione, attraverso una raccolta di disegni realizzati da bambini.

![gdocP5](http://i.imgur.com/HvlKjSd.png)

## Mind map

![gdocP5](http://i.imgur.com/vs29SVs.png)

## Dati

![gdocP5](http://i.imgur.com/0j5r5xh.png)  

Una banca dati di disegni dei bambini.

## Reference

### Cubist Mirror

![gdocP5](http://i.imgur.com/0hAC4f6.jpg)  

Cubist Mirror è stata la prima istallazione che esegue un'applicazione openFrameworks che applica in continuo una variante in tempo reale della tecnica di trasferimento dello stile ad una fotocamera.
Attraveso uno schermo LCD ed una fotacamera, l'utante poteva vedere la sua immagine modificata in tempo reale sttraverso lo stile di un quadro cubista.
Questa istallazione è stata realizzata da Gene Kogan nel Maggio del 2016 presso The School for Poetic Computation a New York.

[Gene Kogan - Cubist Mirror](https://github.com/genekogan/CubistMirror) 

### Prisma

![gdocP5](http://i.imgur.com/Oy3XFIr.jpg)  

Prisma è un’applicazione che modifica foto e video attraverso dei quadri.
Non è la prima applicazione che trasforma le foto in disegni o dipinti ma a differenza di altri programmi che applicano filtri alle foto, Prisma sfrutta una rete neurale artificiale: l’immagine, in sostanza, viene ricreata da capo, donandole un tocco di unicità. 
Il funzionamento è semplice: basta lanciare l’app, scattare una foto e scegliere il genere pittorico preferito: cubismo gotico (simile a Picasso), surrealismo alla Chagall, l’astrattismo di Kandinsky e così via.

### Teaching Machines to Draw

![gdocP5](http://i.imgur.com/prvavoW.png)  

Una macchina in grado di disegnare e generalizzare i concetti astratti in modo simile agli esseri umani.
Fornendogli una vasta serie di schizzi disegnati a mano la macchina capisce cosa si sta disegnando ed è in grado di riprodurlo.

### Smart Clothing Mirror

![gdocP5](http://i.imgur.com/wHz2dKT.jpg)

Utilizzando il brevetto dello studio Holition, un negozio di abbigliameto a San Francisco ha creato uno "specchio virtuale".   
[Studio Holition](https://holition.com/)   
[Articolo sul negozio](https://digitalscientists.com/services/internet-of-things/virtual-reality-and-augmented-reality)

### URME TWO WAY MIRROR

![gdocP5](http://i.imgur.com/r5XOjdE.jpg)

Un'installazione interattiva che scambia La faccia del designe con quella degli spettatori sostituendola digitalmente.   
[Leonardo Selvaggio](http://leoselvaggio.com/interactive-projects/)
 
### The “social” window display

![gdocP5](http://i.imgur.com/5sRCOZP.jpg)

Il progetto, in mostra al negozio ottico Playn, è composta da una parete cinetica di 12 singoli specchi rettangolari e una telecamera che utilizza un algoritmo di face-tracking per rilevare le facce dei passanti. Quando una persona interagisce con l'installazione, la parete di specchi segue e riproduce la direzione di movimento della loro faccia.   
[Inition](https://www.inition.co.uk/interactive-installations-inition-12-mirrors/)

## Progetto

Attraverso la raccolta dati di Algorithmia e l'uso del Deep Filter, che è un algoritmo che utilizza Deep Learning per creare filtri fotografici, ho iniziato a modificare delle mie immagini con i filtri predefiniti, ottendo dei risultati interessanti.

![gdocP5](https://media.giphy.com/media/DqoElGFysmWxa/giphy.gif)   
![gdocP5](https://media.giphy.com/media/nVGjUZgyhfdNm/giphy.gif)

[Deep Filter](https://algorithmia.com/algorithms/deeplearning/DeepFilter)   
[Reti neurali](https://harishnarayanan.org/writing/artistic-style-transfer/)

Su Processing sto iniziado a capire come caturare il video della webcam per renderlo uno specchio.

```

import processing.video.*;

Capture cam;

void setup() {
  size(640, 480);

  String[] cameras = Capture.list();

  if (cameras == null) {
    println("Failed to retrieve the list of available cameras, will try the default...");
    cam = new Capture(this, 640, 480);
  } if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    printArray(cameras);

    // Capire se la camera funziona e stampare il risulatato nella console
    
    cam = new Capture(this, cameras[0]);
    
    
    // inizio a prendere quello che vede la camera
    cam.start();
  }
}

void draw() {
  if (cam.available() == true) {
    cam.read();
  }
  // se la camera funziona allora esegui :
  
  
 pushMatrix();
translate(cam.width,0);
scale(-1,1); 
// mi serve per specchiare l'immagine

image(cam,0,0);
//riproduci la cam

popMatrix();



}
```


