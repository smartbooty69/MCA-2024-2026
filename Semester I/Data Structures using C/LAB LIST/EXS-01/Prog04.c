/*----------------------------------------------------------------------------------------------------------
    Write function sub programs in C to return the length of a string
    and to make a duplicate of a string.
-------------------------------------------------------------------------------------------------------
    CLANCY
    30-7-2024
------------------------------------------------------------------------------------------------------------*/

#include<stdio.h>

int Strlen (char S[]);
void Strcpy (char T[],char S[]);

int main() {
    char S[10], T[10];

    printf("Function program to return the length of a string and to make a duplicate of a string\n");

    printf("Enter the characters: ");
    scanf("%s", S);

    int length = Strlen(S);
    printf("The length of characters: %d\n", length);

    Strcpy(T, S);
    printf("The duplicate characters: %s\n", T);

    return 0;
}

int Strlen(char S[]) {
    int i = 0;
    while (S[i] != '\0') {
        i++;
    }
    return i;
}

void Strcpy(char T[], char S[]) {
    int i = 0;
    while (S[i] != '\0') {
        T[i] = S[i];
        i++;
    }
    T[i] = '\0';
}