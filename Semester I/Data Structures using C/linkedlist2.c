/*------------------------------------------------------------
   Program to create a Linked List
----------------------------------------------------------------------
   Clancy
   18-07-24
-----------------------------------------------------------------*/

#include<stdio.h>
#include<stdlib.h>

typedef struct ListType{
        int Num;
        struct ListType *Next;
}LISTNODE;

LISTNODE *Head;

void InitList();
void InsertListNode(int Num);
void PrintList(LISTNODE *Head);

int main()
{
    int Num,i,N;
    printf("Enter elements:");
    InitList();
    for(i=1;i<=5;i++){
    scanf("%d",&Num);
    InsertListNode(Num);
    }
    PrintList(Head);
    return 0;
}

void InitList()
{
    Head=NULL;
}

void InsertListNode(int Num)
{
    LISTNODE *Prev,*Curr,*Node;
    Node=(LISTNODE*)malloc(sizeof(LISTNODE));
    Node->Num=Num;
    Node->Next=NULL;
    
    if(Head==NULL){
        Head=Node;
        return;
    }

    if(Num<Head->Num){
        Node->Next=Head;
        Head=Node;
    }

    Curr=Head;

    while(Curr!=NULL && Num>=Curr->Num){
        Prev=Curr;
        Curr=Curr->Next;
    }

    Prev->Next=Node;
    Node->Next=Curr;

}


void PrintList(LISTNODE *Head)
{
    LISTNODE *Curr;
    Curr=Head;
    char ch;
    while(Curr!=NULL){
        printf("%d\t",Curr->Num);
        Curr=Curr->Next;
    }
    while (1)
    {
        printf("");
        switch (ch)
        {
        case 1:
            DeleteFirstNode();
            break;
        
        case 2:
            DeleteLastNode();
            break;

        case 3:
            DeleteSpecificNode();
            break;
        case 4:
            CountNode();
            break;
        case 5:
            SearchNode();
            break;
        default:
            printf("Write proper input Man");
            break;
        }
    }
    
}

DeleteFirstNode(){
    int Num;
    LISTNODE *curr;
}