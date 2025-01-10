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
    // int a[5], i;
    //
    // for (i = 0; i <= 4; i++) {
    // 	scanf("%d", &a[i]);
    // }
    //
    // for (i = 0; i <= 4; i++) {
    // 	printf("a[%d] = %d\n", i, a[i]);
    // }
    int a = 5;
    int *b = &a;

    printf("Address of a: %d\n", b);
    b++;
    printf("After increment, Address of a: %d\n", b);
}
void example2() {
    int arr[5] = {1, 2, 3, 4, 5};
    int *b = arr;

    printf("Address of a[0]: %d value at a[0] : %d\n", b, *b);

    b++;
    printf("Address of a[1]: %d value at a[1] : %d\n", b, *b);

    b++;
    printf("Address of a[2]: %d value at a[2] : %d\n", b, *b);

    b++;
    printf("Address of a[3]: %d value at a[3] : %d\n", b, *b);

    b++;
    printf("Address of a[4]: %d value at a[4] : %d\n", b, *b);
}
void example3() {
    int arr[5] = {1, 2, 3, 4, 5};
    int *b = arr;
    int i;

    for (i = 0; i <= 4; i++) {
        printf("a[%d] = %d\n", i, *(b + i));
    }
}
void example4() {
    int arr[5] = {1, 2, 3, 4, 5};
    int *b = arr;
    int i;
    for (i = 0; i <= 4; i++) {
        printf("a[%d] = %d\n", i, *b);
        b++;
    }
}
void example5() {}