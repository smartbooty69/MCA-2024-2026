/*----------------------------------------------------------------------------------------------------------------------------------------------------------
   Program to find the maximum number in an array
----------------------------------------------------------------------------------------------------------------------------------------------------------
   Clancy
   18-07-24
--------------------------------------------------------------------------------------------------------------------------------------------------------*/

#include <stdio.h>
#include <stdlib.h>

void input(int N, int A[]);
void output(int N, int A[]);
int max(int N, int A[]);

int main()
{
    int n, a[20];

    printf("Enter size of array (max 20):\n");
    scanf("%d", &n);

    printf("Enter elements of array:\n");
    input(n, a);

    printf("Display elements of array:\n");
    output(n, a);

    printf("\nDisplay max value in the array:\n");
    int m = max(n, a);
    printf("%d\n", m);

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
int max(int N, int A[])
{
    int maximum = A[0];  
    int i;
    for (i = 1; i < N; i++)
    {
        if (maximum < A[i])
        {
            maximum = A[i];
        }
    }
    return maximum;
}
