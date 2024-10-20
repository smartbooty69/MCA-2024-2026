/*------------------------------------------------
   Write a program in C to evaluate a postfix expression using a stack.
---------------------------------------------------
   Clancy Mendonca
   21-10-2024
---------------------------------------------*/

#include <stdio.h>
#include <ctype.h>  

#define SIZE 25

typedef struct StackType {
    int Items[SIZE];
    int Top;
} STACK;

STACK S;

void Push(int val);
int Pop(void);
void InitStack(void);
int EvaluatePostfix(char Postfix[]);

int main(void) {
    char Postfix[30];
    int result;

    InitStack();

    printf("\nEnter a POSTFIX expression:\n");
    gets(Postfix);

    result = EvaluatePostfix(Postfix);

    printf("\nThe result of the POSTFIX expression is: %d\n", result);

    return 0;
}

//-----------------------------------
void InitStack(void) {
    S.Top = -1;
}

//-----------------------------------
void Push(int val) {
    if (S.Top == SIZE - 1) {
        printf("Stack is full\n");
    } else {
        S.Top++;
        S.Items[S.Top] = val;
    }
}

//-----------------------------------
int Pop(void) {
    if (S.Top == -1) {
        printf("Stack is empty\n");
        return -1;
    } else {
        return S.Items[S.Top--];
    }
}

//-----------------------------------
int EvaluatePostfix(char Postfix[]) {
    int i = 0;
    char Token;
    int val1, val2;

    while (Postfix[i] != '\0') {
        Token = Postfix[i];

        if (isdigit(Token)) {
            Push(Token - '0'); 
        }
       
        else {
            val2 = Pop();
            val1 = Pop();

            switch (Token) {
                case '+':
                    Push(val1 + val2);
                    break;
                case '-':
                    Push(val1 - val2);
                    break;
                case '*':
                    Push(val1 * val2);
                    break;
                case '/':
                    Push(val1 / val2);
                    break;
                default:
                    printf("Invalid operator: %c\n", Token);
                    return -1;
            }
        }
        i++;
    }

    return Pop();  
}
