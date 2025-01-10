#include <stdio.h>

const int MAX = 3;
void example1();
void example2();
void example3();
void example4();
void example5();
void example6();
void example7();

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

    printf("\n\n>>>>>--------------EXAMPLE6--------------<<<<<\n");
    example6();

    printf("\n\n>>>>>--------------EXAMPLE7--------------<<<<<\n");
    example7();

    return 0;
}

void example1() {
    int x = 10;
    int *y = &x;

    printf("Value of y before increment: %d\n", y);

    y++;

    printf("Value of y after increment: %d", y);
}
void example2() {
    double x = 10;
    double *y = &x;

    printf("value of y before decrement: %ld\n", y);

    y--;

    printf("value of y after decrement: %ld", y);
}
void example3() {
    int a[] = {10, 20, 30, 40, 50, 60, 70, 80, 90, 100};
    int len = sizeof(a) / sizeof(int);
    int *x = a;
    int i = 0;

    for (i = 0; i < len; i++) {
        printf("Address of subscript %d = %d Value = %d\n", i, x, *x);
        x++;
    }
}
void example4() {
    int int_arr[] = {12, 23, 45, 67, 89};
    int *ptrArr = int_arr;

    printf("Value at ptrArr: %d\n", *ptrArr);

    // Adding 2 in ptrArr
    ptrArr = ptrArr + 2;
    printf("Value at ptrArr after adding 2: %d\n", *ptrArr);
}
void example5() {
    int int_arr[] = {12, 23, 45, 67, 89};
    int *ptrArr = &int_arr[4]; // points to last element

    printf("Value at ptrArr: %d\n", *ptrArr);

    // Subtracting 2 in ptrArr
    ptrArr = ptrArr - 2;

    printf("Value at ptrArr after adding 2: %d\n", *ptrArr);
}
void example6() {
    int a[] = {10, 20, 30, 40, 50, 60, 70, 80, 90, 100};
    int *x = &a[0]; // zeroth element
    int *y = &a[9]; // last element

    printf("Add of a[0]: %ld add of a[9]: %ld\n", x, y);
    printf("Subtraction of two pointers: %ld", y - x);
}
void example7() {
    int var[] = {10, 100, 200};
    int i, *ptr1, *ptr2;

    // Initializing pointers
    ptr1 = var;
    ptr2 = &var[MAX - 1];

    while (ptr1 <= ptr2) {
        printf("Address of var[%d] = %p\n", i, ptr1);
        printf("Value of var[%d] = %d\n", i, *ptr1);

        /* point to the previous location */
        ptr1++;
        i++;
    }
}