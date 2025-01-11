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
    // int a = 1;
    // while (a <= 100) {
    // 	printf("a: %d\n", a);
    // 	a++;
    // }

    // for (;;) {
    // 	printf("This loop will run forever. \n");
    // }

    // for loop execution
    for (int a = 1; a <= 5; a++) {
        printf("a: %d -> ", a);
    }

    int a, b;
    // for loop execution
    for (a = 1, b = 1; a <= 5; a++, b++) {
        printf("a: %d b: %d a*b: %d\n", a, b, a * b);
    }
}
void example2() {
    int i;
    int arr[] = {10, 20, 30, 40, 50};
    int sum = 0;
    float avg;

    // for loop execution
    for (i = 0; i < 5; i++) {
        sum += arr[i];
    }
    avg = (float) sum / 5;
    printf("Average = %f", avg);
}
void example3() {
    // local variable definition
    int a = 1;

    // while loop execution
    do {
        printf("Hello World\n");
        a++;
    } while (a <= 5);
    printf("End of loop");
}
void example4() {
    // local variable definition
    int a = 0, b = 0;

    // while loop execution
    printf("Output of while loop: \n");

    while (a < 5) {
        a++;
        printf("a: %d\n", a);
    }

    printf("Output of do-while loop: \n");

    do {
        b++;
        printf("b: %d\n", b);
    } while (b < 5);
}
void example5() {
    int i, j;

    // outer loop
    for (i = 1; i <= 3; i++) {

        // inner loop
        for (j = 1; j <= 3; j++) {
            printf("i: %d j: %d\n", i, j);
        }
        printf("End of Inner Loop \n");
    }
    printf("End of Outer Loop");
}