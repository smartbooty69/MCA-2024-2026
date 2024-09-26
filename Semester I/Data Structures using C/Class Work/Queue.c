/*-------------------------------------------------------------------------
   Queue.c
---------------------------------------------------------------------------
   Clancy
   05-08-24
  -------------------------------------------------------------------------*/
#include<stdio.h>
#include<stdlib.h>

typedef struct QueueType{
    int NUM;
    struct QueueType *NEXT;
}QUEUENODE;

QUEUENODE *FRONT, *REAR;

void InitQueue();
void EnQueue(int NUM);
void PrintQueue();
void DeQueue();

int main()
{
    int NUM,i,N,choice;

    while (1) {
        printf("\nMenu:\n");
        printf("1. Insert into QUEUE:\n");
        printf("2. Display the contents of the QUEUE\n");
        printf("3. DEQUEUE\n");
        printf("4. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                printf("Enter 5 elements:");
                InitQueue();
                for(i=1;i<=5;i++){
                    scanf("%d",&NUM);
                    EnQueue(NUM);
                }
                break;
            case 2:
                PrintQueue();
                break;
            case 3:
                DeQueue();
                break;
            case 4:
                exit(0);
            default:
                printf("Invalid choice!\n");
        }
    }
    return 0;
}

void InitQueue()
{
    FRONT=REAR=NULL;
}

void EnQueue(int NUM)
{
    QUEUENODE *NODE;
    NODE=(QUEUENODE*)malloc(sizeof(QUEUENODE));
    NODE->NUM=NUM;
    NODE->NEXT=NULL;

    if (FRONT==NULL)
    {
        FRONT=REAR=NODE;
        return;
    }
    
    REAR->NEXT=NODE;
    REAR=NODE;
}

void PrintQueue()
{
    QUEUENODE *CURR;
    CURR=FRONT;
    while(CURR!=NULL){
        printf("%d\t",CURR->NUM);
        CURR=CURR->NEXT;
    }
    printf("\n");
}

void DeQueue()
{
    QUEUENODE *CURR;

    if(FRONT == NULL)
    {
        printf("Queue is empty\n");
        return;
    }

    CURR = FRONT;
    FRONT = FRONT->NEXT;

    if(FRONT == NULL)
    {
        REAR = NULL;
    }

    printf("Dequeued element: %d\n", CURR->NUM);
    free(CURR);
    
}
 