/*---------------------------------------------------------------------------------------------------------------------------------------
Write a function sub program to return the STANDARD DEVIATION
of some numbers in an array. Use it in the main program to find
and display the standard deviation of N numbers in an array. ( use
any one of the FORMULAE)
----------------------------------------------------------------------------------------------------------------------------------------
CLANCY
29-07-2024
----------------------------------------------------------------------------------------------------------------------------------------*/

#include <stdio.h>
#include <math.h>

float stddev(int N, int A[]);

int main() {
    int N, X[20], i;
    float Stddev;

    printf("Function sub program to return the standard deviation of some numbers in an array\n");

    printf("Enter the number of elements:\n");
    scanf("%d", &N);

    printf("Enter the elements:\n");
    for (i = 0; i < N; i++) {  
        scanf("%d", &X[i]);
    }

    Stddev = stddev(N, X);
    printf("The standard deviation of %d numbers: %.2f\n", N, Stddev);

    return 0;
}

float stddev(int N, int A[]) {
    int i;
    int sum = 0;
    float avg, variance = 0.0;

    for (i = 0; i < N; i++) {
        sum += A[i];
    }
    avg = (float)sum / N;

    for (i = 0; i < N; i++) {
        variance += pow(A[i] - avg, 2);    
    }

    variance /= (N - 1);

    return sqrt(variance);
}
