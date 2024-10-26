/*------------------------------------------------------------------
Write a program in C using a stack to convert a decimal number into its binary equivalent.
------------------------------------------------------------------
Clancy Mendonca
18-10-2024
------------------------------------------------------------------*/

#include<stdio.h>

#define size 100

typedef struct StackType {
    int A[size];
    int Top;
} STACK;
STACK S;

void InitStack();
void Push(int num);
int Pop();
int IsStackEmpty();

int main() {
    int decimal, remainder;
    
    printf("Enter a decimal number: ");
    scanf("%d", &decimal);

    InitStack();

    while(decimal > 0) {
        remainder = decimal % 2;  
        Push(remainder);          
        decimal = decimal / 2;    
    }

    printf("Binary equivalent: ");
    while(!IsStackEmpty()) {
        printf("%d", Pop());  
    }
    printf("\n");

    return 0;
}

void InitStack() {
    S.Top = -1;  
}

void Push(int num) {
    if(S.Top == size - 1) {
        printf("Stack overflow\n");
        return;
    }
    S.Top++;
    S.A[S.Top] = num;
}

int Pop() {
    if(S.Top == -1) {
        printf("Stack underflow\n");
        return -1;
    }
    int num = S.A[S.Top];
    S.Top--;
    return num;
}

int IsStackEmpty() {
    return S.Top == -1;
}