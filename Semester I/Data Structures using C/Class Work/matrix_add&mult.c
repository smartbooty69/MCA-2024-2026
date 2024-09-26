/*------------------------------------------------------------------------
   Matrix Addition and Multiplication
---------------------------------------------------------------------------
   Clancy 
   23-07-24
-------------------------------------------------------------------------*/

#include <stdio.h>
#include <stdlib.h>

void inputMat(int N, int M, int X[20][20]);
void outputMat(int N, int M, int X[20][20]);
void addMat(int N, int M, int A[20][20], int B[20][20], int C[20][20]);
void multMat(int N, int M, int P, int A[20][20], int B[20][20], int D[20][20]);

int main() {
    int N, M, P;
    int A[20][20], B[20][20], C[20][20], D[20][20];

    printf("Enter size of Matrix:\n");
    printf("Rows: ");
    scanf("%d", &N);
    printf("Columns: ");
    scanf("%d", &M);

    P=M;

    printf("\nEnter elements of Matrix A:\n");
    inputMat(N, M, A);

    printf("\nEnter elements of Matrix B:\n");
    inputMat(M, P, B);

    printf("\nDisplay elements of Matrix A:\n");
    outputMat(N, M, A);

    printf("\nDisplay elements of Matrix B:\n");
    outputMat(M, P, B);

    addMat(N, M, A, B, C);

    printf("\nDisplay elements of Matrix Addition:\n");
    outputMat(N, M, C);

    multMat(N, M, P, A, B, D);

    printf("\nDisplay elements of Matrix Multiplication:\n");
    outputMat(N, P, D);

    return 0;
}

//-----------------------------------
void inputMat(int N, int M, int X[20][20]) {
    int i, j;
    for (i = 0; i < N; i++) {
        for (j = 0; j < M; j++) {
            scanf("%d", &X[i][j]);
        }
    }
}

//-----------------------------------
void outputMat(int N, int M, int X[20][20]) {
    int i, j;
    for (i = 0; i < N; i++) {
        for (j = 0; j < M; j++) {
            printf("%d\t", X[i][j]);
        }
        printf("\n");
    }
}

//-----------------------------------
void addMat(int N, int M, int A[20][20], int B[20][20], int C[20][20]) {
    int i, j;
    for (i = 0; i < N; i++) {
        for (j = 0; j < M; j++) {
            C[i][j] = A[i][j] + B[i][j];
        }
    }
}

//-----------------------------------
void multMat(int N, int M, int P, int A[20][20], int B[20][20], int D[20][20]) {
    int i, j, k;
    for (i = 0; i < N; i++) {
        for (j = 0; j < P; j++) {
            D[i][j] = 0;
            for (k = 0; k < M; k++) {
                D[i][j] += A[i][k] * B[k][j];
            }
        }
    }
}
