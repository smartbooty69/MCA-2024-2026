/*--------------------------------------------------------------------------------
    Write a menu driven program in C to show the working of a
    LIKNED LIST having nodes containing a character string (array) as
    the data item and a link to the next node. CHOICES:
        1. Insert a string ( into an ordered list)
        2. Display the contents of the list
        3. Remove the first node
        4. Search for a given string in the list.
        5. Remove the last node
    ( use string functions strcpy() & strcmp() to assign and
    compare strings )
---------------------------------------------------------------------------
   Clancy
   06-08-24
  -------------------------------------------------------------------------*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct ListNode {
    char data[100];
    struct ListNode *next;
} LISTNODE;

LISTNODE *Head = NULL;

void InsertListNode(char *str);
void DisplayList();
void RemoveFirstNode();
void RemoveLastNode();
int SearchListNodeIndex(char *str);
void InitList();

//-----------------------------------

int main() {
    int choice;
    char str[100];

    while (1) {
        printf("\nMenu:\n");
        printf("1. Insert a string\n");
        printf("2. Display the contents\n");
        printf("3. Remove the first node\n");
        printf("4. Search for a string\n");
        printf("5. Remove the last node\n");
        printf("6. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                printf("Enter the string to insert: ");
                scanf("%s", str);
                InsertListNode(str);
                break;
            case 2:
                DisplayList();
                break;
            case 3:
                RemoveFirstNode();
                break;
            case 4:
                int pos;
                pos = SearchListNodeIndex(str);
                printf("Enter the string to search: ");
                scanf("%s", str);
                if (pos != -1) {
                    printf("String '%s' found at position %d in the list.\n", str, pos);
                } else {
                    printf("String '%s' not found in the list.\n", str);
                }
                break;
            case 5:
                RemoveLastNode();
                break;
            case 6:
                exit(0);
            default:
                printf("Invalid choice\n");
        }
    }

    return 0;
}

void InitList() {
    Head = NULL;    
}

//-----------------------------------

void InsertListNode(char *str) {
    LISTNODE *Prev, *Curr, *Node;
    Node = (LISTNODE *)malloc(sizeof(LISTNODE));
    strcpy(Node->data, str);
    Node->next = NULL;

    if(Head==NULL){
        Head=Node;
        return;
    }

    if (strcmp(str, Head->data) < 0) {
        Node->next = Head;
        Head=Node;
        return;
    }

    Curr = Head;
    while (Curr != NULL && strcmp(str, Curr->data) >= 0) {
        Prev = Curr;
        Curr = Curr->next;
    }

    Prev->next = Node;
    Node->next = Curr;
}

//-----------------------------------

void DisplayList() {
    LISTNODE *Curr;
    Curr = Head;
    if (Curr == NULL) {
        printf("List is empty.\n");
        return;
    }

    printf("List contents:\n");
    while (Curr != NULL) {
        printf("%s -> ", Curr->data);
        Curr = Curr->next;
    }
    printf("NULL\n");
}

//-----------------------------------

void RemoveFirstNode() {

    LISTNODE *first;

    if (Head == NULL) {
        printf("List is empty.\n");
        return;
    }

    first = Head;
    Head = Head->next;
    free(first);
    printf("First node removed.\n");
}

//-----------------------------------

void RemoveLastNode() {
    LISTNODE *Prev, *Curr;
    if (Head == NULL) {
        printf("List is empty.\n");
        return;
    }

    if (Head->next == NULL) {
        free(Head);
        Head = NULL;
        printf("List is now empty.\n");
        return;
    }

    Prev = NULL;
    Curr = Head;

    while (Curr->next != NULL) {
        Prev = Curr;
        Curr = Curr->next;
    }

    Prev->next = NULL;
    free(Curr);
    printf("Last node removed.\n");
}

//-----------------------------------

int SearchListNodeIndex(char *str) {
    LISTNODE *Curr;
    Curr = Head;
    int i = 0;

    while (Curr != NULL) {
        if (strcmp(Curr->data, str) == 0) {
            return i; 
        }
        Curr = Curr->next;
        i++;
    }
    return -1; 
}
