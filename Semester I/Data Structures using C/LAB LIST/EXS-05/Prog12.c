/*--------------------------------------------------------------------------------
   Write a program in C to input some numbers into an array and sort them using INSERTION SORT.
---------------------------------------------------------------------------
   Clancy
   22-07-24
  -------------------------------------------------------------------------*/

#include <stdio.h>

void input(int N, int A[20]);
void output(int N, int A[20]);
void insertionsort(int N, int A[20]);

int main() {
    int N, A[20];

    printf("Enter the number of elements:\n");
    scanf("%d", &N);

    printf("Enter the elements:\n");
    input(N, A);

    printf("\nDisplay elements before sorting:\n");
    output(N, A);

    printf("\nDisplay elements after sorting:\n");
    insertionsort(N, A);
    output(N, A);

    return 0;
}

//-----------------------------------
void input(int N, int A[20]) {
    int i;
    for (i = 0; i < N; i++) {
        scanf("%d", &A[i]);
    }
}

//-----------------------------------
void output(int N, int A[20]) {
    int i;
    for (i = 0; i < N; i++) {
        printf("%d\t", A[i]);
    }
    printf("\n");
}

//-----------------------------------
void insertionsort(int N, int A[20]) {
    int i, j, key;

    for (i = 1; i < N; i++) {
        key = A[i];
        j = i - 1;

        while (j >= 0 && A[j] > key) {
            A[j + 1] = A[j];
            j = j - 1;
        }
        A[j + 1] = key;
    }
}
