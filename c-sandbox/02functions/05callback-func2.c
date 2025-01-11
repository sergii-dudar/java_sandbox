#include <math.h>
#include <stdio.h>

int callback(int a, int (*print_callback)(int));
int square(int value);
int root(int value);

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
    int x = 4;

    printf("Square of x: %d is %d\n", x, callback(x, square));
    printf("Square root of x: %d is %d\n", x, callback(x, root));
}
void example2() {}
void example3() {}
void example4() {}
void example5() {}

int callback(int a, int (*callback)(int)) {
    int ret = (*callback)(a);
    return ret;
}

int square(int val) { return val * val; }

int root(int val) { return pow(val, 0.5); }