#include <Wire.h>
#include "Adafruit_LEDBackpack.h"
#include "Adafruit_GFX.h"

Adafruit_BicolorMatrix matrix = Adafruit_BicolorMatrix();

void setup() {
  Serial.begin(9600);
  Serial.println("8x8 LED Matrix Test");
  
  matrix.begin(0x70);  // pass in the address
}

void loop() {

  matrix.clear();      // clear display
  matrix.drawTriangle(0,0,7,7,0,7, LED_YELLOW);
  matrix.writeDisplay();  // write the changes we just made to the display
  delay(500);

  
  for (int8_t x=7; x>=-36; x--) {
    matrix.setRotation(x%2);
    matrix.clear();      // clear display
    matrix.drawTriangle(x,x,x+7,x+8,x,x+8, LED_YELLOW);
    matrix.writeDisplay();  // write the changes we just made to the display
    delay(100);
  }
  matrix.setRotation(0);
}
