/*------------------------------------------------------------
   Program to find the maximum number in an array
----------------------------------------------------------------------
   Clancy
   18-07-24
-----------------------------------------------------------------*/

#include <stdio.h>
#include <stdlib.h>

typedef struct ListType {
    int Num;
    struct ListType *Next;
} LISTNODE;

LISTNODE *Head;

void InitList();
void InsertListNode(int Num);
void PrintList(LISTNODE *Head);

int main()
{
    int Num, i;
    InitList();
    for (i = 1; i <= 5; i++) {
        scanf("%d", &Num);
        InsertListNode(Num);
    }
    PrintList(Head);
    return 0;
}

void InitList()
{
    Head = NULL;
}

void InsertListNode(int Num)
{
    LISTNODE *Node = (LISTNODE*)malloc(sizeof(LISTNODE));
    Node->Num = Num;
    Node->Next = NULL;

    if (Head == NULL) {
        Head = Node;
    } else {
        LISTNODE *Curr = Head;
        while (Curr->Next != NULL) {
            Curr = Curr->Next;
        }
        Curr->Next = Node;
    }
}

void PrintList(LISTNODE *Head)
{
    LISTNODE *Curr = Head;
    while (Curr != NULL) {
        printf("%d\t", Curr->Num);
        Curr = Curr->Next;
    }
    printf("\n");
}
