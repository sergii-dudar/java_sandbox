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

struct employee {
    char name[10];
    int age;
    double percent;
};
void example1() {
    int a = 16;
    printf("Size of variable a: %d \n", sizeof(a));
    printf("Size of int data type: %d \n", sizeof(int));
    printf("Size of char data type: %d \n", sizeof(char));
    printf("Size of float data type: %d \n", sizeof(float));
    printf("Size of double data type: %d \n", sizeof(double));

    struct employee e1 = {"Raghav", 25, 78.90};
    printf("Size of employee variable: %d\n", sizeof(e1));

    int arr[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    printf("Size of arr: %d\n", sizeof(arr));

    int arr1[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    int y = sizeof(arr1) / sizeof(int);
    printf("No of elements in arr: %d\n", y);
}
void example2() {}
void example3() {}
void example4() {}
void example5() {}