#include <stdio.h>
#include <math.h>

// Function prototypes
float fnCTOF(float C);
float fnAreaCircle(float R);
float fnCircumCircle(float R);
float fnAreaTriangle(int a, int b, int c);
int fnIsEven(int Num);

int main() {
    int choice;

    do {
        // Display menu
        printf("\nMenu:\n");
        printf("1. Convert temperature from Celsius to Fahrenheit\n");
        printf("2. Calculate the area of a circle\n");
        printf("3. Calculate the circumference of a circle\n");
        printf("4. Calculate the area of a triangle\n");
        printf("5. Check if a number is even or odd\n");
        printf("6. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);

        // Variables for input
        float C, R;
        int a, b, c, Num;

        // Perform the selected operation
        switch (choice) {
            case 1:
                printf("Enter temperature in Celsius: ");
                scanf("%f", &C);
                printf("Temperature in Fahrenheit: %.2f\n", fnCTOF(C));
                break;
            case 2:
                printf("Enter radius of the circle: ");
                scanf("%f", &R);
                printf("Area of the circle: %.2f\n", fnAreaCircle(R));
                break;
            case 3:
                printf("Enter radius of the circle: ");
                scanf("%f", &R);
                printf("Circumference of the circle: %.2f\n", fnCircumCircle(R));
                break;
            case 4:
                printf("Enter the lengths of the three sides of the triangle:\n");
                printf("a: ");
                scanf("%d", &a);
                printf("b: ");
                scanf("%d", &b);
                printf("c: ");
                scanf("%d", &c);
                printf("Area of the triangle: %.2f\n", fnAreaTriangle(a, b, c));
                break;
            case 5:
                printf("Enter a number: ");
                scanf("%d", &Num);
                if (fnIsEven(Num)) {
                    printf("The number is even.\n");
                } else {
                    printf("The number is odd.\n");
                }
                break;
            case 6:
                printf("Exiting program.\n");
                break;
            default:
                printf("Invalid choice. Please try again.\n");
        }
    } while (choice != 6);

    return 0;
}

// Function definitions
float fnCTOF(float C) {
    return (C * 9.0 / 5.0) + 32;
}

float fnAreaCircle(float R) {
    return 3.14159265358979323846 * R * R; // Using π ≈ 3.14159265358979323846
}

float fnCircumCircle(float R) {
    return 2 * 3.14159265358979323846 * R; // Using π ≈ 3.14159265358979323846
}

float fnAreaTriangle(int a, int b, int c) {
    float s = (a + b + c) / 2.0; // Semi-perimeter
    return sqrt(s * (s - a) * (s - b) * (s - c));
}

int fnIsEven(int Num) {
    return Num % 2 == 0 ? 1 : 0;
}
