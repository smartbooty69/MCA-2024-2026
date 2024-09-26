/*------------------------------------------------------
Write a menu driven program to show the working of a DOUBLY LINKED LIST with options: 
    a) Insert a number 
    b) Display the list 
    c) delete a given number. 
    D) Traverse the list using arrows, forward or backward.
------------------------------------------------
Clancy Mendonca
16-08-24
----------------------------------------------------------*/
#include <stdio.h>
#include <stdlib.h>
#include <conio.h>

#define ESC 27
#define RIGHT 77
#define LEFT 75

typedef struct DblLnkType {
    int Num;
    struct DblLnkType *Next;
    struct DblLnkType *Prev;
} DBLLNKNODE;

DBLLNKNODE *Head;

void initDblLnk();
void insertDblLnkNode(int Num);
void printDblLnkList(DBLLNKNODE *Head);
int keyHit();
void displayOnKeyHit();
void deleteNode(int Num);

int main() {
    int Num, choice;

    printf("Doubly Linked List Operations\n\n");

    initDblLnk();
    while (1) {
        printf("\n1. Insert Node\n");
        printf("2. Print Node\n");
        printf("3. Traversal\n");
        printf("4. Delete\n");
        printf("5. Exit\n");
        printf("\nEnter your choice: ");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                printf("\nEnter a number: ");
                scanf("%d", &Num);

                insertDblLnkNode(Num);
                break;
            case 2:
                if (Head == NULL) {
                    printf("No list\n");
                } else {
                    printf("\nEntered list:");
                    printDblLnkList(Head);
                    printf("\n");
                }
                break;
            case 3:
                displayOnKeyHit();
                break;
            case 4:
                if (Head == NULL) {
                    printf("No list\n");
                } else {
                    printf("Enter a number to delete: ");
                    scanf("%d", &Num);
                    deleteNode(Num);
                }
                break;
            case 5:
                printf("Exiting program...");
                return 0;
            default:
                printf("Invalid choice\n");
                break;
        }
    }
    return 0;
}

void initDblLnk() {
    Head = NULL;
}

void insertDblLnkNode(int Num) {
    DBLLNKNODE *prev, *curr, *Node;
    Node = (DBLLNKNODE *) malloc(sizeof(DBLLNKNODE));
    Node->Num = Num;
    Node->Next = NULL;
    Node->Prev = NULL;

    if (Head == NULL) {
        Head = Node;
        return;
    }

    curr = Head;
    if (Num <= Head->Num) {
        Node->Next = Head;
        Node->Prev = NULL;
        Head = Node;
        return;
    }

    curr = Head;
    while (curr && Num >= curr->Num) {
        prev = curr;
        curr = curr->Next;
    }
    prev->Next = Node;
    Node->Prev = prev;
    Node->Next = curr;
    if (curr != NULL)
        curr->Prev = Node;
}

void printDblLnkList(DBLLNKNODE *Head) {
    DBLLNKNODE *curr, *prev;
    if (Head == NULL) {
        printf("No list\n");
        return;
    }
    curr = Head;
    printf("\nForward linked list:\n");
    while (curr) {
        printf("%d \t", curr->Num);
        prev = curr;
        curr = curr->Next;
    }
    printf("\nBackward linked list:\n");
    curr = prev;
    while (curr) {
        printf("%d \t", curr->Num);
        curr = curr->Prev;
    }
}

int keyHit() {
    int key;

    key = getch();
    if (key == 0) {
        key = getch();
    }
    return key;
}

void displayOnKeyHit() {
    int key;
    DBLLNKNODE *curr;
    curr = Head;
    printf("%d\t", curr->Num);
    while ((key = keyHit()) != ESC) {
        if (key == RIGHT) {
            curr = curr->Next;
            printf("%d\t", curr->Num);
        } else if (key == LEFT) {
            curr = curr->Prev;
            printf("%d\t", curr->Num);
        }
    }
}

void deleteNode(int Num) {
    DBLLNKNODE *curr, *prev;
    curr = Head;

    if (Head == NULL) {
        printf("No list\n");
        return;
    }

    if (Num == Head->Num) {
        Head = Head->Next;
        if (Head != NULL) {
            Head->Prev = NULL;
        }
        free(curr);
        printf("Element %d deleted successfully\n", Num);
        return;
    }

    while (curr && Num != curr->Num) {
        prev = curr;
        curr = curr->Next;
    }

    if (curr && Num == curr->Num) {
        if (curr->Prev != NULL) {
            curr->Prev->Next = curr->Next;
        }
        if (curr->Next != NULL) {
            curr->Next->Prev = curr->Prev;
        }
        free(curr);
        printf("Element %d deleted successfully\n", Num);
        return;
    } else {
        printf("Number not found\n");
    }
}
