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
    // initialize an array of ints
    int numbers[5] = {1, 2, 3, 4, 5};
    int i = 0;

    // print the address of the array variable
    printf("numbers = %p\n", numbers);

    // print addresses of each array index
    do {
        printf("numbers[%u] = %p\n", i, (void *) (&numbers[i]));
        i++;
    } while (i < 5);

    // print the size of the array
    printf("sizeof(numbers) = %lu\n", sizeof(numbers));
}
void example2() {}
void example3() {}
void example4() {}
void example5() {}