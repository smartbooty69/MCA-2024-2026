/*--------------------------------------------------------------------------------
   Write a program in C to sort a list of numbers using QUICK SORT
---------------------------------------------------------------------------   
   Clancy
   18-20-2024
---------------------------------------------------------------------------*/

#include <stdio.h>

void input(int N, int A[]);
void output(int N, int A[]);
void quicksort(int A[], int low, int high);
int partition(int A[], int low, int high);

int main() {
    int N;
    int A[100];  

    printf("Enter the number of elements:\n");
    scanf("%d", &N);

    printf("Enter the numbers:\n");
    input(N, A);

    printf("\nDisplay elements before sorting:\n");
    output(N, A);

    printf("\nDisplay elements after sorting:\n");
    quicksort(A, 0, N - 1);
    output(N, A);

    return 0;
}

//-----------------------------------
void input(int N, int A[]) {
    int i;
    for (i = 0; i < N; i++) {
        scanf("%d", &A[i]);
    }
}

//-----------------------------------
void output(int N, int A[]) {
    int i;
    for (i = 0; i < N; i++) {
        printf("%d ", A[i]);
    }
    printf("\n");
}

//-----------------------------------
void quicksort(int A[], int low, int high) {
    if (low < high) {
        int pi = partition(A, low, high);  
        quicksort(A, low, pi - 1);  
        quicksort(A, pi + 1, high);  
    }
}

//-----------------------------------
int partition(int A[], int low, int high) {
    int pivot = A[high]; 
    int i = (low - 1);  

    for (int j = low; j <= high - 1; j++) {
        if (A[j] < pivot) {
            i++;  
            int temp = A[i];
            A[i] = A[j];
            A[j] = temp;
        }
    }

    int temp = A[i + 1];
    A[i + 1] = A[high];
    A[high] = temp;

    return (i + 1);  
}