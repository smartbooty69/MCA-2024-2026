/*--------------------------------------------------------------------------------
   Sine Calculation using Taylor Series Expansion
---------------------------------------------------------------------------
   Clancy
   18-07-24
  -------------------------------------------------------------------------*/

#include <stdio.h>
#include <math.h>

float sinx(float theta);

int main() {
    float theta, ans;

    printf("theta (degrees)    sin(theta)\n");
    printf("-----------------------------\n");

    for (theta = 0; theta <= 180; theta += 10) {
        ans = sinx(theta);
        printf("\t%0.2f    %0.6f\n", theta, ans);
    }

    return 0;
}

//-----------------------------------
float sinx(float theta) {
    float x, term, sin;
    int i;

    x = theta * (22.0 / 7.0) / 180.0;
    
    sin = x;  
    term = x;
    i = 1;

    while (fabs(term) >= 0.0001) {
        term = (-term * x * x) / ((2 * i + 1) * (2 * i));
        sin += term;
        i++;
    }

    return sin;
}
