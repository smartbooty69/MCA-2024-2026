/*-----------------------------------------------------------------------
    Write a menu driven program to show the working of a BINARY SEARCH TREE with options: 
        a) Insert a number 
        b) Display using INORDER traversal 
            a) PREORDER traversal 
            b) POST ORDER traversal.
-------------------------------------------------------------------------
   Clancy
   12-08-24
-------------------------------------------------------------------------*/

#include<stdio.h>
#include<stdlib.h>

typedef struct TreeType {
    int DATA;
    struct TreeType *LEFT, *RIGHT;
} TREENODE;

TREENODE *ROOT;

void InitTree();
void InsertTreeNode(int NUM);
void Inorder(TREENODE *ROOT);
void Preorder(TREENODE *ROOT);
void Postorder(TREENODE *ROOT);

int main() 
{
    int NUM, i, n, choice;

    InitTree();
    while (1) {
        printf("\nMenu:\n");
        printf("1. Insert into BST\n");
        printf("2. Inorder Traversal\n");
        printf("3. Preorder Traversal\n");
        printf("4. Postorder Traversal\n");
        printf("5. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                printf("Enter the number of nodes: ");
                scanf("%d", &n);
                for (i = 1; i <= n; i++) {
                    printf("Enter %d element: ", i);
                    scanf("%d", &NUM);
                    InsertTreeNode(NUM);
                }
                break;
            case 2:
                printf("\nInorder Traversal: ");
                Inorder(ROOT);
                printf("\n");
                break;
            case 3:
                printf("\nPreorder Traversal: ");
                Preorder(ROOT);
                printf("\n");
                break;
            case 4:
                printf("\nPostorder Traversal: ");
                Postorder(ROOT);
                printf("\n");
                break;
            case 5:
                exit(0);
            default:
                printf("Invalid choice!\n");
        }
    }
    return 0;
}

void InitTree() {
    ROOT = NULL;
}

void InsertTreeNode(int NUM) {
    TREENODE *CURR, *NODE, *PREV;
    NODE = (TREENODE*)malloc(sizeof(TREENODE));
    NODE->DATA = NUM;
    NODE->LEFT = NODE->RIGHT = NULL;

    if (ROOT == NULL) {
        ROOT = NODE;
        return;
    }

    CURR = ROOT;
    while (CURR) {
        PREV = CURR;
        if (NUM > CURR->DATA) {
            CURR = CURR->RIGHT;
        } else {
            CURR = CURR->LEFT;
        }
    }

    if (NUM > PREV->DATA) {
        PREV->RIGHT = NODE;
    } else {
        PREV->LEFT = NODE;
    }
}

void Inorder(TREENODE *ROOT) {
    if (ROOT) {
        Inorder(ROOT->LEFT);
        printf("%d\t", ROOT->DATA);
        Inorder(ROOT->RIGHT);
    }
}

void Preorder(TREENODE *ROOT) {
    if (ROOT) {
        printf("%d\t", ROOT->DATA);
        Preorder(ROOT->LEFT);
        Preorder(ROOT->RIGHT);
    }
}

void Postorder(TREENODE *ROOT) {
    if (ROOT) {
        Postorder(ROOT->LEFT);
        Postorder(ROOT->RIGHT);
        printf("%d\t", ROOT->DATA);
    }
}
