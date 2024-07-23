#include <stdio.h>

// Recursive function to calculate Fibonacci
unsigned long long fibonacci(int n) {
    if (n == 0)
        return 0;
    else if (n == 1)
        return 1;
    else
        return fibonacci(n - 1) + fibonacci(n - 2);
}

int main() {
    int number;
    printf("Enter a number: ");
    scanf("%d", &number);
    
    if (number < 0)
        printf("Fibonacci is not defined for negative numbers.\n");
    else
        printf("Fibonacci of %d is %llu\n", number, fibonacci(number));
    
    return 0;
}




#include <stdio.h>

// Recursive function to calculate factorial
unsigned long long factorial(int n) {
    if (n == 0)
        return 1;
    else
        return n * factorial(n - 1);
}

int main() {
    int number;
    printf("Enter a number: ");
    scanf("%d", &number);
    
    if (number < 0)
        printf("Factorial is not defined for negative numbers.\n");
    else
        printf("Factorial of %d is %llu\n", number, factorial(number));
    
    return 0;
}

