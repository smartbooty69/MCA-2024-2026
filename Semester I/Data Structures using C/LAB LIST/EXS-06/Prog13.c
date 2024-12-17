/*---------------------------------------------------------------
   Write a menu driven program to show the working of a STACK.
-----------------------------------------------------------------
   Clancy 
   09-09-24
----------------------------------------------------------------*/

#include <stdio.h>
#include <stdlib.h>

#define SIZE 5 

typedef struct StackType {
    int A[SIZE];
    int Top;
} STACK;

STACK S;

void push(int Num);
int pop();
int stackEmpty();
void InitStack();
void displayStack();

int main() {
    int choice, value;
    InitStack();
    
    while (1) {
        printf("\nStack Menu:\n");
        printf("1. Push\n");
        printf("2. Pop\n");
        printf("3. Display Stack\n");
        printf("4. Check if Stack is Empty\n");
        printf("5. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);
        
        switch (choice) {
            case 1:
                printf("Enter the value to push: ");
                scanf("%d", &value);
                push(value);
                break;
            case 2:
                value = pop();
                if (value != -1) {
                    printf("Popped value: %d\n", value);
                }
                break;
            case 3:
                printf("Stack contents:\n");
                displayStack();
                break;
            case 4:
                if (stackEmpty() == 1) {
                    printf("Stack is Empty\n");
                } else {
                    printf("Stack is not Empty\n");
                }
                break;
            case 5:
                exit(0);
            default:
                printf("Enter proper number\n");
        }
    }

    return 0;
}


//-----------------------------------
void push(int Num) {
    if (S.Top == SIZE - 1) {
        printf("Stack is Full\n");
    } else {
        S.Top++;
        S.A[S.Top] = Num;
    }
}

//-----------------------------------
int pop() {
    int Num;
    if (S.Top == -1) {
        printf("Stack is Empty\n");
        return -1; 
    } else {
        Num = S.A[S.Top--];
        return Num;
    }
}

//-----------------------------------
int stackEmpty() {
    if (S.Top == -1) {
        return 1;
    } else {
        return -1;
    }
}

//-----------------------------------
void InitStack() {
    S.Top = -1; 
}

//-----------------------------------
void displayStack() {
    int i;
    if (stackEmpty() == 1) {
        printf("Stack is Empty\n");
    } else {
        printf("Top of the Stack ->\n");
        for (i = S.Top; i >= 0; i--) {
            printf("| %d |\n", S.A[i]);
            printf(" __\n");
        }
        printf("\n");
    }
}
