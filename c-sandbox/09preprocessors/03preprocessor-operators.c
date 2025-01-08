#include <stdio.h>
#define message() \
    { \
        printf("TutorialsPoint Library contains\n"); \
        printf("High quality Programming Tutorials"); \
    }
#define SHAPE(x) \
    switch (x) { \
        case 1: \
            printf("1. CIRCLE\n"); \
            break; \
        case 2: \
            printf("2. RECTANGLE\n"); \
            break; \
        case 3: \
            printf("3. SQUARE\n"); \
            break; \
        default: \
            printf("default. LINE\n"); \
    }
#define stringize(x) printf(#x "\n")
#define STR_PRINT(x) #x
#define PASTE(arg1, arg2) arg1##arg2
#define TOKENS(X, Y) X##Y

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

void example1() { message(); }
void example2() {
    SHAPE(1);
    SHAPE(2);
    SHAPE(3);
    SHAPE(0);
}
void example3() {
    stringize(Welcome To TutorialsPoint);
    stringize("The Largest Tutorials Library");
    stringize("Having video and Text Tutorials on Programming Languages");

    printf(STR_PRINT(This is a string without double quotes));

    int value_1 = 1000;
    printf("value_1 = %d\n", PASTE(value_, 1));

    printf("value1: %d\n", TOKENS(12, 20));
    printf("value2: %d\n", TOKENS(12, 20) + 10);
}
#define DEBUG 1
void example4() {
#if defined(DEBUG)
    printf("DEBUG mode is on.\n");
#else
    printf("DEBUG mode is off.\n");
#endif
}

#define square(x) ((x) * (x))
void example5() {
#if defined square
    printf("The square of the given number is: %d", square(5));
#endif
}