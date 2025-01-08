#include <stdio.h>

int display();

#pragma startup display
#pragma exit display

void example1();
void example2();
void example3();
void example4();
void example5();

int main() {
    example1();
    printf("\n\n");
    example2();
    printf("\n\n");
    example3();
    printf("\n\n");
    example4();
    printf("\n\n");
    example5();

    return 0;
}

void example1() { printf("\nI am in main function"); }
void example2() {}
void example3() {}
void example4() {}
void example5() {}

int display() {
    printf("\nI am in display function");
    return 0;
}