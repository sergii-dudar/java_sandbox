#include <stdio.h>

void example1();
void example2();
void example3();
void example4();
void example5();
int swap(int *x, int *y);
int max(int *arr, int length);
void funAddSub(int a, int b, int *add, int *sub);

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
    int arr[] = {1, 2, 3, 4, 5};
    int *ptr = arr;

    for (int i = 0; i <= 4; i++) {
        printf("arr[%d]: %d\n", i, *ptr);
        ptr++;
    }
}
void example2() {
    int a = 10;
    int b = 20;

    printf("Before swap, value of a : %d\n", a);
    printf("Before swap, value of b : %d\n", b);

    /* calling a function to swap the values */
    swap(&a, &b);

    printf("After swap, value of a: %d\n", a);
    printf("After swap, value of b: %d\n", b);
}
void example3() {
    int arr[] = {10, 34, 21, 78, 5};
    int length = sizeof(arr) / sizeof(int);

    int maxnum = max(arr, length);
    printf("max: %d", maxnum);
}
void example4() {
    int num1 = 10;
    int num2 = 3;

    // Variables to store results
    int res1, res2;

    // Calling function to get add and sub
    // by passing the address of res1 and res2
    funAddSub(num1, num2, &res1, &res2);

    // Printing the result
    printf("Addition is %d and subtraction is %d", res1, res2);
}
void example5() {}

int swap(int *x, int *y) {
    int z;
    z = *x; /* save the value at address x */
    *x = *y; /* put y into x */
    *y = z; /* put z into y */

    return 0;
}
int max(int *arr, int length) {

    int max = *arr;

    for (int i = 0; i < length; i++) {
        printf("arr[%d]: %d\n", i, (*arr));

        if ((*arr) > max)
            max = (*arr);
        arr++;
    }
    return max;
}
void funAddSub(int a, int b, int *add, int *sub) {
    *add = a + b;
    *sub = a - b;
}