#include <stdio.h>
#define PI 3.14
#define MAX 10

void example1();
void example2();
void example3();
void example4();
void example5();

int main() {
    printf("Value of PI = %d\n", PI);
    printf("Value of MAX = %d\n", MAX);

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

#define square(x) ((x) * (x))
#define MESSAGE() printf("Hello World");
#define LOOP(x) \
    { \
        for (int i = 1; i <= x; i++) \
            printf("Iteration no: %d\n", i); \
    }
void example1() {
    int x = 5;
    printf("x: %d \tSquare of x: %d\n", x, square(x));
    MESSAGE();

    LOOP(x);
}

// #define PI 3.142
#define CIRCUMFERENCE(x) (2 * PI * x)
void example2() {
    int x = 5;
    printf(
        "Circumference of a circle with radius %d is %f", x, CIRCUMFERENCE(x));
}

// Variadic Macros
#define MAX_ARGS 5 // Define maximum number of allowed arguments
#define ARGS(x, ...) \
    do { \
        printf("%d\n", ##__VA_ARGS__); \
    } while (0)
void example3() {
    ARGS(1, 2, 3); // 3 arguments
    ARGS(1, 2, 3, 4, 5, 6); // 6 arguments
}
void example4() {
    printf("File :%s\n", __FILE__);
    printf("Date :%s\n", __DATE__);
    printf("Time :%s\n", __TIME__);
    printf("Line :%d\n", __LINE__);
    printf("ANSI :%d\n", __STDC__);
}
void example5() {}