#include <stdio.h>

// https://www.tutorialspoint.com/cprogramming/c_pointers_vs_multi_dimensional_arrays.htm
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
    int arr[] = {1, 2, 3, 4, 5};
    int length = sizeof(arr) / sizeof(arr[0]);
    int i = 0;

    int *ptr = arr;

    while (i < length) {
        printf("arr[%d]: %d \n", i, *(ptr + i));
        i++;
    }
}
void example2() {
    int arr[3][4] = {
        {1, 2, 3, 4},
        {5, 6, 7, 8},
        {9, 10, 11, 12},
    };

    // pointer ptr pointing at array num
    int *ptr = &arr[0][0];

    int i, j, k = 0;

    // print the elements of the array num via pointer ptr
    for (i = 0; i < 3; i++) {
        for (j = 0; j < 4; j++) {
            printf("%d   ", *(ptr + k));
            k++;
        }
        printf("\n");
    }
}
void example3() {
    // 2d array
    int arr[3][4] = {{1, 2, 3, 4}, {5, 6, 7, 8}, {9, 10, 11, 12}};

    int ROWS = 3, COLS = 4;
    int i, j;

    // pointer
    int *ptr = &arr[0][0];

    // print the element of the array via pointer ptr
    for (i = 0; i < ROWS; i++) {
        for (j = 0; j < COLS; j++) {
            printf("%4d ", *(ptr + (i * COLS + j)));
        }
        printf("\n");
    }
}
void example4() {
    int i, j, k;
    int arr[3][3][3] = {
        {{11, 12, 13}, {14, 15, 16}, {17, 18, 19}},
        {{21, 22, 23}, {24, 25, 26}, {27, 28, 29}},
        {{31, 32, 33}, {34, 35, 36}, {37, 38, 39}},
    };

    int JMAX = 3, KMAX = 3;
    int *ptr = arr; // &arr[0][0][0];

    for (i = 0; i < 3; i++) {
        for (j = 0; j < 3; j++) {
            for (k = 0; k < 3; k++) {
                printf("%d ", *(ptr + (i * JMAX * KMAX) + (j * KMAX + k)));
            }
            printf("\n");
        }
        printf("\n");
    }
}
void example5() {}