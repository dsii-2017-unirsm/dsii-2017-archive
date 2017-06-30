// Demo for educational purpose, course DSII 2016 @ UniRSM
// Mod by @Fupete for @MCSotgiu project, MIT License 2016
// Based on official search_twitter_new demo by Temboo
// 
// Built Using Temboo 
// Originally based off of Temboo Examples at:
//   https://temboo.com/processing/display-tweet
//   https://temboo.com/library/Library/Twitter/Search/Tweets/
//
// Originally based on Twitter Search Demo Using Temboo by Ben Grosser
// Originally written for ARTS 444: Computational Art at UIUC

import processing.serial.*;  //collegamento per arduino
Serial port; 

import com.temboo.core.*; //importazione libreria temboo
import com.temboo.Library.Twitter.Search.*;

  //--------------------------credenziali account temboo collegamento a twitter-----------------------------//
TembooSession session = new TembooSession("unirsmdesign", "myFirstApp", "ifVw5uRYZ1gHyYrOQJUxmxf76YZ1URxS");
Tweets twitterSearch;
TweetsResultSet tweetsResults;

String lastID = "0";

String APIkey = "K676bpv7iuXptRiHpZHUWnzVN";
String APISecret = "hNHrF03hjMIjWBvJCun8uE3ZHmKLsTrljVWxQnMguWQlLVSchL";
String accessToken = "56955956-grzHOdy1d0QwP9CQfrPdBdtR63iTYnIcvbY0TTrUe";
String accessTokenSecret = "nxYZqTMeWXpZ2OKzqRZlt3IBOuwHLsTPJMm1NuSWy8cTy";

int quale; //id di quale parola
int in=0; //contatore per visualizzare risultati
int i;
ArrayList ricerca = new ArrayList(); //array per la ricerca e crea lista
StringList parole = new StringList("dolore", "amore", "morte"); //ricerca queste parole 
StringList parole_lastID = new StringList();

ArrayList<tweetEmozione> emozione;
float cRotaz = 0, cZoom = 0, cHigh = 0;
String visualizza_testo = "";  //visualizza testo tweet
int visualizza_fw; //visualizza dati follower
int visualizza_rt; //visualizza dati retweet
String visualizza_data;  //visualizza dati data tweet
String visualizza_ora;  //visualizza dati ora tweet
int visto;

int gradoTweetMassimo=900; // grado massimo di estrazione valore tweet per movimento motore
int gradoTweetMinimo=250; // grado minimo di estrazione valore tweet per movimento motore
int ResetLoad=100; // timer riciclo

 //--------------------------void setup-----------------------------//
void setup() {
  println(Serial.list()); //scegliere la porta per il collegamento ad arduino
  port = new Serial(this, Serial.list()[2], 9600); //selezione della porta 2
    
  pixelDensity(displayDensity()); //qualità della visualizzazione
  size(650, 650);
  noSmooth();
  background(255);
  fill(0);
  textSize(50);
  textAlign(LEFT);

  setupTwitterSearch();

  for (int j=0; j<parole.size(); j++) {
    parole_lastID.set(j, "0");
  }
  emozione = new ArrayList();
}

int tempo=0;

 //--------------------------void draw-----------------------------//
void draw() {
  println(parole.get(quale), visualizza_fw); //stampa parola selezionata e dato fw
  tempo++;
  if (tempo>ResetLoad) {
    tempo=0;
    vai();
  }

  background(255);

  //-----------------------------------loading iniziale-----------------------------//
  pushStyle();
  textAlign(CENTER);
  fill(0);
  textSize(30);
  text("loading...", width/2, height/2);      
  popStyle();

  if (ricerca.size()>0) {//se ci sono tweet nei risultati

    background(255);
    fill(255);
    noStroke();
    rect(20, height-130, width-70, (height/6)-30);

    pushMatrix();
    translate(width/2, height/2+cHigh, cZoom);
    rotateY(cRotaz);

    if (keyPressed && key=='w') {
      cHigh =  map(mouseY, 0, height, -500, 500);
    }

    if (emozione.size()>0) {
      for (int i=0; i<emozione.size(); i++) {
        emozione.get(i).display();
        if (i==visto) {
          emozione.get(i).vista = true;
          visualizza_testo = emozione.get(i).testo;
          visualizza_fw = emozione.get(i).fw;
          visualizza_rt = emozione.get(i).rt;
          // visualizza_name = emozione.get(i).name;

          visualizza_data = emozione.get(i).data;
          visualizza_ora = emozione.get(i).ora;
        } else {
          emozione.get(i).vista = false;
        }
      }
    }
    popMatrix();
    
    //-----------------------------------range grado min max tweet-----------------------------//
    float mx = constrain(visualizza_fw, gradoTweetMinimo, gradoTweetMassimo);
    if (mx>gradoTweetMinimo) {
      port.write('H');     
       println("H");
    } else {
      port.write('L');     
         println("L");
    }
    
    //-----------------------------------testo-----------------------------//
    fill(255);
    textSize(20);
    fill(0);
    textSize(14);
    text("ricerca parola — " + parole.get(quale), 20, 60);
    text("data e ora — " + visualizza_data + "h" + visualizza_ora, 20, 80);
    text("numero retweet — " + visualizza_fw, 20, 100);
    text("followers — " + visualizza_rt, 20, 120);
    text("testo tweet — " + " \n" + visualizza_testo, 20, 140, width/3, height/2);
  }
}

    //-----------------------------------void vai-----------------------------//
void vai() {
  // cerca una parola a caso dalla lista parole, cerca gli ultimi 100 risultati
  background(255);
  quale=int(random(parole.size()));

  cerca(parole.get(quale), 100, parole_lastID.get(quale)); //selezioni numero dati da analizzare
  parole_lastID.set(quale, lastID);
  in=0; 

  Generaemozione();
}

 //-----------------------------------void generazione emozione-----------------------------//
void Generaemozione() {
  if (emozione.size() > 0) {
    emozione.clear();
  } else if  (ricerca.size() > 0) {
    for (int i=0; i<ricerca.size(); i++) {
      //tweetEmozione(int id_, int fw_, int rt_, String testo_, String data_) 
      String testoIntero = ricerca.get(i).toString(); 
      String[] testo = testoIntero.split(" — ");    
      emozione.add(new tweetEmozione(i, int(testo[2]), int(testo[3]), testo[0], testo[1]));
    }
  }
}

    //-----------------------------------void ricerca parola-----------------------------//
void cerca(String parola, int quante, String ultimo_id) {
  ricerca = getTweetsResults(parola, quante, ultimo_id);
  reportSearchesRemaining();
}

ArrayList getTweetsResults(String q, int t, String ii) {
  twitterSearch.setQuery(q); 
  twitterSearch.setCount(t);

  // setSinceId dice di ricevere solo tweets DAL ultimo ID
  //twitterSearch.setSinceId(lastID);
  twitterSearch.setSinceId(ii);

  tweetsResults = twitterSearch.run();
  JSONObject searchResults = parseJSONObject(tweetsResults.getResponse());
  JSONArray statuses = searchResults.getJSONArray("statuses"); // Crea un array JSON degli stati di Twitter nell'oggetto

  JSONObject tweets, user;

  try {
    tweets = statuses.getJSONObject(0); //Prendi il primo tweet e lo metti in un oggetto JSON
  } 
  catch (Exception e) {
    tweets = null;
  }

  ArrayList results = new ArrayList();

  if (tweets != null) {
    // prendi l'ultimo ID dell'ultimo tweet elaborato (in ordine inverso,
    // quindi vogliamo indice 0). Questo viene utilizzato nella ricerca NEXT per garantire
    // non abbiamo i tweet che abbiamo già visto
    lastID = statuses.getJSONObject(0).getString("id_str");

    for (int i = 0; i < statuses.size(); i++) {
      String tweetText = statuses.getJSONObject(i).getString("text");
      String tweetDate = statuses.getJSONObject(i).getString("created_at");
      String friendsCount = str(statuses.getJSONObject(i).getJSONObject("user").getInt("friends_count"));
      String reTweet = str(statuses.getJSONObject(i).getInt("retweet_count"));
      results.add(tweetText + " — " + tweetDate + " — " + friendsCount + " — " + reTweet);
    }
  }
  return results;
}  

void reportSearchesRemaining() {
  println("You have "+tweetsResults.getRemaining()+" searches remaining today.");
}

void setupTwitterSearch() {
  // Crea l'oggetto Choreo usando la sessione Temboo
  twitterSearch = new Tweets(session);

  // Set inputs
  twitterSearch.setAccessToken(accessToken);
  twitterSearch.setAccessTokenSecret(accessTokenSecret);
  twitterSearch.setConsumerSecret(APISecret);
  twitterSearch.setConsumerKey(APIkey);
}