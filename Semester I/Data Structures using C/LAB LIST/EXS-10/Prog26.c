/*------------------------------------------------------------------------
   Write a program in C to search for a data item using LINEAR SEARCH method.
---------------------------------------------------------------------------
   Clancy 
   26-09-24
-------------------------------------------------------------------------*/

#include <stdio.h>
#include <stdlib.h>

void inputArray(int N, int A[]);
void outputArray(int N, int A[]);
int linearSearch(int N, int A[], int key);

int main() {
    int N, key, index;
    int A[20];

    printf("Enter size of array: ");
    scanf("%d", &N);

    printf("\nEnter elements of the array:\n");
    inputArray(N, A);

    printf("\nDisplay elements of the array:\n");
    outputArray(N, A);

    printf("\nEnter the element to search: ");
    scanf("%d", &key);

    index = linearSearch(N, A, key);

    if (index != -1) {
        printf("\nElement %d found at position: %d\n", key, index + 1);
    } else {
        printf("\nElement %d not found in the array.\n", key);
    }

    return 0;
}

void inputArray(int N, int A[]) {
    int i;
    for (i = 0; i < N; i++) {
        scanf("%d", &A[i]);
    }
}

void outputArray(int N, int A[]) {
    int i;
    for (i = 0; i < N; i++) {
        printf("%d\t", A[i]);
    }
    printf("\n");
}

int linearSearch(int N, int A[], int key) {
    int i;
    for (i = 0; i < N; i++) {
        if (A[i] == key) {
            return i; 
        }
    }
    return -1; 
}

