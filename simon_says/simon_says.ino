#include <Esplora.h>
int buttons() {
  while(true)
  {
 if (Esplora.readButton(SWITCH_3) == LOW)
    {
      Esplora.writeRed(255);
      Esplora.tone(300, 30);
      return(0);
    }
    else 
    {
      Esplora.writeRed(0);
    }
    if (Esplora.readButton(SWITCH_2) == LOW)
    {
      Esplora.writeGreen(255);  
      Esplora.tone(700, 30);
      return(1);
    }
    else
    {
      Esplora.writeGreen(0);
    }
    if (Esplora.readButton(SWITCH_4) == LOW)
    {
      Esplora.writeBlue(255);
      Esplora.tone(500, 30);
      return(2); 
    }
    else
    {
      Esplora.writeBlue(0);
    }
    if (Esplora.readButton(SWITCH_1) == LOW)
    {
      Esplora.writeRGB(255,255,0);
      Esplora.tone(400, 30);
      return(3);
    }
    else
    {
      Esplora.writeRGB(0,0,0);
    }
  } 
}
int x =1;
void setup() {

}

void loop() {
int z = x;
    int arr[x];
    for (x; x > 0;)
    {
      arr[x] = random(4);
      if (arr[x] == 0)
      {
        Esplora.writeRed(255);
        Esplora.tone(300, 60);
        delay(500);  
        Esplora.writeRed(0);
        x--;
      }
      else if (arr[x] == 1)
      {
        Esplora.writeGreen(255);
        Esplora.tone(700, 60);
        delay(500);        
        Esplora.writeGreen(0);
        x--;
      }
      else if (arr[x] == 2)
      {
        Esplora.writeBlue(255);
        Esplora.tone(500, 60);        
        delay(500);
        Esplora.writeBlue(0);
        x--;
      }
      else if (arr[x] == 3)  
      {
        Esplora.writeRGB(255,255,0);
        Esplora.tone(400, 60);
        delay(500);
        Esplora.writeRGB(0,0,0);
        x--;        
      }
    for (x; x < sizeof(arr)-1; x++)
    {
      int y = buttons();
        if (y =  arr[x])
        {
          Esplora.tone(800, 60);
        }
        else
        {
          Esplora.tone(200, 60);
        }
    }
  }
  x++;
}

