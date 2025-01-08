#include <stdbool.h>
#include <stdio.h>

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

void example1() {
    // Declaration of boolean data types
    bool x = true;
    bool y = false;

    printf("True : %d\n", x);
    printf("False : %d", y);

    if (1) {
        printf("\ntrue");
    }
}
void example2() {}
void example3() {}
void example4() {}
void example5() {}