/*------------------------------------------------------------------
Write a program in C to sort a list of numbers using heap sort technique.
------------------------------------------------------------------
Clancy Mendonca
20-10-2024
------------------------------------------------------------------*/

#include <stdio.h>

void input(int A[], int N);   
void output(int A[], int N);
void heapify(int A[], int N, int i);
void heapSort(int A[], int N);

int main() {
    int N, A[20];

    printf("Enter the number of elements in the Array: ");
    scanf("%d", &N);

    printf("Enter the numbers:\n");
    input(A, N);  
    
    printf("Given Array is: \n");
    output(A, N);

    heapSort(A, N);

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

void heapify(int A[], int N, int i) {
    int largest = i;   
    int left = 2 * i + 1; 
    int right = 2 * i + 2; 

    if (left < N && A[left] > A[largest])
        largest = left;

    if (right < N && A[right] > A[largest])
        largest = right;

    if (largest != i) {
        int temp = A[i];
        A[i] = A[largest];
        A[largest] = temp;

        heapify(A, N, largest);
    }
}

void heapSort(int A[], int N) {
    for (int i = N / 2 - 1; i >= 0; i--)
        heapify(A, N, i);

    for (int i = N - 1; i > 0; i--) {
        int temp = A[0];
        A[0] = A[i];
        A[i] = temp;

        heapify(A, i, 0);
    }
}
