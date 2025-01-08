#include <stdio.h>

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

void example1() {
    int marks[10] = {50, 55, 67, 73, 45, 21, 39, 70, 49, 51};
    int i, sum = 0;
    float avg;

    for (i = 0; i <= 9; i++) {
        sum += marks[i];
    }

    avg = (float) sum / 10;
    printf("Average: %f", avg);
}
void example2() {
    int arr[5];
    int i;

    for (i = 0; i <= 4; i++) {
        printf("a[%d]: %d\n", i, arr[i]);
    }

    //----
    int numbers[5] = {10, 20, 30, 40, 50};

    // Printing array elements
    printf("The array elements are : ");
    for (int i = 0; i < 5; i++) {
        printf("%d ", numbers[i]);
    }

    //----
    // initialize all elements to 0, put it inside curly brackets
    int arr1[5] = {0};

    for (int i = 0; i <= 4; i++) {
        printf("a[%d]: %d\n", i, arr1[i]);
    }

    //----
    // Example of Partial and Specific Elements Initialization
    int a[5] = {1, 2, [4] = 4};

    for (int i = 0; i <= 4; i++) {
        printf("a[%d]: %d\n", i, a[i]);
    }

    //---- size
    int arr2[5] = {1, 2, 3, 4, 5};
    printf("Size of array: %ld", sizeof(arr2));
}
void example3() {
    // int
    int a[] = {1, 2, 3, 4, 5};
    for (int i = 0; i < 4; i++) {
        printf("a[%d]: %d \t Address: %d\n", i, a[i], &a[i]);
    }

    printf("\n");
    // double
    double a1[] = {1.1, 2.2, 3.3, 4.4, 5.5};
    for (int i = 0; i < 4; i++) {
        printf("a[%d]: %f \t Address: %ld\n", i, a1[i], &a1[i]);
    }

    printf("\n");
    // char
    char a2[] = "Hello";
    for (int i = 0; i < 5; i++) {
        printf("a[%d]: %c address: %ld\n", i, a2[i], &a2[i]);
    }
}
void example4() {
    int n[5]; /* n is an array of 5 integers */
    int i, j;

    /* initialize elements of array n to 0 */
    for (i = 0; i < 5; i++) {
        n[i] = i + 100;
    }

    /* output each array element's value */
    for (j = 0; j < 5; j++) {
        printf("n[%d] = %d\n", j, n[j]);
    }
}
void example5() {}