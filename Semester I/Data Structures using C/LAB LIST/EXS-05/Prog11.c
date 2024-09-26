/*--------------------------------------------------------------------------------
   Write program in C to input some strings into a character matrix and sort them using BUBBLE SORT
---------------------------------------------------------------------------
   Clancy
   23-07-24
  -------------------------------------------------------------------------*/

#include<stdio.h>
#include<stdlib.h>

void input(int N,int A[20]);
void output(int N,int A[20]);
void selectionSort(int N,int A[20]);

void main()
{

    int N,A[20];

    printf("Enter size of array: ");
    scanf("%d",&N);

    printf("\nEnter elements of array: ");
    input(N,A);

    printf("\nDisplay elements of array: ");
    output(N,A);

    printf("\n\nDisplay sorted array: ");
    selectionSort(N,A);
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
       printf("%d ",A[i]);
   }
}

//-----------------------------------
void selectionSort(int N,int A[30])
{
    int i,j,temp=0,min;

    for(i=0;i<N-1;i++){
        min=i;
        for(j=i+1;j<N;j++){
            if(A[j]<A[min]){
                min=j;
            }
        }
        // if (min != i) {
            temp=A[min];
            A[min]=A[i];
            A[i]=temp;
        // }
    }

    output(N,A);

}