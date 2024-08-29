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
} QUEUENODE;

QUEUENODE *FRONT, *REAR;

void InitQueue();
void EnQueue(int NUM);
void PrintQueue();
void DeQueue();

int main()
{
    int NUM, choice;

    InitQueue(); // Initialize the queue

    while (1) {
        printf("\nMenu:\n");
        printf("1. Insert into QUEUE (ENQUEUE)\n");
        printf("2. Display the contents of the QUEUE\n");
        printf("3. Remove from QUEUE (DEQUEUE)\n");
        printf("4. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                printf("Enter a number to insert into the queue: ");
                scanf("%d", &NUM);
                EnQueue(NUM);
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
    FRONT = REAR = NULL;
}

void EnQueue(int NUM)
{
    QUEUENODE *NODE;
    NODE = (QUEUENODE*)malloc(sizeof(QUEUENODE));
    NODE->NUM = NUM;
    
    if (FRONT == NULL) { 
        FRONT = REAR = NODE;
        REAR->NEXT = FRONT; 
    } else {
        REAR->NEXT = NODE;
        REAR = NODE;
        REAR->NEXT = FRONT; 
    }
}

void PrintQueue()
{
    if (FRONT == NULL) {
        printf("Queue is empty\n");
        return;
    }

    QUEUENODE *CURR = FRONT;
    do {
        printf("%d\t", CURR->NUM);
        CURR = CURR->NEXT;
    } while (CURR != FRONT);
    printf("\n");
}

void DeQueue()
{
    if (FRONT == NULL) {
        printf("Queue is empty\n");
        return;
    }

    QUEUENODE *CURR = FRONT;
    if (FRONT == REAR) { 
        FRONT = REAR = NULL;
    } else {
        FRONT = FRONT->NEXT;
        REAR->NEXT = FRONT; 
    }
    
    printf("Dequeued element: %d\n", CURR->NUM);
    free(CURR);
}
