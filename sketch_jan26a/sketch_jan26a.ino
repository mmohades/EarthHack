/*
Adafruit Arduino - Lesson 3. RGB LED
*/
 
int redPin = 9;
int greenPin = 10;
int bluePin = 11;
 
//uncomment this line if using a Common Anode LED
//#define COMMON_ANODE
 
void setup() {
  pinMode(redPin, OUTPUT);
  pinMode(greenPin, OUTPUT);
  pinMode(bluePin, OUTPUT);  
}


void greenLight(){
  setColor(255,255,0);  // green
  delay(1000);
}
void redLight(){
  setColor(0,255,255); // red
  delay(1000);
}
void whiteLight(){
  setColor(0,0,0);
  delay(1000);
  
}

void off() {
  setColor(255, 255, 255);
  delay(1000);
}
 
void loop() {
  greenLight(); 
  redLight();
  whiteLight();
  off();
}
 
void setColor(int red, int green, int blue) {
//  #ifdef COMMON_ANODE
//    red = 255 - red;
//    green = 255 - green;
//    blue = 255 - blue;
//  #endif
  analogWrite(redPin, red);
  analogWrite(greenPin, green);
  analogWrite(bluePin, blue);  
}
