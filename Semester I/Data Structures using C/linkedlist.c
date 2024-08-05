/*------------------------------------------------------------
   Program to create a Linked List
----------------------------------------------------------------------
   Clancy
   18-07-24
-----------------------------------------------------------------*/

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
LISTNODE *SearchListNode(char *str);
void InitList();

int main() {
    int choice;
    char str[100];

    while (1) {
        printf("\nMenu:\n");
        printf("1. Insert a string (into an ordered list)\n");
        printf("2. Display the contents of the list\n");
        printf("3. Remove the first node\n");
        printf("4. Search for a given string in the list\n");
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
                printf("Enter the string to search: ");
                scanf("%s", str);
                LISTNODE *result = SearchListNode(str);
                if (result) {
                    printf("String '%s' found in the list.\n", str);
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
                printf("Invalid choice! Please try again.\n");
        }
    }

    return 0;
}

void InitList() {
    Head = NULL;
}

void InsertListNode(char *str) {
    LISTNODE *Prev, *Curr, *Node;
    Node = (LISTNODE *)malloc(sizeof(LISTNODE));
    strcpy(Node->data, str);
    Node->next = NULL;

    if (Head == NULL || strcmp(str, Head->data) < 0) {
        Node->next = Head;
        Head = Node;
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

void DisplayList() {
    LISTNODE *Curr = Head;
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

void RemoveFirstNode() {
    if (Head == NULL) {
        printf("List is empty. No node to remove.\n");
        return;
    }

    LISTNODE *Temp = Head;
    Head = Head->next;
    free(Temp);
    printf("First node removed.\n");
}

void RemoveLastNode() {
    if (Head == NULL) {
        printf("List is empty. No node to remove.\n");
        return;
    }

    if (Head->next == NULL) {
        free(Head);
        Head = NULL;
        printf("Last node removed. List is now empty.\n");
        return;
    }

    LISTNODE *Prev = NULL, *Curr = Head;
    while (Curr->next != NULL) {
        Prev = Curr;
        Curr = Curr->next;
    }

    Prev->next = NULL;
    free(Curr);
    printf("Last node removed.\n");
}

LISTNODE *SearchListNode(char *str) {
    LISTNODE *Curr = Head;
    while (Curr != NULL) {
        if (strcmp(Curr->data, str) == 0) {
            return Curr;
        }
        Curr = Curr->next;
    }
    return NULL;
}
