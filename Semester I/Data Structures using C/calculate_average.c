/*----------------------------------------------------------------------------------------------------------------------------------------------------------
   Program to find the average of numbers in an array
----------------------------------------------------------------------------------------------------------------------------------------------------------
   Clancy
   18-07-24
--------------------------------------------------------------------------------------------------------------------------------------------------------*/

#include <stdio.h>

void input(int N, int A[]);
float average(int N, int A[]);
void output(int N, int A[]);

int main()
{
    int n, a[20];

    printf("Enter size of array (max 20):\n");
    scanf("%d", &n);

    if (n > 20) {
        printf("Size exceeds maximum allowed size of 20.\n");
        return 1;
    }

    printf("Enter elements of array:\n");
    input(n, a);

    printf("\nDisplay average value of the array:\n");
    float avg = average(n, a);
    printf("%.2f\n", avg);

    return 0;
}

//-----------------------------------
void input(int N, int A[])
{
    int i;
    for (i = 0; i < N; i++)
    {
        scanf("%d", &A[i]);
    }
}

//-----------------------------------
void output(int N, int A[])
{
    int i;
    for (i = 0; i < N; i++)
    {
        printf("%d\t", A[i]);
    }
    printf("\n");
}

//-----------------------------------
float average(int N, int A[])
{
    int i;
    float sum = 0.0;
    for (i = 0; i < N; i++)
    {
        sum += A[i];
    }
    return sum / N;
}
