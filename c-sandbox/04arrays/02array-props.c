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
    int num[10] = {50, 55, 67, 73, 45, 21, 39, 70, 49, 51};
    int size = sizeof(num) / sizeof(int);
    printf("element at lower bound num[0]: %d \n", num[0]);
    printf("at upper bound: %d byte \n", num[size - 1]);
    printf("length of int array: %ld \n", sizeof(num));

    printf("\n");
    double nm[10] = {50, 55, 67, 73, 45, 21, 39, 70, 49, 51};
    size = sizeof(nm) / sizeof(double);
    printf("element at lower bound nm[0]: %f \n", nm[0]);
    printf("element at upper bound: %f \n", nm[size - 1]);
    printf("byte length of double array: %ld \n", sizeof(nm));

    printf("\n");
    int a[] = {1, 2, 3, 4, 5};

    for (int i = 0; i < 4; i++) {
        printf("a[%d]: %d \n", i, a[i]);
    }
}
void example2() {
    // The name of an array is equivalent to a constant pointer to its first
    // element. This lets you use array names and pointers interchangeably in
    // certain contexts.
    int num[10] = {50, 55, 67, 73, 45, 21, 39, 70, 49, 51};
    printf("num[0]: %d Address of 0th element: %d\n", num[0], &num[0]);
    printf("Address of array: %d", num);
}
void example3() {
    int num[10] = {50, 55, 67, 73, 45, 21, 39, 70, 49, 51};
    int size = sizeof(num) / sizeof(int);
    printf(
        "element at lower bound num[0]: %d at upper bound: %d Size of array: %d",
        num[0],
        num[size - 1],
        size);
}
void example4() {
    typedef struct stack {
        int top;
        int arr[10];
    } Stack;
}
void example5() {}