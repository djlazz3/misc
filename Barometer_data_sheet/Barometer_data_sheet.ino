/**************************************************************************/
/*!
    @file     Adafruit_MPL3115A2.cpp
    @author   K.Townsend (Adafruit Industries)
    @license  BSD (see license.txt)

    Example for the MPL3115A2 barometric pressure sensor

    This is a library for the Adafruit MPL3115A2 breakout
    ----> https://www.adafruit.com/products/1893

    Adafruit invests time and resources providing this open source code,
    please support Adafruit and open-source hardware by purchasing
    products from Adafruit!

    @section  HISTORY

    v1.0 - First release
*/
/**************************************************************************/

#include <Wire.h>
#include <Adafruit_MPL3115A2.h>
#include <SD.h>
#include <SPI.h>
// Power by connecting Vin to 3-5V, GND to GND
// Uses I2C - connect SCL to the SCL pin, SDA to SDA pin
// See the Wire tutorial for pinouts for each Arduino
// http://arduino.cc/en/reference/wire
Adafruit_MPL3115A2 baro = Adafruit_MPL3115A2();
Sd2Card card;
SdVolume volume;
SdFile root;
const int chipSelect = 10;
void setup(){
  Serial.begin(9600);
  SD.begin();
  pinMode(10, OUTPUT);
  Serial.print("\nInitializing SD Card...");
  
  if (!card.init(SPI_HALF_SPEED, chipSelect)) {
    Serial.println("initialization failed. Things to check:");
    Serial.println("* is a card inserted?");
    Serial.println("* is your wiring correct?");
    Serial.println("* did you change the chipSelect pin to match your shield or module?");
    return;
  } else {
    Serial.println("Wiring is correct and a card is present.");
  }

  // print the type of card
  Serial.print("\nCard type: ");
  switch (card.type()) {
    case SD_CARD_TYPE_SD1:
      Serial.println("SD1");
      break;
    case SD_CARD_TYPE_SD2:
      Serial.println("SD2");
      break;
    case SD_CARD_TYPE_SDHC:
      Serial.println("SDHC");
      break;
    default:
      Serial.println("Unknown");
  }

  // Now we will try to open the 'volume'/'partition' - it should be FAT16 or FAT32
  if (!volume.init(card)) {
    Serial.println("Could not find FAT16/FAT32 partition.\nMake sure you've formatted the card");
    return;
  }


  // print the type and size of the first FAT-type volume
  uint32_t volumesize;
  Serial.print("\nVolume type is FAT");
  Serial.println(volume.fatType(), DEC);
  Serial.println();

  volumesize = volume.blocksPerCluster();    // clusters are collections of blocks
  volumesize *= volume.clusterCount();       // we'll have a lot of clusters
  volumesize *= 512;                            // SD card blocks are always 512 bytes
  Serial.print("Volume size (bytes): ");
  Serial.println(volumesize);
  Serial.print("Volume size (Kbytes): ");
  volumesize /= 1024;
  Serial.println(volumesize);
  Serial.print("Volume size (Mbytes): ");
  volumesize /= 1024;
  Serial.println(volumesize);
  Serial.println("\nFiles found on the card (name, date and size in bytes): ");
  root.openRoot(volume);

  // list all files in the card with date and size
  root.ls(LS_R | LS_DATE | LS_SIZE);
}
String data;
int y = 1;
void loop() {
  
  if (!baro.begin()) {
    Serial.print("Sensor Not Properly Connected");
    return;
  }
  float pascals = baro.getPressure();
  float altm = baro.getAltitude();
  float tempC = baro.getTemperature();
  // Our weather page presents pressure in Inches (Hg)
  // Use http://www.onlineconversion.com/pressure.htm for other units
  Serial.print(pascals/3377); Serial.println(" Inches (Hg)");
  Serial.print(altm-65488.56); Serial.println(" meters");
  Serial.print(tempC); Serial.println("*C");
  Serial.println();

  File barFile = SD.open("BAR.CSV", FILE_WRITE);
  data = String(y) + "," + String(pascals/3377) + "," + "," + String(y) + "," + String(tempC);
  if(!barFile){
    Serial.println("cannot make file");
  }else{
   barFile.println(data);
   barFile.close();
  }
  data = "";
  File altFile = SD.open("ALT.CSV", FILE_WRITE);
  data = String(y) + "," + String(altm-65488.56);
  if(!altFile){
    Serial.println("cannot make file");
  }else{
   altFile.println(data);
   altFile.close();
  }
  y++;
}
