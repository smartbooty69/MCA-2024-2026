#include <stdio.h>
#include <stdlib.h>

void inputArray(int N, int A[]);
void outputArray(int N, int A[]);
int linearSearch(int N, int A[], int key);
void sortArray(int N, int A[]);
int binarySearch(int N, int A[], int search);

int main() {
    int N, key, search, index;
    int A[20];

    printf("Enter size of array: ");
    scanf("%d", &N);

    printf("\nEnter %d elements of the array:\n", N);
    inputArray(N, A);

    printf("\nDisplay elements of the array:\n");
    outputArray(N, A);

    printf("\nEnter the element to search using Linear Search: ");
    scanf("%d", &key);

    index = linearSearch(N, A, key);
    if (index != -1) {
        printf("\nElement %d found at position: %d (Linear Search)\n", key, index + 1);
    } else {
        printf("\nElement %d not found in the array (Linear Search).\n", key);
    }

    printf("\nEnter the element to search using Binary Search: ");
    scanf("%d", &search);

    sortArray(N, A);
    printf("\nDisplay sorted elements of the array:\n");
    outputArray(N, A);

    index = binarySearch(N, A, search);
    if (index != -1) {
        printf("\nElement %d found at position: %d (Binary Search)\n", search, index + 1);
    } else {
        printf("\nElement %d not found in the array (Binary Search).\n", search);
    }

    return 0;
}

void inputArray(int N, int A[]) {
    for (int i = 0; i < N; i++) {
        printf("Element %d: ", i + 1);
        while (scanf("%d", &A[i]) != 1) {
            printf("Invalid input. Please enter an integer for element %d: ", i + 1);
            while (getchar() != '\n'); 
        }
    }
}

void outputArray(int N, int A[]) {
    for (int i = 0; i < N; i++) {
        printf("%d\t", A[i]);
    }
    printf("\n");
}

int linearSearch(int N, int A[], int key) {
    for (int i = 0; i < N; i++) {
        if (A[i] == key) {
            return i; 
        }
    }
    return -1; 
}

void sortArray(int N, int A[]) {
    for (int i = 0; i < N-1; i++) {
        for (int j = 0; j < N-i-1; j++) {
            if (A[j] > A[j+1]) {
                int temp = A[j];
                A[j] = A[j+1];
                A[j+1] = temp;
            }
        }
    }
}

int binarySearch(int N, int A[], int search) {
    int left = 0, right = N - 1, mid;
    while (left <= right) {
        mid = (left + right) / 2;
        if (A[mid] == search) {
            return mid; 
        } else if (A[mid] < search) {
            left = mid + 1;
        } else {
            right = mid - 1;
        }
    }
    return -1; 
}
