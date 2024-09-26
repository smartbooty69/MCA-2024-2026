/*------------------------------------------------------------------------
   Binary Search
---------------------------------------------------------------------------
   Clancy 
   23-07-24
-------------------------------------------------------------------------*/

#include <stdio.h>
#include <stdlib.h>

void inputArray(int N, int A[]);
void outputArray(int N, int A[]);
void sortArray(int N, int A[]);
int binarySearch(int N, int A[], int key);

int main() {
    int N, key, index;
    int A[20];

    printf("Enter size of array: ");
    scanf("%d", &N);

    printf("\nEnter elements of the array:\n");
    inputArray(N, A);

    printf("\nDisplay elements of the array:\n");
    outputArray(N, A);

    sortArray(N, A);

    printf("\nDisplay sorted elements of the array:\n");
    outputArray(N, A);

    printf("\nEnter the element to search: ");
    scanf("%d", &key);

    index = binarySearch(N, A, key);

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


void sortArray(int N, int A[]) {
    int i, j, temp;
    for (i = 0; i < N-1; i++) {
        for (j = 0; j < N-i-1; j++) {
            if (A[j] > A[j+1]) {
                temp = A[j];
                A[j] = A[j+1];
                A[j+1] = temp;
            }
        }
    }
}

int binarySearch(int N, int A[], int key) {
    int left = 0, right = N - 1, mid;
    while (left <= right) {
        mid = (left + right) / 2;
        if (A[mid] == key) {
            return mid; 
        } else if (A[mid] < key) {
            left = mid + 1;
        } else {
            right = mid - 1;
        }
    }
    return -1; 
}
