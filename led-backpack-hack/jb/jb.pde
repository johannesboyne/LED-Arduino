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

  
  for (int8_t x=4; x>=0; x--) {
    matrix.setRotation(x);
    matrix.clear();      // clear display
    matrix.drawTriangle(0,7,4,4,7,7, LED_YELLOW);
    matrix.writeDisplay();  // write the changes we just made to the display
    delay(200);

    matrix.clear();
    matrix.fillTriangle(0,7,4,4,7,7, LED_RED);
    matrix.writeDisplay();  // write the changes we just made to the display
    delay(200);
  }
}

/*
     0  1  2  3  4  5  6  7
  0 [ ][ ][ ][ ][ ][ ][ ][ ]
  1 [ ][ ][ ][ ][ ][ ][ ][ ]
  2 [ ][ ][ ][ ][ ][ ][ ][ ]
  3 [ ][ ][ ][ ][ ][ ][ ][ ]
  4 [ ][ ][ ][x][x][ ][ ][ ]
  5 [ ][ ][x][ ][ ][x][ ][ ]
  6 [ ][x][ ][ ][ ][ ][x][ ]
  7 [x][x][x][x][x][x][x][x]

     0  1  2  3  4  5  6  7
  0 [ ][ ][ ][ ][ ][ ][ ][ ]
  1 [ ][ ][ ][ ][ ][ ][ ][ ]
  2 [ ][ ][ ][ ][ ][ ][ ][ ]
  3 [ ][ ][ ][ ][ ][ ][ ][ ]
  4 [ ][ ][ ][x][x][ ][ ][ ]
  5 [ ][ ][x][ ][ ][x][ ][ ]
  6 [ ][x][ ][ ][ ][ ][x][ ]
  7 [x][x][x][x][x][x][x][x]



*/
