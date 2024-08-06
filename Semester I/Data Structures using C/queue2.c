/*
queue2.c
Program to initialize, print and display Queue.
clancy
05-08-24
*/

#include<stdio.h>
#include<stdlib.h>
#include<memory.h>

typedef struct QueueType{
	int Num;
	struct QueueType *Next;
}QUEUENODE;
QUEUENODE *Front,*Rear;

void InitQueue();
void Enqueue(int Num);
void PrintQueue(QUEUENODE *Front);
int Dequeue();

int main()
{
	int Num,i,N;
	InitQueue();
	printf("Enter the number of N:");
	scanf("%d",&N);
	for(i=1;i<=N;i++){
		printf("Enter the elements:");
		scanf("%d",&Num);
		Enqueue(Num);
	}
	PrintQueue(Front);
	Dequeue();
	printf("\n The queue after the deletion of the first node:");
	PrintQueue(Front);
}

void InitQueue()
{
	Front=Rear=NULL;
}

void Enqueue(int Num)
{
	QUEUENODE *Curr,*Node;
	
	Node=(QUEUENODE*)malloc(sizeof(QUEUENODE));
	Node->Num=Num;
	Node->Next=NULL;
	
	if(Front==NULL){
		Front=Rear=Node;
		return;
    }
	Rear->Next=Node;
	Rear=Node;
}

void PrintQueue(QUEUENODE *Front)
{
	QUEUENODE *Curr;
	Curr=Front;
	while(Curr!=NULL){
		printf("%d \t",Curr->Num);
		Curr=Curr->Next;
	}
}

int Dequeue()
{
	int Num;
	QUEUENODE *Curr;
	if(Front==NULL){
		return -1;
	}
	if(Front==Rear){
		Num=Front->Num;
	    Front=Rear=NULL;
		return Num;
	}
	Curr=Front;
	Num=Front->Num;
	Front=Front->Next;
	free(Curr);
	return Num;
}