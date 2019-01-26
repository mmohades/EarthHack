int redPin = 9
int greenPin = 10
int bluePin = 11

//uncomment this line if using a Common Anode LED
//  # define COMMON_ANODE

void setup() {


    Serial.begin(9600)
    // set the baud rate
    pinMode(redPin, OUTPUT)
    pinMode(greenPin, OUTPUT)
    pinMode(bluePin, OUTPUT)
    Serial.println("Ready")
    // print "Ready" once

}


void greenLight(){
    setColor(255, 255, 0)
    // green
    delay(1000)
}
void redLight(){
    setColor(0, 255, 255)
    // red
    delay(1000)
}
void whiteLight(){
    setColor(0, 0, 0)
    delay(1000)
}

void off() {
    setColor(255, 255, 255)
    delay(1000)
}


void setColor(int red, int green, int blue) {
    //  # ifdef COMMON_ANODE
    // red = 255 - red
    // green = 255 - green
    // blue = 255 - blue
    //  # endif
    analogWrite(redPin, red)
    analogWrite(greenPin, green)
    analogWrite(bluePin, blue)
}

void loop() {

    greenLight()
    redLight()
    whiteLight()
    off()
}


void loop() {
    char inByte = ' ';
    if(Serial.available() > 0){
        char inByte = Serial.read();

        switch(inByte){

            case '1':
            // color is white

            whiteLight();
            break;



            case '2':
            // color is green

            greenLight();
            break;

            case '3':
            // color is red

            redLight();
            break;

            case '4':
            // swithc off light

            off();
            break;

            default: break; }

        Serial.println(inByte);}

    delay(100); // delay for 1 / 10 of a second
}
