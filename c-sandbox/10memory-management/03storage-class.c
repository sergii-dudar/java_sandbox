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

void func(void);
static int count = 5; /* global variable */
void example1() {
    // The static Storage Class
    while (count--) {
        func();
    }
}
void func(void) {

    static int i = 5; /* local static variable */
    i++;

    printf("i is %d and count is %d\n", i, count);
}
void example2() {}
void example3() {}
void example4() {}
void example5() {}