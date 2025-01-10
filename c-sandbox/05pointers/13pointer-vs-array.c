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
    /* an array with 5 elements */
    int arr[5] = {10, 20, 30, 40, 50};

    /* output each array element's value */
    printf("Array values with subscripts: \n");
    for (int i = 0; i < 5; i++) {
        printf("arr[%d]: %d\n", i, arr[i]);
    }

    //------------- with pointers
    int *x = arr;
    printf("Array values with pointer: \n");
    for (int i = 0; i < 5; i++) {
        printf("arr[%d]: %d\n", i, *(x + i));
    }
}
void example2() {}
void example3() {}
void example4() {}
void example5() {}