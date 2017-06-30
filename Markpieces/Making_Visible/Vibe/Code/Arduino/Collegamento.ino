/*
  Physical Pixel

  An example of using the Arduino board to receive data from the
  computer.  In this case, the Arduino boards turns on an LED when
  it receives the character 'H', and turns off the LED when it
  receives the character 'L'.

  The data can be sent from the Arduino serial monitor, or another
  program like Processing (see code below), Flash (via a serial-net
  proxy), PD, or Max/MSP.

  The circuit:
   LED connected from digital pin 13 to ground

  created 2006
  by David A. Mellis
  modified 30 Aug 2011
  by Tom Igoe and Scott Fitzgerald

  This example code is in the public domain.
  http://www.arduino.cc/en/Tutorial/PhysicalPixel
*/

const int ledPin = 5; // the pin that the LED is attached to
int incomingByte;      // a variable to read incoming serial data into
void(* Riavvia)(void) = 0;


void setup() {
  // initialize serial communication:
  Serial.begin(9600);
  // initialize the LED pin as an output:
  pinMode(ledPin, OUTPUT);
}


void loop() {


  // see if there's incoming serial data:
  if (Serial.available() > 0) {
    // read the oldest byte in the serial buffer:
    incomingByte = Serial.read();
    // if it's a capital H (ASCII 72), turn on the LED:
    if (incomingByte == 'A') {
      analogWrite(5, 255);
      analogWrite(6, 255);
    }
    if (incomingByte == 'B') {
      analogWrite(5, 250);
      analogWrite(6, 250);
    }
    // if it's an L (ASCII 76) turn off the LED:
    if (incomingByte == 'C') {
      analogWrite(5, 240);
      analogWrite(6, 240);
    }
    // if it's an L (ASCII 76) turn off the LED:
    if (incomingByte == 'D') {
      analogWrite(5, 230);
      analogWrite(6, 230);
    }
     // if it's an L (ASCII 76) turn off the LED:
    if (incomingByte == 'E') {
      analogWrite(5, 210);
      analogWrite(6, 210);
    }
     // if it's an L (ASCII 76) turn off the LED:
    if (incomingByte == 'F') {
      analogWrite(5, 190);
      analogWrite(6, 190);
    }
     // if it's an L (ASCII 76) turn off the LED:
    if (incomingByte == 'G') {
      analogWrite(5, 170);
      analogWrite(6, 170);
    }


    
    
    if (incomingByte == 'H') {
      analogWrite(5, 150);
      analogWrite(6, 150);
    }
    if (incomingByte == 'I') {
      analogWrite(5, 130);
      analogWrite(6, 130);
    }
    // if it's an L (ASCII 76) turn off the LED:
    if (incomingByte == 'J') {
      analogWrite(5, 110);
      analogWrite(6, 110);
    }
    // if it's an L (ASCII 76) turn off the LED:
    if (incomingByte == 'K') {
      analogWrite(5, 90);
      analogWrite(6, 90);
    }
     // if it's an L (ASCII 76) turn off the LED:
    if (incomingByte == 'L') {
      analogWrite(5, 70);
      analogWrite(6, 70);
    }
     // if it's an L (ASCII 76) turn off the LED:
    if (incomingByte == 'M') {
      analogWrite(5, 50);
      analogWrite(6, 50);
    }
     // if it's an L (ASCII 76) turn off the LED:
    if (incomingByte == 'N') {
      analogWrite(5, 0);
      analogWrite(6, 0);
    }


  }



}

