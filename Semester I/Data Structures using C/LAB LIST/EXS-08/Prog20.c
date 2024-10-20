/*------------------------------------------------------------------
Write a program in C using a stack to check whether a given string is a palindrome.
------------------------------------------------------------------
Clancy Mendonca
18-10-2024
------------------------------------------------------------------*/

#include<stdio.h>
#include<string.h>

#define SIZE 100

typedef struct StackType {
    char A[SIZE];
    int Top;
} STACK;

STACK S;

void InitStack();
void Push(char ch);
char Pop();
int IsStackEmpty();
int IsPalindrome(char Str[]);

int main() {
    char Str[SIZE];

    printf("Enter a string: ");
    scanf("%s", Str);

    if(IsPalindrome(Str)) {
        printf("The string is a palindrome.\n");
    } else {
        printf("The string is not a palindrome.\n");
    }

    return 0;
}

int IsPalindrome(char Str[]) {
    int len = strlen(Str);
    InitStack();
    
    for(int i = 0; i < len; i++) {
        Push(Str[i]);
    }

    for(int i = 0; i < len; i++) {
        if(Pop() != Str[i]) {
            return 0;  
        }
    }

    return 1; 
}

void InitStack() {
    S.Top = -1;  
}

void Push(char ch) {
    if(S.Top == SIZE - 1) {
        printf("Stack overflow\n");
        return;
    }
    S.Top++;
    S.A[S.Top] = ch;
}

char Pop() {
    if(S.Top == -1) {
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
