
PShape revolve(PShape c, PImage tex)                      // revolving full object 
{
  PShape r = createShape(GROUP);
  for (int a=0; a<Segments; a++) 
    r.addChild(revolveStrip(c, a, tex));
  return r;
}


PShape revolveStrip(PShape c, int n, PImage tex)          // revolving single strip QUAD
{
  float angle = map(n, 0, Segments, 0, TWO_PI);           // angle value
  float cosa = cos(angle);                                // cosa value
  float sina = sin(angle);                                // sina value

  float angleb = map(n+1, 0, Segments, 0, TWO_PI);        // angle b value
  float cosb = cos(angleb);                               // cosb value
  float sinb = sin(angleb);                               // sinb value

  PShape strip = createShape();
  strip.beginShape(QUAD_STRIP);
  
  if (wireframe) {                                        //attributes wireframe mode
    strip.stroke(colore_solido,255);
    strip.noFill();
    strip.strokeWeight(0.5);
  }
  
  if (solido) {                                           //attributes solid mode
    strip.noStroke();
    //strip.tint(200, 255);
    strip.fill(colore_solido , 255);
  }
  
  if (texture) {                                          //attributes texture mode
    strip.noStroke();
    strip.texture(tex);
  }
  
  for (int s = 0; s<c.getVertexCount(); s++) {            
    float x, y;
    x = c.getVertexX(s);
    y = c.getVertexY(s);
    strip.vertex(x*cosa, y, x*sina, angle/TWO_PI, float(s)/c.getVertexCount());
    strip.vertex(x*cosb, y, x*sinb, angleb/TWO_PI, float(s)/c.getVertexCount());
  }
  strip.endShape();
  return strip;
}
