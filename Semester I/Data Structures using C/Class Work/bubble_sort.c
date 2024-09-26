/*--------------------------------------------------------------------------------
   BubbleSort
---------------------------------------------------------------------------
   Clancy
   22-07-24
  -------------------------------------------------------------------------*/

#include<stdio.h>
#include<stdlib.h>

void input(int N,int A[20]);
void output(int N,int A[20]);
void bubblesort(int N,int A[20]);

void main()
{

    int N,A[20];

    printf("enter size of array:\n");
    scanf("%d",&N);

    printf("enter elements of array:\n");
    input(N,A);

    printf("display elements of array:\n");
    output(N,A);

    printf("\nDisplay sorted array:\n");
    bubblesort(N,A);

}

//-----------------------------------
void input(int N,int A[20])
{
   int i;
   for(i=0;i<N;i++){
       scanf("%d",&A[i]);
   }
}

//-----------------------------------
void output(int N,int A[20])
{
   int i;
   for(i=0;i<N;i++){
       printf("%d\t",A[i]);
   }
}

//-----------------------------------
void bubblesort(int N,int A[30])
{
    int i,j,temp=0;
    for(i=0;i<N-1;i++){
        for(j=0;j<N-i-1;j++){
           if(A[j]>A[j+1])
           {
               temp=A[j];
               A[j]=A[j+1];
               A[j+1]=temp;
           }
        }
    }
    for(i=0;i<N;i++){
        printf("%d\t",A[i]);
    }
}