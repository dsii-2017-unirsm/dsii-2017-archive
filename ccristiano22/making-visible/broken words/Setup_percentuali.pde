
// set percentuali

public void percentuali() {
  ////// ciclo percentuale dislessia //////
  // 0 valore della percentuale , modifica la lettera
  // 1 valore della parte restante , non modificare la lettera 
  float r = 0;

  for (int i=lunghezzaTesto; i<10000; i++ ) {
    r= random(100);
    if (r>percentuale) {
      percentualeLettere[i]=0;
    } else {  
      percentualeLettere[i]=1;
    }
  }
  for (int i=lunghezzaTesto; i<10000; i++ ) {
    r= random(100);
    if (r>percentuale2) {
      percentualeLettere2[i]=0;
    } else {  
      percentualeLettere2[i]=1;
    }
  }
  for (int i=lunghezzaTesto; i<10000; i++ ) {
    r= random(100);
    if (r>percentuale3) {
      percentualeLettere3[i]=0;
    } else {  
      percentualeLettere3[i]=1;
    }
  }
  for (int i=lunghezzaTesto; i<10000; i++ ) {
    r= random(100);
    if (r>percentuale4) {
      percentualeLettere4[i]=0;
    } else {  
      percentualeLettere4[i]=1;
    }
  }
  for (int i=lunghezzaTesto; i<10000; i++ ) {
    r= random(100);
    if (r>percentuale5) {
      percentualeLettere5[i]=0;
    } else {  
      percentualeLettere5[i]=1;
    }
  }
  for (int i=lunghezzaTesto; i<10000; i++ ) {
    r= random(100);
    if (r>percentuale6) {
      percentualeLettere6[i]=0;
    } else {  
      percentualeLettere6[i]=1;
    }
  }
  for (int i=lunghezzaTesto; i<10000; i++ ) {
    r= random(100);
    if (r>percentuale7) {
      percentualeLettere7[i]=0;
    } else {  
      percentualeLettere7[i]=1;
    }
  }
  for (int i=lunghezzaTesto; i<10000; i++ ) {
    r= random(100);
    if (r>percentuale8) {
      percentualeLettere8[i]=0;
    } else {  
      percentualeLettere8[i]=1;
    }
  }
}