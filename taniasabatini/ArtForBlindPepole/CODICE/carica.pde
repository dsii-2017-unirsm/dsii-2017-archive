void carica(String file) {

  clear();

  img=loadImage(file);
  img.loadPixels();

  W = img.width;
  H = img.height;
  println(W + " " + H);

  mesh = new float[W][H]; 

  for (int x = 0; x<W; x+=risoluzione) {
    for (int y = 0; y<H; y+=risoluzione) {
      float xx=x-img.width/2;
      float yy=y-img.height/2;

      // questo è il punto in cui calcola l'"altezza" 
      // del singolo punto dell'immagine, in questo caso 
      // collegata alla luminosità, si potrebbe esplorare altri modi?
      float zz = brightness(img.get(x, y));

      points.add(new PVector(xx, yy, zz));

      mesh[x][y] = zz;
    }
  }
}

void clear()
{
  for (int i = points.size() - 1; i >= 0; i--) {
    points.remove(i);
  }
  println(points.size());
}
