
void setup() {
  Serial.begin(9600); //Begin Serial Communication with a baud rate of 9600
}

void loop() {
   //New variables are declared to store the readings of the respective pins
  int Value_0A = analogRead(A0);
  int Value_1A = analogRead(A1);
  int Value_1D = digitalRead(A1);
 
  /*The Serial.print() function does not execute a "return" or a space
      Also, the "," character is essential for parsing the values,
      The comma is not necessary after the last variable.*/
  
  Serial.print(Value_0A, DEC); // < analogico piedino 0
  Serial.print(",");
  Serial.print(Value_1A, DEC); // < analogico piedino 1
  Serial.print(",");
  Serial.print(Value_1D, DEC); // < digitale piedino 1
  Serial.println();
  delay(50); // For illustration purposes only. This will slow down your program if not removed 
}
