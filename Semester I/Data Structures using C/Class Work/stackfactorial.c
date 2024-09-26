/*---------------------------------------------------------------
   stackfactorial.C 
-----------------------------------------------------------------
   Clancy 
   23-09-24
----------------------------------------------------------------*/

#include<stdio.h>
#include<stdlib.h>

#define size 100 

typedef struct StackType{
    int A[size];
    int Top;
} STACK;

STACK S;

void InitStack();
void Push(int Num);
int Pop();
int Fact();

int main()
{
    int N;
    int Factorial;
        
    InitStack();
    
    printf("\nEnter the number: ");
    scanf("%d", &N); 

    Factorial = Fact(N); 
    
    printf("\nThe factorial of %d is: %d\n", N, Factorial);

    return 0;
}

void InitStack(){
    S.Top = 0; 
}

void Push(int Num)
{
    if(S.Top == size){
        printf("\nThe Stack is full\n");
        return;
    }
    S.A[S.Top] = Num;
    S.Top++; 
}

int Pop()
{
    if(S.Top == 0){
        printf("\nStack is empty\n");
        return 0;
    }
    S.Top--; 
    return S.A[S.Top];
}

int Fact(int N)
{
    int i = 1;
    Push(1); 
    
    while(i <= N){
        int Num = Pop(); 
        Push(Num * i);   
        i++;
    }
    
    return Pop(); 
}
