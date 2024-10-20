/*------------------------------------------------------------------
Write a program in C to sort an Array using merge sort with separate 
functions for input, output, and sorting.
------------------------------------------------------------------
Clancy Mendonca
20-10-2024
------------------------------------------------------------------*/

#include <stdio.h>

void input(int A[], int N);   
void output(int A[], int N);
void merge(int A[], int low, int mid, int high);
void mergeSort(int A[], int low, int high);

int main() {
    int N, A[20];

    printf("Enter the number of elements in the Array: ");
    scanf("%d", &N);

    printf("Enter the numbers:\n");
    input(A, N);  
    
    printf("Given Array is: \n");
    output(A, N);

    mergeSort(A, 0, N - 1);

    printf("Sorted Array is: \n");
    output(A, N);

    return 0;
}

void input(int A[], int N) {
    for (int i = 0; i < N; i++) {
        scanf("%d", &A[i]);
    }
}

void output(int A[], int N) {
    for (int i = 0; i < N; i++) {
        printf("%d ", A[i]);
    }
    printf("\n");
}

void merge(int A[], int low, int mid, int high) {
    int n1 = mid - low + 1;  
    int n2 = high - mid;     

    int leftA[n1], rightA[n2];

    for (int i = 0; i < n1; i++)
        leftA[i] = A[low + i];
    for (int j = 0; j < n2; j++)
        rightA[j] = A[mid + 1 + j];

    int i = 0, j = 0, k = low;
    while (i < n1 && j < n2) {
        if (leftA[i] <= rightA[j]) {
            A[k] = leftA[i];
            i++;
        } else {
            A[k] = rightA[j];
            j++;
        }
        k++;
    }

    while (i < n1) {
        A[k] = leftA[i];
        i++;
        k++;
    }

    while (j < n2) {
        A[k] = rightA[j];
        j++;
        k++;
    }
}

void mergeSort(int A[], int low, int high) {
    if (low < high) {
        int mid = low + (high - low) / 2;

        mergeSort(A, low, mid);
        mergeSort(A, mid + 1, high);
        
        merge(A, low, mid, high);
    }
}
