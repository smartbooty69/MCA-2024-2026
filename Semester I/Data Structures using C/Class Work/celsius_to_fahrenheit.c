/*-------------------------------------------------------------------------
   Celsius to Fahrenheit Conversion
---------------------------------------------------------------------------
   clancy
   18-07-24
  -------------------------------------------------------------------------*/

#include <stdio.h>

float celsius_to_fahrenheit(float celsius);

void main()
{
    float celsius, fahrenheit;

    printf("Celsius to Fahrenheit conversion from 0 to 100 degrees:\n");

    for (celsius = 0; celsius <= 100; celsius += 10) {
        fahrenheit = celsius_to_fahrenheit(celsius);
        printf("%.0f°C = %.1f°F\n", celsius, fahrenheit);
    }
}

//-----------------------------------
float celsius_to_fahrenheit(float celsius) {
    return (celsius * 9.0 / 5.0) + 32;
}