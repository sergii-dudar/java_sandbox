#include <stdio.h>

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
    // An integer variable
    int a = 100;

    // Pointer to integer
    int *ptr = &a;

    // Pointer to pointer (double pointer)
    int **dptr = &ptr;

    printf("Value of 'a' is : %d\n", a);
    printf("Value of 'a' using pointer (ptr) is : %d\n", *ptr);
    printf("Value of 'a' using double pointer (dptr) is : %d\n", **dptr);
}
void example2() {
    int a = 10;
    int *b = &a;
    printf("a: %d \nAddress of 'a': %d \nValue at a: %d\n\n", a, b, *b);

    int **c = &b;
    printf("b: %d \nPointer to 'b' is c: %d \nValue at b: %d\n", b, c, *c);
    printf("Value of 'a' from 'c': %d\n", **c);

    int ***d = &c;
    printf("Value of 'a' from 'd': %d", ***d);
}
void example3() {}
void example4() {}
void example5() {}