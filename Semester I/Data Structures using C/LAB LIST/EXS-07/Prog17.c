/*---------------------------------------------------------------
   Write a program in C using a stack to generate N Fibonacci numbers.
-----------------------------------------------------------------
   Clancy Mendonca
   23-09-24
----------------------------------------------------------------*/

#include<stdio.h>

#define SIZE 100  

typedef struct StackType {
    double arr[SIZE];
    int top;
} STACK;

void InitStack();
void Push(double num);
double Pop();
int StackEmpty();
void DisplayFibonacci(int n);

STACK S;

int main() {
    int n;

    InitStack();  

    printf("Enter the number of Fibonacci terms to generate: ");
    scanf("%d", &n);

    if (n < 0) {
        printf("Please enter a non-negative integer.\n");
    } else {
        DisplayFibonacci(n);  
    }

    return 0;
}

void DisplayFibonacci(int n) {
    double fib;

    if (n == 0) {
        printf("No Fibonacci numbers to display.\n");
        return;
    }

    if (n == 1) {
        printf("Fibonacci sequence:\n");
        printf("0\n");
        return;
    }

    Push(0);
    Push(1);

    printf("Fibonacci sequence:\n");
    printf("0\n1\n");  

    for (int i = 2; i < n; i++) {
        double num1 = Pop();  
        double num2 = Pop();  

        fib = num1 + num2; 

        Push(num2);
        Push(num1);
        Push(fib);

        printf("%.0lf\n", fib);
    }
}

void InitStack() {
    S.top = -1;  
}

void Push(double num) {
    if (S.top == SIZE - 1) {
        printf("Stack Overflow!\n");
        return;
    } else {
        S.top++;
        S.arr[S.top] = num;
    }
}

double Pop() {
    if (S.top == -1) {  
        printf("Stack Underflow!\n");
        return -1;
    } else {
        double num = S.arr[S.top];
        S.top--;
        return num;
    }
}

int StackEmpty() {
    return (S.top == -1);  
}
