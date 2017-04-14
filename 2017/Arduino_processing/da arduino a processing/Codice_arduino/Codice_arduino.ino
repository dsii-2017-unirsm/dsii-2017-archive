
void setup() {
  Serial.begin(9600); //Begin Serial Communication with a baud rate of 9600
}

void loop() {
   //New variables are declared to store the readings of the respective pins
  int Value1 = analogRead(A0);
  int Value2 = analogRead(A1);
    int Value3 = digitalRead(A1);
  /*The Serial.print() function does not execute a "return" or a space
      Also, the "," character is essential for parsing the values,
      The comma is not necessary after the last variable.*/
  
  Serial.print(Value1, DEC); 
  Serial.print(",");
  Serial.print(Value2, DEC);
    Serial.print(",");
  Serial.print(Value3, DEC);
  Serial.println();
  delay(500); // For illustration purposes only. This will slow down your program if not removed 
}
