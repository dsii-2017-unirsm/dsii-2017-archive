#include <Servo.h>

#define echoPin 2 // Pin che riceve la pulsazione echo
#define trigPin 3 // Pin che riceve la pulsazione trig

Servo myservo;  //per controllare il servo motore

int potpin = 0; 
int val;  
int tweet = 0;
int incomingByte;     
void(* Riavvia)(void) = 0;

const int triggerPort = 9;
const int echoPort = 10;

void setup() {

  Serial.begin(9600);

  //-------------------------controllo motori A e B------------------//
  pinMode(12, OUTPUT); //avvio pin 12
  pinMode(9, OUTPUT); //freno pin 9

  pinMode(13, OUTPUT); //avvio pin 13
  pinMode(8, OUTPUT);  //freno pin 8

  pinMode(echoPin, INPUT);// setto echopin come input
  pinMode(trigPin, OUTPUT);// setto trigger come output

  myservo.attach(6);  // pin di collegamento per il servo
}


void A_B() {
  digitalWrite(12, HIGH); //Establishes forward direction of Channel A
  digitalWrite(9, LOW);   //Disengage the Brake for Channel A
  analogWrite(3, 255);   //Spins the motor on Channel A at full speed

  digitalWrite(13, HIGH);  //Establishes backward direction of Channel B
  digitalWrite(8, LOW);   //Disengage the Brake for Channel B
  analogWrite(11, 255);    //Spins the motor on Channel B at half
}


int count = 0;
int randomico = 0;

  //-------------------------loop attivazione motori------------------//
void loop() {
  count++;
  if (count > 200) {
    count = 0;
    randomico = random(1);
  }
  if (randomico == 0) {
    A_B();
  }

  Serial.println(randomico);

  //-------------------------sensore di prossimità------------------//
  digitalWrite( triggerPort, LOW );
  digitalWrite( triggerPort, HIGH );
  delayMicroseconds( 10 );
  digitalWrite( triggerPort, LOW );

  long durata = pulseIn( echoPort, HIGH );
  long distanza = 0.034 * durata / 2;

  Serial.print("distanza: ");

  if ( durata > 38000 ) {
    Serial.println("Fuori portata   ");//dopo 38ms è fuori dalla portata del sensore
  }
  else {
    Serial.print(distanza);
    Serial.println(" cm     ");
  }

  if (distanza < 30) {     //invertire i motori a distanza minore di 30cm
    digitalWrite(9, LOW);  
    analogWrite(3, 0);
    digitalWrite(8, LOW);   
    analogWrite(11, 0);

    digitalWrite(12, LOW); 
    digitalWrite(9, LOW);   
    analogWrite(3, 255);   
  }


  delay(1000);


  //-------------------------controllo servo tramite collegamento a processing------------------//
  if (Serial.available() > 0) {
    incomingByte = Serial.read();
    if (incomingByte == 'H') {
      tweet = 1;
    }
    if (incomingByte == 'L') {
      tweet = 0;
    }
  }

  if (tweet == 0) {
    // tweet
    myservo.write(0);
  }
  if (tweet == 1) {
    // No tweet
    myservo.write(90);
  }

  delay(15);

}
