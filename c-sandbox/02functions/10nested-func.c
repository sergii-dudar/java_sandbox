#include <stdio.h>
// https://www.geeksforgeeks.org/inline-function-in-c/
void example1();
void example2();
void example3();
void example4();
void example5();

int main() {
    printf(">>>>>--------------EXAMPLE1--------------<<<<<\n");
    example1();

    printf("\n>>>>>--------------EXAMPLE2--------------<<<<<\n");
    example2();

    printf("\n>>>>>--------------EXAMPLE3--------------<<<<<\n");
    example3();

    printf("\n>>>>>--------------EXAMPLE4--------------<<<<<\n");
    example4();

    printf("\n>>>>>--------------EXAMPLE5--------------<<<<<\n");
    example5();

    return 0;
}

void example1() {
    auto int view(); // declare function with auto keyword
    view(); // calling function
    printf("Main\n");

    int view() {
        printf("View\n");
        return 1;
    }

    printf("GEEKS");
}
void example2() {}
void example3() {}
void example4() {}
void example5() {}