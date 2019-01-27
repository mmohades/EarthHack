int redPin = 9;
int greenPin = 10;
int bluePin = 11;
const int trigPin = 4;
const int echoPin = 2;
long duration;
int distance;
int counterOff = 0;
int counterOn = 0;
bool state = false;



//uncomment this line if using a Common Anode LED
//  # define COMMON_ANODE

void setup() {


    Serial.begin(9600);
    // set the baud rate

    pinMode(redPin, OUTPUT);
    pinMode(greenPin, OUTPUT);
    pinMode(bluePin, OUTPUT);
    pinMode(trigPin, OUTPUT);
    pinMode(echoPin, INPUT);
    off();


}

int calculate_distance() {

  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);

  // Sets the trigPin on HIGH state for 10 micro seconds
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);

  // Reads the echoPin, returns the sound wave travel time in microseconds
  duration = pulseIn(echoPin, HIGH);

  // Calculating the distance
  distance = duration * 0.034 / 2;

  return distance;


}



void greenLight(){
    setColor(255, 255, 0);
    // green
    delay(1000);
}
void redLight(){
    setColor(0, 255, 255);
    // red
    delay(1000);
}
void whiteLight(){
    setColor(0, 0, 0);
    delay(1000);
}

void off() {
    setColor(255, 255, 255);
    delay(1000);
}


void setColor(int red, int green, int blue) {
    //  # ifdef COMMON_ANODE
    // red = 255 - red
    // green = 255 - green
    // blue = 255 - blue
    //  # endif
    analogWrite(redPin, red);
    analogWrite(greenPin, green);
    analogWrite(bluePin, blue);
}


void loop() {


  calculate_distance();
  Serial.println(distance);



    char inByte = ' ';

    if(Serial.available() > 0){


      
        char inByte = Serial.read();

        switch(inByte){

            case '1':
            // color is white

            whiteLight();
            Serial.flush();
            break;


            case '2':
            // color is green

            greenLight();
            Serial.flush();
            break;

            case '3':
            // color is red

            redLight();
            Serial.flush();
            break;

            case '4':
            // swithc off light

            off();
            Serial.flush();
            break;

            default: 
            Serial.flush();
            break; }



        }

    delay(100);


}
