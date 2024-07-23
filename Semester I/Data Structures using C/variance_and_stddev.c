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
float calculateVariance(int N, int A[]);
float calculateStdDev(int N, int A[]);

int main() {
    int N, A[20];

    printf("Enter the number of elements (max 20): ");
    scanf("%d", &N);

    if (N > 20) {
        printf("The number of elements should not exceed 20.\n");
        return 1;
    }

    inputArray(N, A);
    outputArray(N, A);

    float variance = calculateVariance(N, A);
    float stdDev = calculateStdDev(N, A);

    printf("Variance: %.2f\n", variance);
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
float calculateVariance(int N, int A[]) {
    float sum = 0.0, mean, variance = 0.0;

    for (int i = 0; i < N; ++i) {
        sum += A[i];
    }

    mean = sum / N;

    for (int i = 0; i < N; ++i) {
        variance += pow(A[i] - mean, 2);
    }

    return variance / N;
}

//-----------------------------------
float calculateStdDev(int N, int A[]) {
    return sqrt(calculateVariance(N, A));
}