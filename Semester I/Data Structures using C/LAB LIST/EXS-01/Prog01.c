/*-----------------------------------------------------------------
Write function sub programs in C to input some numbers into an
array, print the content of the array and SORT them using Bubble
SORT TECHNIQUE.
-------------------------------------------------------------------
CLANCY
29-07-2024
-------------------------------------------------------------------*/

#include<stdio.h>

void InputArray(int N, int A[20]);
void PrintArray(int N, int A[20]);
void BubbleSort(int N, int A[20]);

int main()
{
    int N, X[20];

    printf("Function sub program in c to input and print some numbers into an using bubble sort techniques\n\n");

    printf("Enter the number of Elements: ");
    scanf("%d", &N);

    printf("Enter %d numbers: ", N);
    InputArray(N,X);

    printf("Original list before sorting: \n");
    PrintArray(N,X);

    BubbleSort(N,X);
    printf("After sorting the numbers using bubble sort techniques:\n");
    PrintArray(N,X);

    return 0;
}

void InputArray(int N, int A[20])
{
    int i;
    for(i=1; i<=N; i++){
        scanf("%d",&A[i]);
    }
}

void PrintArray(int N, int A[20]){
    int i;
    for (i=1;i<=N;i++){
        printf("%d ", A[i]);
    }
    printf("\n");
}

void BubbleSort(int N, int A[20])
{
    int i,j,temp=0;
    for(i=1;i<=N-1;i++){
        for(j=1;j<=N-i;j++){
           if(A[j]>A[j+1])
           {
               temp=A[j];
               A[j]=A[j+1];
               A[j+1]=temp;
           }
        }
    }
}
