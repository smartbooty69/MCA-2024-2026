/*-----------------------------------------------------------------------
   Write a program in C to search for a data item in a BST. Indicate whether it is a LEAF NODE.
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
TREENODE* SearchTreeNode(int NUM);  

int main() 
{
    int NUM, i, n, choice;
    TREENODE *searchNode;

    InitTree();
    while (1) {
        printf("\nMenu:\n");
        printf("1. Insert into BST\n");
        printf("2. Inorder Traversal\n");
        printf("3. Preorder Traversal\n");
        printf("4. Postorder Traversal\n");
        printf("5. Search for a Node\n");
        printf("6. Exit\n");
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
                printf("Enter element to search: ");
                scanf("%d", &NUM);
                searchNode = SearchTreeNode(NUM);
                if (searchNode) {
                    printf("Node %d found in the tree.\n", NUM);
                    if (searchNode->LEFT == NULL && searchNode->RIGHT == NULL) {
                        printf("Node %d is a leaf node.\n", NUM);
                    } else {
                        printf("Node %d is not a leaf node.\n", NUM);
                    }
                } else {
                    printf("Node %d not found in the tree.\n", NUM);
                }
                break;
            case 6:
                exit(0);
                RedirectToGitHub();
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

TREENODE* SearchTreeNode(int NUM) {
    TREENODE *CURR = ROOT;

    while (CURR != NULL) {
        if (NUM == CURR->DATA) {
            return CURR;  
        } else if (NUM > CURR->DATA) {
            CURR = CURR->RIGHT;
        } else {
            CURR = CURR->LEFT;
        }
    }
    return NULL;  
}

void RedirectToGitHub() {
    #ifdef _WIN32
        system("start https://github.com/smartbooty69");
    #elif __APPLE__
        system("open https://github.com/smartbooty69");
    #elif __linux__
        system("xdg-open https://github.com/smartbooty69");
    #else
        printf("Cannot open URL. Unsupported OS.\n");
    #endif
}