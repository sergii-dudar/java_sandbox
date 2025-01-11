#include <stdio.h>
#include <stdlib.h>

int *test(int *);
int *getArray();
void getArray2(int *arr, int size);

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
    int a[] = {1, 2, 3, 4};
    int i;
    int *b = test(a);
    for (i = 0; i < 4; i++) {
        printf("%d\n", b[i]);
    }
}
void example2() {
    int *arr = getArray();
    if (arr != NULL) {
        for (int i = 0; i < 5; i++) {
            printf("%d ", arr[i]);
        }
        free(arr); // Free the allocated memory
    }
}
void example3() {
    int arr[5];
    getArray2(arr, 5);
    for (int i = 0; i < 5; i++) {
        printf("%d ", arr[i]);
    }
}
void example4() {}
void example5() {}
int *test(int *a) {
    int i;
    for (i = 0; i < 4; i++) {
        a[i] = 2 * a[i];
    }
    return a;
}
int *getArray() {
    int *arr = (int *) malloc(5 * sizeof(int));
    if (arr == NULL) {
        // Handle memory allocation failure
        return NULL;
    }
    for (int i = 0; i < 5; i++) {
        arr[i] = i + 1;
    }
    return arr;
}
void getArray2(int *arr, int size) {
    for (int i = 0; i < size; i++) {
        arr[i] = i + 1;
    }
}