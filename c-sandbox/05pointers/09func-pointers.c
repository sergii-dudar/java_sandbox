#include <stdio.h>

void example1();
void example2();
void example3();
void example4();
void example5();

void hello() { printf("Hello World"); }
int addition(int a, int b) { return a + b; }
void swap(int *a, int *b) {
    int c;
    c = *a;
    *a = *b;
    *b = c;
}
float add(int a, int b) { return a + b; }
float subtract(int a, int b) { return a - b; }
float multiply(int a, int b) { return a * b; }
float divide(int a, int b) { return (float) (a / b); }

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
    void (*ptr)() = &hello;

    // Calling function using the
    // function poiter
    (*ptr)();
}
void example2() {
    int (*ptr)(int, int) = addition;
    int x = 10, y = 20;
    int z = (*ptr)(x, y);

    printf("Addition of x: %d and y: %d = %d", x, y, z);
}
void example3() {
    void (*ptr)(int *, int *) = swap;

    int x = 10, y = 20;
    printf("Values of x: %d and y: %d before swap\n", x, y);

    (*ptr)(&x, &y);
    printf("Values of x: %d and y: %d after swap", x, y);
}
void example4() {
    float (*ptr[])(int, int) = {add, subtract, multiply, divide};

    int a = 15, b = 10;

    // 1 for addition, 2 for subtraction
    // 3 for multiplication, 4 for division
    int op = 3;

    if (op > 5)
        return;
    printf("Result: %.2f", (*ptr[op - 1])(a, b));
}
void example5() {}