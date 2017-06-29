//stampa
public void bang() {
  record = true;
  println("stampa foglio");
}
//funzione stampa
void stampa() {
  if (record == true) {
    beginRecord(PDF, "DSA.pdf");
    println("ho stampato il foglio");
    background(125);
    tbox.display();
    setupGUI();
    if (record == true) {
      endRecord();
      record = false;
      println("fine stampa");
    }
  }
}
//carica testo
public void loadString1() {
  load1 = true;
}
public void loadString2() {
  load2 = true;
}
public void loadString3() {
  load3 = true;
}
//carica font
public void fInconsolata() {
  font0 = true;
}
public void fGeorgia() {
  font1 = true;
}
public void fHelvetica() {
  font2 = true;
}
public void fCourier() {
  font3 = true;
  println("Courier");
}
public void resetString() {
  setup();
  draw();
}