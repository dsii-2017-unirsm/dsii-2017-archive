## The flow towards Europe, 2015, Lucify  [+](https://www.lucify.com/the-flow-towards-europe/)<br><br>
![gdocP5](http://i.imgur.com/y6KEAtr.jpg)<br><br>

***

**What is - cosa è?**     
     
The flow towards Europe (2015, Lucify) è una mappa interattiva open source che mostra agli utenti il flusso migranti 
in Europa a partire dal 2012. Pare che l'idea sia nata a pranzo, durante una discussione tra progettisti finlandesi 
convenuti ad un seminario di visualizzazione dei dati: partendo dall'intuizione che ogni rifugiato poteva essere rappresentato 
come un punto in movimento su una mappa,  Juho Ojala, Ville Saarinen e Ville Väänänen (fondatori di Lucify ) hanno deciso 
di rendere visibile, in maniera semplice e intuitiva, l’inquietante crescita esponenziale del flusso di rifugiati 
e richiedenti asilo in Europa. Per fare questo hanno utilizzato i dati pubblicati dall'Agenzia delle Nazioni Unite 
per i Rifugiati (UNHCR). 
Dopo aver costruito un concept di prova rapido, la visualizzazione ha mostrato la grandezza dei numeri, imprimendole un particolare significato visivo. Il nucleo del progetto è una mappa interattiva che mostra agli utenti il “flusso” dei migranti e richiedenti asilo dalle proprie terre d’origine i paesi europei.  Nel complesso vengono rappresentati tre grafici:  il primo rappresenta il fenomeno migratorio nel corso degli anni; il secondo rappresenta i richiedenti di asilo a livello mensile; il terzo rappresenta il numero dei profughi siriani in Europa e nel mondo, quantificati in campi da calcio.

***

**How it work - come funziona?**   
      
Il sito del progetto “The flow towards Europe”  [+](https://www.lucify.com/the-flow-towards-europe/)
è realizzato tramite React, D3.js e Pixi.js. La mappa interattiva - a consultazione avvenuta in data 
27.04.2017 – attesta (al momento) un aggiornamento in data 12.04.2017 ad opera di Ville Saarinen e Juho Ojala. 
Lo stesso sito attesta espressamente che le informazioni mostrate sono basate sui dati pubblicati dall'Agenzia 
delle Nazioni Unite per i Rifugiati (UNHCR) e che la visualizzazione è progettata per fornire una comprensione intuitiva 
della dimensione del problema, mentre percorsi o tempi di viaggio non sono stati curati.   

Il sito fornisce direttamente anche le “Istruzioni” per la fruizione delle mappe interattive.     

La prima mappa (cartina coi confini dei paesi dell’Europa, dell’Africa e dell’Asia interessati al fenomeno migratorio) 
mostra – nel tempo -  il flusso dei richiedenti asilo dai paesi di origine ai paesi europei. I flussi migratori 
sono rappresentati graficamente mediante punti in movimento sulla mappa. Ogni punto in movimento rappresenta 25 persone,
ossia – come specifica il portale -  il pieno carico di un pullman a 25 posti.  Sopra la mappa è posizionata una time line 
che va dal 01.01.2012 al 31.01.2017 e un tasto in alto consente di aumentarne la velocità di scorrimento.
E’ anche possibile spostare il cursore sopra i vari Paesi per mostrare i dettagli dei flussi, e fare clic su ogni 
Paese per bloccare la selezione. I conteggi mostrati rappresentano il numero di persone che hanno lasciato o sono arrivati 
in un determinato paese dal 01.01.2012 al 31.01.2017. Posizionando il mouse su un singolo Stato si possono contemporaneamente 
vedere –  riferiti alla data indicata dalla line-time: il numero complessivo di rifugiati presenti in quel Paese; la diversa 
provenienza dei rifugiati, ognuno riportante la cifra di persone che hanno abbandonato il proprio paese (cifra preceduta dal segno meno) rappresentato con il colore  viola, più o meno intenso a seconda della densità di emigrati; i paesi verso i quali cittadini della nazione in esame sono a loro volta emigrati con il relativo numero, rappresentati con il colore verde,  più o meno intenso a seconda della densità del flusso. Nella mappa non è presente una legenda con il significato dei due colori viola e verde, che comunque risultano facilmente intuibili.
La tabella che segue (Country  by country) mostra i richiedenti asilo mensili totali, provenienti da e richiedenti  asilo in diversi paesi. Un apposito  tasto consente di spostare il grafico nel tempo. E’ possibile spostare il cursore sopra i vari Paesi per mostrare i dettagli. I dati “paese per paese” sono rappresentati secondo uno schema di tipo “alluvionale”. Il grafico risulta aggiornato a Gennaio 2017, ma viene specificato che mancano i dati da Finlandia, Francia, Regno Unito, Grecia, Ungheria e Italia.
L’ultima tabella (profughi siriani)  attesta che secondo l’ONU quasi un milione di loro hanno cercato asilo in Europa tra aprile 2011 e ottobre 2016. In piedi in modo molto stretto, il loro numero si adatterebbe a 13 campi da calcio. Tuttavia, solo una frazione di loro migra in Europa: infatti l'ONU ha registrato più di cinque milioni di profughi siriani in Turchia, Libano, Giordania, Iraq, Egitto e Nord Africa. La maggior parte di loro vive nei campi profughi vicino al confine e il loro numero si adatterebbe a 71 campi di calcio.
Tutte e tre le tabelle si basano sui report forniti dall’UNHCR e si sviluppano su 3 cardini: il tempo, il paese di provenienza e il paese di accoglienza.  

***      

**What does it mean - cosa significa?**   

Il progetto mira a fornire una visualizzazione immediata ed intuitiva del problema e ha un taglio “demografico”, in quanto i numeri si concentrano sul cambiamento della popolazione.  
Di primo acchito si potrebbe pensare che il significato di questo progetto sia essenzialmente quello di mettere in luce la grandezza,
e quindi la gravità, del problema relativo ai flussi migratori in Europa, posto che l’ultima crisi di una portata 
del genere risale alla Seconda Guerra Mondiale. Attraverso la visualizzazione dei dati in continua crescita, 
la percezione immediata dell’utente è quella di trovarsi in piena crisi umanitaria. 
A tale proposito la giornalista italiana Maura Bertanzon ha scritto 
(15 dicembre 2015 – Corriere della Sera) [+](http://www.corriere.it/datablog/migranti/i-numeri/scheda-2.shtml?refresh_ce-cp:) 
“(…) Ma a dare una percezione spazio-temporale del movimento ci pensa questa mappa, realizzata dal finlandese Ville Saarinen per il sito Lucify.com, che mette insieme in modo dinamico i dati dell’Unhcr (…) una mappa così aiuta a stare con gli occhi fissi sulla realtà, per fare la giusta tara alle parole «invasione» e «gestione dell’emergenza». (…) Se le altre nazioni europee dovessero adeguare la propria capacità di accoglienza in proporzione alle proiezioni della Germania e alla propria popolazione, l’Italia dovrebbe accogliere 600 mila richieste, aveva calcolato il Guardian. Altro che ripartizione verso gli altri Stati. Vogliono farci vedere il livello di immigrazione, di cui molte volte sentiamo solamente parlare o vediamo dei numeri ma non ci rendiamo conto di cosa realmente succede. Ciò è possibile da individuare e capire attraverso dei grafici interattivi come questi.”
Occorre – comunque - tenere a mente che il progetto di Lucify – per sua stessa esplicita ammissione – si limita a raccontarci i flussi migratori in chiave meramente demografica. Non è, quindi, condivisibile – a mio avviso – il parere di chi ritiene che questa mappa consenta di comprendere pienamente la vastità del fenomeno. Per contro – e vista la conclusione a cui è giunta la  giornalista del Corriere della Sera – trovo preoccupante un possibile significato nascosto di questo progetto, ossia quello che induce a credere che paesi come l’Italia –  solo sulla base della rappresentazione grafica in oggetto – debbano parametrare la propria capacità di accoglienza alle proiezioni di altri paesi europei “virtuosi” ma che – in realtà- sono dotati di un’organizzazione politica ed economica molto più forte (un particolare che dall’infografica non si può evincere).

***
     
**What if - cosa succederebbe se?**   
    
Nel caso in esame la mappa è stata congegnata per fornire all’utente una comprensione intuitiva del problema, pertanto si basa sui dati “quantitativi” dei flussi migratori, senza poter tenere conto delle componenti antropologiche, politiche ed economiche del fenomeno.
Cosa succederebbe se, ad esempio, i percorsi o i tempi di viaggio dei migranti (che il sito in esame attesta espressamente di non avere curato) venissero rappresentati con un’apposita infografica, magari espressa in “gommoni” o  “carrette del mare”?  Sicuramente in questa nuova mappa, i dati numerici di Paesi europei che attualmente sono meta degli sbarchi di massa (ad esempio l’Italia)  attesterebbero una capacità di accoglienza di gran lunga superiore rispetto ad altri Paesi europei che, secondo l’attuale mappa, risultano  “virtuosi”.
Cosa succederebbe – poi - se nel  grafico “Country by country” - ove è espressamente specificato che mancano i dati da Finlandia, Francia, Regno Unito, Grecia, Ungheria e Italia – tali dati fossero presenti? In particolare, mancano i dati di due Stati europei (l’Italia e la Grecia) che negli ultimi tempi sono stati meta di importanti flussi migratori (area del Mediterraneo), per cui è logico domandarsi che interesse ha Lucify a produrre ugualmente l’infografica senza tali dati (v. Gennaio 2017).  Verrebbe spontaneo pensare che, a qualche altro Stato europeo, poiché “virtuoso” secondo l’attuale mappa, possa giovare il suo mantenimento a oltranza. 
Cosa succederebbe - infine - se i dati estrapolati da Lucify per la sua mappa interattiva non si basassero realmente sui dati contenuti nelle “population statistics” pubblicate on line dall’ UNHCR [+](http://popstats.unhcr.org/en/demographics)? Peraltro Lucify, pur fornendo numerose informazioni riguardo alle proprie infografiche, omette di dirci con quale criterio discrimina tra la miriade di dati forniti dall’UNHCR.

------------

**RIFERIMENTI**
     
•	*Infografica interattiva degli spostamenti delle persone che migrano;
da dove vengono e dove vanno* (aggiornato al 2007) [+](http://migrationsmap.net/#/CAF/arrivals)
![gdocP5](http://i.imgur.com/UoOaF50.jpg)<br>    


•	*Infografica sugli emigrati negli Stati Uniti dal 1820 al 2013* [+](http://metrocosm.com/us-immigration-history-map.html)  
![gdocP5](http://i.imgur.com/xoB2qLX.png)<br>   
La mappa interattiva visualizza tutti coloro che si sono spostati dal loro paese di origine per andare o venire dall’America. 
La luminosità di un paese corrisponde al suo totale di migrazione negli Stati Uniti in un determinato momento.

•	*Infografica sui flussi migratori in tutto il mondo* [+](http://peoplemov.in/#f_BE) 
![gdocP5](http://i.imgur.com/2Er6WAs.png)<br>
La mappa mostra l'immigrazione stimata (afflussi) per origine e paese di destinazione tra il 2010 e il 2015.
I cerchi blu rappresentano i flussi di immigranti in entrata, mentre i cerchi rossi rappresentano i deflussi di emigrati. Ogni punto giallo rappresenta 1.000 persone. Se viene passato il mouse sopra un cerchio è possibile vedere gli spostamenti migratori totali di quel paese tra il 2010 e il 2015. Se si clicca su un cerchio (o si preme due volte sul cellulare) è possibile visualizzare i flussi di emigranti all’interno ed esterno di quel paese.

•	*Installazione con salvagente - Ai Weiwei* [+](http://metrocosm.com/global-immigration-map/)
![gdocP5](http://i.imgur.com/YaLxPGd.jpg)<br>
Migliaia di giubbotti di salvataggio utilizzati dai migranti tratti in salvo nell'isola greca di Lesbo: così l'artista cinese Ai Weiwei ha reso omaggio ai profughi che rischiano la vita ogni giorno per arrivare in Europa in un'installazione realizzata a Berlino. I giubbotti arancioni - 14mila in tutto - sono stati avvolti intorno alle colonne della Konzerthaus (sala concerti) nella capitale tedesca. 
