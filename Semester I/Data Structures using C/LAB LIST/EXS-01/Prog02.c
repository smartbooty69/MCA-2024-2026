/*---------------------------------------------------------------------------------------------------------------------------------------
Write a function sub program in C to convert the temperature in
the Celsius scale to Fahrenheit scale. Use it in the main program to
convert temperature in Celsius scale ranging from 0 to 100 for
every 10 degrees.
-------------------------------------------------------------------------------------------------------------------------------------------
    CLANCY
    29-07-2024
------------------------------------------------------------------------------------------------------------------------------------------*/

#include <stdio.h>

float CtoF(float C);

void main() {
    float C, F;

    printf("Function sub program in C to convert the temperature in the Celsius scale to Fahrenheit scale from 0 to 100 for every 10 degrees\n\n");

    printf("Celsius \t Fahrenheit\n");

    for (C = 0; C <= 100; C += 10) {
        F = CtoF(C);
        printf("%0.2fC \t\t %0.2f\n", C, F); 
    }
}

float CtoF(float C) {
    return (9.0 / 5.0) * C + 32;
}

