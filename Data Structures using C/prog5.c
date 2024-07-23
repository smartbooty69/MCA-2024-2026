#include<stdio.h>
#include<math.h>

float cosx(float theta) {
    float x, term, cos;
    int i;
    
    x = (22.0 / 7.0) * (theta / 180.0);
    cos = 1;
    term = 1;
    i = 1;

    while (fabs(term) >= 0.0001) {
        term = (-term * x * x) / ((2 * i - 1) * (2 * i));
        cos = cos + term;
        i++;
    }

    return cos;
}

int main() {
    float theta, ans;

    printf("theta (degrees)    cos(theta)\n");
    printf("-----------------------------\n");


    for (theta = 0; theta <= 180; theta += 10) {
        ans = cosx(theta);
        printf("\t%0.2f    %0.6f\n", theta, ans);
    }

    return 0;
}
