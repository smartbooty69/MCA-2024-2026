/*------------------------------------------------------------------------
   User-Defined String Join Function
---------------------------------------------------------------------------
   Clancy 
   23-07-24
-------------------------------------------------------------------------*/

#include <stdio.h>

void StrJoin(char D[], const char str1[], const char str2[]);

int main() {
    char str1[100], str2[100], result[200];

    printf("Enter first string: ");
    gets(str1);

    printf("Enter second string: ");
    gets(str2);

    StrJoin(result, str1, str2);

    printf("Joined string: %s\n", result);

    return 0;
}

//-----------------------------------
void StrJoin(char D[], const char str1[], const char str2[]) {
    int i = 0, j = 0;

    while (str1[i] != '\0') {
        D[i] = str1[i];
        i++;
    }

    while (str2[j] != '\0') {
        D[i] = str2[j];
        i++;
        j++;
    }

    D[i] = '\0';
}
