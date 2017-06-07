// write text
int fontSize = 20;
int fontXPos = 10;
int Spazzio = 30;
String live = " ";

void setup() {
  size (800, 800);
  textFont(createFont("Verdana", fontSize, true));

}
void draw() {
   drawText(live, fontXPos, fontSize, Spazzio);
}
void keyPressed(){
  mod(key);
}
void drawText(String message, int fontXPos, int fontYPos, int charSpacing) {
  for (int i = 0; i < message.length(); i++) {
    text(message.charAt(i), fontXPos, fontYPos);
    fontXPos += charSpacing;
  }
}
void mod ( char tasto) {
    live += tasto;
    live += ' ';
    live += ' ';

}