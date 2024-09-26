/*---------------------------------------------------------------
   infixpostfix.C
-----------------------------------------------------------------
   Clancy 
   26-09-24
----------------------------------------------------------------*/

#include <stdio.h>
#include <string.h>
#include <conio.h>

#define SIZE 25

typedef struct StackType {
    int Optrs[SIZE]; 
    int Top;         
} STACK;

STACK S; 

void Push(int Optr);
int Pop(void);
int StackEmpty(void);
void InitStack(void);
char *InfixToPost(char InFix[]);
int Precedence(char Optr);

int main(void) {
    char InFix[30], PostFix[30];

    InitStack();
    printf("PROGRAM TO CONVERT INFIX EXPRESSION INTO POSTFIX EXPRESSION\n");

    printf("\nEnter an INFIX expression:\n");
    gets(InFix);

    strcpy(PostFix, InfixToPost(InFix));

    printf("\nThe POSTFIX expression is: \n");
    puts(PostFix);
    getch();

    return 1;
}

//-----------------------------------
void InitStack(void) {
    S.Top = -1; 
}

//-----------------------------------
void Push(int Optr) {
    if (S.Top == SIZE - 1) {
        printf("Stack full\n");
    } else {
        S.Top++;
        S.Optrs[S.Top] = Optr;
    }
}

//-----------------------------------
int Pop(void) {
    int Optr;
    if (S.Top == -1) {
        printf("Stack is empty\n");
        return -1;
    } else {
        Optr = S.Optrs[S.Top];
        S.Top--;
        return Optr;
    }
}

//-----------------------------------
int StackEmpty(void) {
    return S.Top == -1 ? 1 : 0;
}

//-----------------------------------
int Precedence(char Optr) {
    switch (Optr) {
        case '+':
        case '-':
            return 1;
        case '*':
        case '/':
            return 2;
        case '^':
            return 3;
        default:
            return 0;
    }
}

//-----------------------------------
char* InfixToPost(char InFix[]) {
    static char PostFix[30]; 
    int i, j = 0;
    char Token;

    for (i = 0; InFix[i] != '\0'; i++) {
        Token = InFix[i];

        if ((Token >= 'A' && Token <= 'Z') || (Token >= 'a' && Token <= 'z') || (Token >= '0' && Token <= '9')) {
            PostFix[j++] = Token;
        }
        
        else if (Token == '(') {
            Push(Token);
        }
        
        else if (Token == ')') {
            while (!StackEmpty() && (char)S.Optrs[S.Top] != '(') {
                PostFix[j++] = (char)Pop();
            }
            Pop(); 
        }
        
        else {
            while (!StackEmpty() && Precedence((char)S.Optrs[S.Top]) >= Precedence(Token)) {
                PostFix[j++] = (char)Pop();
            }
            Push(Token);
        }
    }

    while (!StackEmpty()) {
        PostFix[j++] = (char)Pop();
    }

    PostFix[j] = '\0'; 
    return PostFix;
}
