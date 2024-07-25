/*------------------------------------------------------------------------
   User-Defined String Copy Function
---------------------------------------------------------------------------
   Clancy 
   23-07-24
-------------------------------------------------------------------------*/

#include <stdio.h>

void StrCpy(char D[], const char S[]);

int main() {
    char S[100], D[100];

    printf("Enter a string to copy: ");
    gets(S);

    StrCpy(D, S);

    printf("Copied string: %s\n", D);

    return 0;
}

//-----------------------------------
void StrCpy(char D[], const char S[]) {
    int i = 0;

    while (S[i] != '\0') {
        D[i] = S[i];
        i++;
    }

    D[i] = '\0';
}
