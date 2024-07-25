/*------------------------------------------------------------------------
   User-Defined String Length Function
---------------------------------------------------------------------------
   Clancy 
   23-07-24
-------------------------------------------------------------------------*/

#include <stdio.h>

int Strlen(char str[]);

int main() {
    char str[100];
    int i;

    printf("Enter a string: ");
    gets(str);

    i = Strlen(str);

    printf("Length of the string is: %d\n", i);

    return 0;
}

//-----------------------------------
int Strlen(char str[]) {
    int i = 0;

    while (str[i] != '\0') {
        i++;
    }

    return i;
}
