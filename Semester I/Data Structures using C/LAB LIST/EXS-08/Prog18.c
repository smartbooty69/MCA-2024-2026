/*------------------------------------------------------------------
Write a program in C using a stack to check whether a list of parenthesis ( ), {}, [] are properly balanced.
------------------------------------------------------------------
Clancy Mendonca
25-09-24
-----------------------------------------------------------------*/

#include<stdio.h>
#include<stdlib.h>
#include<string.h>

#define size 100 

typedef struct StackType {
    char A[size];
    int Top;
} STACK;
STACK S;

void InitStack();
void Push(char ch);
char Pop();
int IsStackEmpty();
int IsMatchingPair(char open, char close);

int main() {
    char BracketStr[size];
    int i;
    char Ch;
    
    printf("Enter the string of brackets: ");
    scanf("%s", BracketStr);

    InitStack();

    for(i = 0; i < strlen(BracketStr); i++) {
        char Brkt = BracketStr[i];

        if(Brkt == '(' || Brkt == '{' || Brkt == '[') {
            Push(Brkt);
        } 
        else if(Brkt == ')' || Brkt == '}' || Brkt == ']') {
            if(IsStackEmpty()) {
                printf("Improper bracket alignment.\n");
                return 0;  
            }
            Ch = Pop();  
            if(!IsMatchingPair(Ch, Brkt)) {
                printf("Improper bracket alignment.\n");
                return 0;  
            }
        }
    }

    if(IsStackEmpty()) {
        printf("Brackets are properly aligned.\n");
        printf("Improper alignment of brackets.\n");
    }

    return 0;
}

void InitStack() {
    S.Top = -1;  
}

void Push(char ch) {
    if(S.Top == size - 1) {
        printf("The Stack is full\n");
        return;
    }
    S.Top++;
    S.A[S.Top] = ch;
}

char Pop() {
    if(S.Top == -1) {  
        printf("Stack is empty\n");
        return -1;  
    }
    char ch = S.A[S.Top];
    S.Top--;
    return ch;
}

int IsStackEmpty() {
    return S.Top == -1; 
}

int IsMatchingPair(char open, char close) {
    if(open == '(' && close == ')') return 1;
    if(open == '{' && close == '}') return 1;
    if(open == '[' && close == ']') return 1;
    return 0;
}

