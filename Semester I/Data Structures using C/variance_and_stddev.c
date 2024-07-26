/*--------------------------------------------------------------------------------
   Variance and Standard Deviation Calculation
---------------------------------------------------------------------------
   clancy
   18-07-24
  -------------------------------------------------------------------------*/

#include <math.h>
#include <stdio.h>

void inputArray(int N, int A[]);
void outputArray(int N, int A[]);
float calculateStdDev(int N, int A[]);

int main() {
    int N, A[20];

    printf("Enter the number of elements (max 20): ");
    scanf("%d", &N);

    inputArray(N, A);
    outputArray(N, A);

    float stdDev = calculateStdDev(N, A);

    printf("Standard Deviation: %.2f\n", stdDev);

    return 0;
}

//-----------------------------------
void inputArray(int N, int A[]) {
    printf("Enter %d elements: ", N);
    for (int i = 0; i < N; ++i) {
        scanf("%d", &A[i]);
    }
}

//-----------------------------------
void outputArray(int N, int A[]) {
    printf("Array elements are: ");
    for (int i = 0; i < N; ++i) {
        printf("%d ", A[i]);
    }
    printf("\n");
}

//-----------------------------------
float calculateStdDev(int N, int A[]) {
    float sum = 0.0, mean, variance = 0.0;

    for (int i = 0; i < N; ++i) {
        sum += A[i];
    }

    mean = sum / N;

    for (int i = 0; i < N; ++i) {
        variance += pow(A[i] - mean, 2);
    }

    return sqrt(variance / N);
}