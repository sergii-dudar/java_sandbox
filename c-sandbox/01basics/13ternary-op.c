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
    int a = 10;
    (a % 2 == 0) ? printf("%d is Even \n", a) : printf("%d is Odd \n", a);

    if (a % 2 == 0) {
        printf("%d is Even\n", a);
    } else {
        printf("%d is Odd\n", a);
    }
}
void example2() {
    int a = 100, b = 20, c;
    c = (a >= b) ? a : b;
    printf("a: %d b: %d c: %d\n", a, b, c);
}
void example3() {
    /*If you need to put multiple statements in the true and/or false operand of
     * the ternary operator, you must separate them by commas, as shown below
     */

    int a = 100, b = 20, c;
    c = (a >= b) ? printf("a is larger "), c = a : printf("b is larger "),
    c = b;
    printf("a: %d b: %d c: %d\n", a, b, c);
}
void example4() {}
void example5() {}