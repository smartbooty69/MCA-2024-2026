/*------------------------------------------------------------------
Write a program in C using a stack to reverse a string in a separate function.
------------------------------------------------------------------
Clancy Mendonca
18-10-2024
------------------------------------------------------------------*/

#include<stdio.h>
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
void ReverseStringUsingStack(char Str[], char ReversedStr[]);
int IsStackEmpty();

int main() {
    char Str[size], ReversedStr[size];

    printf("Enter a string: ");
    scanf("%s", Str);

    ReverseStringUsingStack(Str, ReversedStr);

    printf("Reversed string: %s\n", ReversedStr);

    return 0;
}

void ReverseStringUsingStack(char Str[], char ReversedStr[]) {
    int len = strlen(Str);
    InitStack();

    for (int i = 0; i < len; i++) {
        Push(Str[i]);
    }

    for (int i = 0; i < len; i++) {
        ReversedStr[i] = Pop();
    }

    ReversedStr[len] = '\0';  
}

void InitStack() {
    S.Top = -1;  
}

void Push(char ch) {
    if (S.Top == size - 1) {
        printf("Stack overflow\n");
        return;
    }
    S.Top++;
    S.A[S.Top] = ch;
}

char Pop() {
    if (S.Top == -1) {
        printf("Stack underflow\n");
        return -1;
    }
    char ch = S.A[S.Top];
    S.Top--;
    return ch;
}

int IsStackEmpty() {
    return S.Top == -1;
}
