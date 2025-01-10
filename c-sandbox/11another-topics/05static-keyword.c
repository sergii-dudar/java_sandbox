#include <stdio.h>
// https://www.tutorialspoint.com/cprogramming/c_static_keyword.htm
void example1();
void example2();
void example3();
void example4();
void example5();
int counter();

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
    counter();
    counter();
    counter();
}
int counter() {
    static int x;
    printf("Value of x as it enters the function: %d\n", x);
    x++;
    printf("Incremented value of x: %d\n", x);
    return 0;
}

void example2() {}
void example3() {}
void example4() {}
void example5() {}