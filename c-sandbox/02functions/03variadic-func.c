#include <stdarg.h>
#include <stdio.h>
#include <string.h>
// https://www.tutorialspoint.com/cprogramming/c_variadic_functions.htm

int addition(int n, ...);
int largest(int n, ...);
char *concat(int n, ...);

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

void example1() { printf("Sum = %d ", addition(5, 1, 2, 3, 4, 5)); }
void example2() {
    printf("Largest number in the list = %d ", largest(5, 12, 34, 21, 45, 32));
}
void example3() {
    char *string1 = concat(2, "Hello", "World");
    printf("%s\n", string1);
    char *string2 = concat(3, "How", "are", "you?");
    printf("%s\n", string2);
}
void example4() {}
void example5() {}
int addition(int n, ...) {

    va_list args;
    int i, sum = 0;

    va_start(args, n);

    for (i = 0; i < n; i++) {
        sum += va_arg(args, int);
    }

    va_end(args);

    return sum;
}
int largest(int n, ...) {
    va_list args;
    int i, max = 0;

    va_start(args, n);

    for (i = 0; i < n; i++) {
        int x = va_arg(args, int);
        if (x >= max)
            max = x;
    }

    va_end(args);
    return max;
}
char *concat(int n, ...) {
    va_list args;
    int i;
    static char string[100], *word;

    va_start(args, n);

    for (i = 0; i < n; i++) {
        word = va_arg(args, char *);
        strcat(string, word);
        strcat(string, " ");
    }

    va_end(args);

    return string;
}