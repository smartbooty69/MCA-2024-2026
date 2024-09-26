/*---------------------------------------------------------------
   Write a program in C using a stack to generate N Fibonacci numbers.
-----------------------------------------------------------------
   Clancy 
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
void Display();

STACK S;

int main()
{
    int n;
    double fib;
    
    InitStack();  

    printf("Enter the n value:\n");
    scanf("%d", &n);

    
    if (n == 0) {
        printf("Fibonacci of %d is 0\n", n);
        return 0;
    }
    if (n == 1) {
        printf("Fibonacci of %d is 1\n", n);
        return 0;
    }

    
    Push(0);  
    Push(1);  

    for (int i = 2; i <= n; i++) {
        double num1 = Pop();  
        double num2 = Pop();  
        
        Push(num2);           
        Push(num1);           
        
        fib = num1 + num2;     
        Push(fib);             
    }

    fib = Pop();  
    printf("Fibonacci of %d is %.0lf\n", n, fib);  

    return 0;
}


void InitStack()
{
    S.top = -1;  
}


void Push(double num)
{
    if (S.top == SIZE - 1) {
        printf("Stack Overflow!\n");
        return;
    }
    else {
        S.top++;
        S.arr[S.top] = num;
    }
}


double Pop()
{
    if (S.top == -1) {  
        printf("Stack Underflow!\n");
        return -1;
    }
    else {
        double num = S.arr[S.top];
        S.top--;
        return num;
    }
}


int StackEmpty()
{
    return (S.top == -1);  
}


void Display()
{
    printf("\nStack Values:\n");
    while (!StackEmpty())
    {
        printf("\t%lf\n", Pop());  
    }
}
