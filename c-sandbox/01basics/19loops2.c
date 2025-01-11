#include <stdio.h>
#include <string.h>

void example1();
void example2();
void example3();
void example4();
void example5();

int main() {
    printf(">>>>>--------------EXAMPLE1--------------<<<<<\n");
    example1();

    printf("\n\n>>>>>--------------EXAMPLE2--------------<<<<<\n");
    example2();

    printf("\n\n>>>>>--------------EXAMPLE3--------------<<<<<\n");
    example3();

    printf("\n\n>>>>>--------------EXAMPLE4--------------<<<<<\n");
    example4();

    printf("\n\n>>>>>--------------EXAMPLE5--------------<<<<<\n");
    example5();

    return 0;
}

void example1() {
    int i, j;

    // outer loop
    for (i = 1; i <= 3; i++) {

        // inner loop
        for (j = 1; j <= 3; j++) {
            printf("i: %d j: %d\n", i, j);
        }
        printf("End of Inner Loop \n");
    }
    printf("End of Outer Loop");
}
void example2() {
    int i, j;

    // outer for loop
    for (i = 1; i <= 3; i++) {

        // inner while loop
        j = 1;
        while (j <= 3) {
            printf("i: %d j: %d\n", i, j);
            j++;
        }
        printf("End of Inner While Loop \n");
    }
    printf("End of Outer For loop");
}
void example3() {
    int i, j;
    printf("Program to Print the Tables of 1 to 10 \n");

    // outer loop
    for (i = 1; i <= 10; i++) {

        // inner loop
        for (j = 1; j <= 10; j++) {
            printf("%4d", i * j);
        }
        printf("\n");
    }
}
void example4() {
    int i, j, l;
    char x[] = "TutorialsPoint";
    l = strlen(x);

    // outer loop
    for (i = 0; i < l; i++) {

        // inner loop
        for (j = 0; j <= i; j++) {
            printf("%c", x[j]);
        }
        printf("\n");
    }
}
void example5() {
    int i, j;
    int x[4][4] = {
        {1, 2, 3, 4}, {11, 22, 33, 44}, {9, 99, 999, 9999}, {10, 20, 30, 40}};

    // outer loop
    for (i = 0; i <= 3; i++) {

        // inner loop
        for (j = 0; j <= 3; j++) {
            printf("%5d", x[i][j]);
        }
        printf("\n");
    }
}