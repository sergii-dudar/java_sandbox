#include "myheader.h"
#include <stdio.h>

// to run: gcc -o mainh 05header-files.c myheader.c -lm && ./mainh && rm mainh

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
    int p = 10, q = 20;
    double x = 5.25;

    sayHello();
    printf("sum of %d and %d is %d\n", p, q, add(p, q));
    printf("Radius: %lf Area: %lf", x, area(x));
}
void example2() {}
void example3() {}
void example4() {}
void example5() {}