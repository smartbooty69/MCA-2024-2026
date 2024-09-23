/*---------------------------------------------------------------
   STACKbracets.C 
-----------------------------------------------------------------
   Clancy 
   23-09-24
----------------------------------------------------------------*/

#include <stdio.h>

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

int main() {
    int N;
    double F1, F2, F3;
    int i = 1;  

    InitStack(); 

    
    F1 = 0;
    F2 = 1;

    Push(F1); 
    Push(F2); 

    
    printf("Enter the number of Fibonacci terms to display:\n");
    scanf("%d", &N);

    
    if (N <= 0) {
        printf("Please enter a positive integer.\n");
        return 0;
    } else if (N == 1) {
        printf("Fibonacci Series: 0\n");
        return 0;
    } else if (N == 2) {
        printf("Fibonacci Series: 0, 1\n");
        return 0;
    }

    
    while (i < N) {
        F1 = Pop(); 
        F2 = Pop(); 
        F3 = F1 + F2; 

        Push(F2); 
        Push(F1); 
        Push(F3); 

        i++; 
    }

    
    printf("Fibonacci Series: ");
    Display();

    return 0;
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


void Display() {
    for (int i = S.top; i >= 0; i--) { 
        printf("%.0lf", S.arr[i]);
        if (i != 0) {
            printf(", ");
        }
    }
    printf("\n");
}

#include <stdio.h>
#include <stdlib.h>

#define SIZE 100  

typedef struct StackType {
    char arr[SIZE];
    int top;
} STACK;

void InitStack();
void Push(char ch);
char Pop();
int StackEmpty();
int IsBalanced(const char *exp);

STACK S;

int main() {
    char exp[SIZE];

    printf("Enter an expression with brackets:\n");
    scanf("%s", exp);

    if (IsBalanced(exp)) {
        printf("The expression has balanced brackets.\n");
    } else {
        printf("The expression has unbalanced brackets.\n");
    }

    return 0;
}


void InitStack() {
    S.top = -1; 
}


void Push(char ch) {
    if (S.top == SIZE - 1) {
        printf("Stack Overflow!\n");
        return;
    } else {
        S.top++;
        S.arr[S.top] = ch;
    }
}


char Pop() {
    if (S.top == -1) { 
        return '\0'; 
    } else {
        char ch = S.arr[S.top];
        S.top--;
        return ch;
    }
}


int StackEmpty() {
    return (S.top == -1); 
}


int IsBalanced(const char *exp) {
    InitStack(); 

    for (int i = 0; exp[i] != '\0'; i++) {
        char ch = exp[i];

        
        if (ch == '(' || ch == '{' || ch == '[') {
            Push(ch);
        }
        
        else if (ch == ')' || ch == '}' || ch == ']') {
            
            if (StackEmpty()) {
                return 0; 
            }
            char top = Pop(); 
            
            if ((ch == ')' && top != '(') ||
                (ch == '}' && top != '{') ||
                (ch == ']' && top != '[')) {
                return 0; 
            }
        }
    }

    
    return StackEmpty() ? 1 : 0; 
}
