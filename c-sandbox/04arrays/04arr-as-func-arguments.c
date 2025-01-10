#include <stdio.h>
#include <string.h>

void example1();
void example2();
void example3();
void example4();
void example5();
void example6();
void example7();

float average(int arr[5]);
float average2(int arr[], int length);
int max(int *arr, int length);
int max2(int *arr, int length);
void twoDarr(int *arr);
void compare(char *, char *);

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
    // Pass array with call by value method
    int arr[] = {10, 34, 21, 78, 5};
    float avg = average(arr);
    printf("average: %f", avg);
}
float average(int arr[5]) {
    int sum = 0;
    int i;
    for (i = 0; i < 5; i++) {
        printf("arr[%d]: %d\n", i, arr[i]);
        sum += arr[i];
    }
    return (float) sum / 5;
}

void example2() {
    int arr[] = {10, 34, 21, 78, 5};
    int length = sizeof(arr) / sizeof(int);
    float avg = average2(arr, length);
    printf("average: %f", avg);
}
float average2(int arr[], int length) {
    int sum = 0;
    int i;
    for (i = 0; i < length; i++) {
        printf("arr[%d]: %d\n", i, arr[i]);
        sum += arr[i];
    }
    return (float) sum / length;
}

void example3() {
    // Pass array with call by reference
    // x is the pointer to the array. It points to the 0th element. If the
    // pointer is incremented by 1, it points to the next element.

    int a[] = {1, 2, 3, 4, 5};
    int *x = a, i;
    for (i = 0; i < 5; i++) {
        printf("%d\n", *x);
        x++;
    }
}

void example4() {
    int arr[] = {10, 34, 21, 78, 5};
    int length = sizeof(arr) / sizeof(int);
    // int maxnum = max(arr, length);
    int maxnum = max2(arr, length);
    printf("max: %d", maxnum);
}
int max(int *arr, int length) {
    // The max() function receives the address of the array from main() in the
    // pointer arr. Each time, when it is incremented, it points to the next
    // element in the original array.
    int max = *arr;
    int i;
    for (i = 0; i < length; i++) {
        printf("arr[%d]: %d\n", i, (*arr));
        if ((*arr) > max)
            max = (*arr);
        arr++;
    }
    return max;
}

int max2(int *arr, int length) {
    // The max() function can also access the array elements as a normal
    // subscripted array as in the following definition −
    int max = *arr;
    int i;
    for (i = 0; i < length; i++) {
        printf("arr[%d]: %d\n", i, arr[i]);
        if (arr[i] > max)
            max = arr[i];
    }
    return max;
}

void example5() {
    int arr[][3] = {10, 34, 21, 78, 5, 25};
    twoDarr(*arr);
}
void twoDarr(int *arr) {
    int max = *arr;
    int i, j;
    for (i = 0; i < 2; i++) {
        for (j = 0; j < 3; j++) {
            printf("%d\t", arr[i]);
            arr++;
        }
        printf("\n");
    }
}

void example6() {
    char a[] = "BAT";
    char b[] = "BALL";
    compare(a, b);
}
void compare(char *x, char *y) {
    int val;
    if (strlen(x) > strlen(y)) {
        printf(
            "length of string a is greater than or equal to length of string b");
    } else {
        printf("length of string a is less than length of string b");
    }
}

void modifyArray(int arr[], int size) {
    for (int i = 0; i < size; i++) {
        arr[i] = arr[i] * 2;
    }
}
void example7() {
    // In C, arrays are always passed to functions by reference, not by value.
    // This means that when you pass an array to a function, what is actually
    // passed is a pointer to the first element of the array. The function can
    // then modify the contents of the array.

    int myArray[] = {1, 2, 3, 4, 5};
    int size = sizeof(myArray) / sizeof(myArray[0]);

    printf("Original array: ");
    for (int i = 0; i < size; i++) {
        printf("%d ", myArray[i]);
    }
    printf("\n");

    // Passing the array to the function
    modifyArray(myArray, size);

    printf("Modified array: ");
    for (int i = 0; i < size; i++) {
        printf("%d ", myArray[i]);
    }
    printf("\n");
}