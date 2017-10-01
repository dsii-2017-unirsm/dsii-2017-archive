

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
      // del singolo punto dell'immagine, in base alla luminosità 

      float zz;

      if (brightness == true) { 
        zz = brightness(img.get(x, y)); 
        points.add(new PVector(xx, yy, zz));   
        
        mesh[x][y] = zz;
        // mesh[x][y] = map(brightness(img.get(x, y)), 0, 255, zz, spessore);   
        
      }
      
      if (saturation == true) { 
        zz = saturation(img.get(x, y));     
        points.add(new PVector(xx, yy, zz));   
       
        mesh[x][y] = zz;
        // mesh[x][y] = map(saturation(img.get(x, y)), 0, 255, zz, spessore);   
  
      }
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

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isFrom(radiobutton)) {
    if (theEvent.getGroup().getValue() == 1.0) { 
      brightness = true;
    } else { 
      brightness = false;
    }
    if (theEvent.getGroup().getValue() == 2.0) { 
      saturation = true;
    } else { 
      saturation = false;
    }
  }
}