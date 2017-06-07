public void bang() {
  record = true;
  println("stampa foglio");
}

void stampa() {
  if (record == true) {
    beginRecord(PDF, "DSA.pdf");
    println("ho stampato il foglio");
    background(125);
    tbox.display();
    if (record == true) {
      endRecord();
      record = false;
      println("fine stampa");
    }
  }
}
