#include <stdio.h>

int factorial(int);
int bSearch(int array[], int start, int end, int element);
int fibonacci(int i);

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
    int a = 5;
    int f = factorial(a);

    printf("a: %d \n", a);
    printf("Factorial of a: %d", f);
}
void example2() {
    int array[] = {5, 12, 23, 45, 49, 67, 71, 77, 82};
    int n = 9;
    int element = 67;
    int index = bSearch(array, 0, n - 1, element);

    if (index == -1) {
        printf("Element not found in the array ");
    } else {
        printf("Element found at index: %d", index);
    }
}
void example3() {
    int i;
    printf("fibonacci: ");
    for (i = 0; i < 10; i++) {
        printf("%d ", fibonacci(i));
    }
}
void example4() {}
void example5() {}

int factorial(int i) {
    /* int i;
    int f = 1;

    for (i = 5; i >= 1; i--) {
      f *= i;
    }
    return f; */

    if (i <= 1) {
        return 1;
    }
    return i * factorial(i - 1);
}

int bSearch(int array[], int start, int end, int element) {

    if (end >= start) {

        int mid = start + (end - start) / 2;

        if (array[mid] == element)
            return mid;

        if (array[mid] > element)
            return bSearch(array, start, mid - 1, element);
        return bSearch(array, mid + 1, end, element);
    }
    return -1;
}

int fibonacci(int i) {

    if (i == 0) {
        return 0;
    }

    if (i == 1) {
        return 1;
    }
    return fibonacci(i - 1) + fibonacci(i - 2);
}