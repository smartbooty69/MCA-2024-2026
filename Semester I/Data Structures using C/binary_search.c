/*------------------------------------------------------------------------
   Binary Search
---------------------------------------------------------------------------
   Clancy 
   23-07-24
-------------------------------------------------------------------------*/

#include <stdio.h>
#include <stdlib.h>

void inputArray(int N, int X[]);
void outputArray(int N, int X[]);
void sortArray(int N, int X[]);
int binarySearch(int N, int X[], int key);

int main() {
    int N, key, index;
    int X[20];

    printf("Enter size of array: ");
    scanf("%d", &N);

    printf("\nEnter elements of the array:\n");
    inputArray(N, X);

    printf("\nDisplay elements of the array:\n");
    outputArray(N, X);

    sortArray(N, X);

    printf("\nDisplay sorted elements of the array:\n");
    outputArray(N, X);

    printf("\nEnter the element to search: ");
    scanf("%d", &key);

    index = binarySearch(N, X, key);

    if (index != -1) {
        printf("\nElement %d found at position: %d\n", key, index + 1);
    } else {
        printf("\nElement %d not found in the array.\n", key);
    }

    return 0;
}


void inputArray(int N, int X[]) {
    int i;
    for (i = 0; i < N; i++) {
        scanf("%d", &X[i]);
    }
}


void outputArray(int N, int X[]) {
    int i;
    for (i = 0; i < N; i++) {
        printf("%d\t", X[i]);
    }
    printf("\n");
}


void sortArray(int N, int X[]) {
    int i, j, temp;
    for (i = 0; i < N-1; i++) {
        for (j = 0; j < N-i-1; j++) {
            if (X[j] > X[j+1]) {
                temp = X[j];
                X[j] = X[j+1];
                X[j+1] = temp;
            }
        }
    }
}

int binarySearch(int N, int X[], int key) {
    int left = 0, right = N - 1, mid;
    while (left <= right) {
        mid = (left + right) / 2;
        if (X[mid] == key) {
            return mid; 
        } else if (X[mid] < key) {
            left = mid + 1;
        } else {
            right = mid - 1;
        }
    }
    return -1; 
}
