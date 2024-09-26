/*--------------------------------------------------------------------------------
   Write program in C to input some strings into a character matrix and sort them using BUBBLE SORT
---------------------------------------------------------------------------
   Clancy
   22-07-24
  -------------------------------------------------------------------------*/

#include <stdio.h>
#include <string.h>

void input(int N, char A[20][100]);
void output(int N, char A[20][100]);
void bubblesort(int N, char A[20][100]);

int main() {
    int N;
    char A[20][100];

    printf("Enter the number of strings:\n");
    scanf("%d", &N);

    printf("Enter the strings:\n");
    input(N, A);

    printf("\nDisplay elements before sorting:\n");
    output(N, A);

    printf("\nDisplay elements after sorting:\n");
    bubblesort(N, A);
    output(N, A);

    return 0;
}

//-----------------------------------
void input(int N, char A[20][100]) {
    int i;
    for (i = 0; i < N; i++) {
        scanf("%s", A[i]);
    }
}

//-----------------------------------
void output(int N, char A[20][100]) {
    int i;
    for (i = 0; i < N; i++) {
        printf("%s\n", A[i]);
    }
}

//-----------------------------------
void bubblesort(int N, char A[20][100]) {
    int i, j;
    char temp[100];

    for (i = 0; i < N - 1; i++) {
        for (j = 0; j < N - i - 1; j++) {
            if (strcmp(A[j], A[j + 1]) > 0) {
                strcpy(temp, A[j]);
                strcpy(A[j], A[j + 1]);
                strcpy(A[j + 1], temp);
            }
        }
    }
}
