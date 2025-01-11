#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

void example1();
void example2();
void example3();
void example4();
void example5();
void example6();

void arrfunction(int, float *);
float *arrfunctionret(int);
int *getRandom();
float *arrfunctionmalloc(int);
char *hellomsg(char *);

struct mystruct {
    float arr[3];
};
struct mystruct myStructFunction(int x);

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

    return 0;
}

void example1() {
    // Pass array by reference
    int x = 100;
    float arr[3];
    arrfunction(x, arr);
    printf("Square of %d: %f\n", x, arr[0]);
    printf("cube of %d: %f\n", x, arr[1]);
    printf("Square root of %d: %f\n", x, arr[2]);
}
void arrfunction(int x, float *arr) {
    arr[0] = pow(x, 2);
    arr[1] = pow(x, 3);
    arr[2] = pow(x, 0.5);
}

void example2() {
    // Return static array
    int x = 100, i;
    float *arr = arrfunctionret(x);
    printf("Square of %d: %f\n", x, *arr);
    printf("cube of %d: %f\n", x, arr[1]);
    printf("Square root of %d: %f\n", x, arr[2]);
}
float *arrfunctionret(int x) {
    static float arr[3];
    arr[0] = pow(x, 2);
    arr[1] = pow(x, 3);
    arr[2] = pow(x, 0.5);
    return arr;
}

void example3() {
    int *p;
    int i;
    p = getRandom();
    for (i = 0; i < 10; i++) {
        printf("*(p + %d) : %d\n", i, *(p + i));
    }
}
int *getRandom() {
    static int r[10];
    int i;

    /* set the seed */
    srand((unsigned) time(NULL));
    for (i = 0; i < 10; ++i) {
        r[i] = rand();
        printf("r[%d] = %d\n", i, r[i]);
    }
    return r;
}

// https://www.tutorialspoint.com/cprogramming/c_return_arrays_from_function.htm
void example4() {
    int x = 16, i;
    float *arr = arrfunctionmalloc(x);
    printf("Square of %d: %f\n", x, arr[0]);
    printf("cube of %d: %f\n", x, arr[1]);
    printf("Square root of %d: %f\n", x, arr[2]);
}
float *arrfunctionmalloc(int x) {
    float *arr = (float *) malloc(3 * sizeof(float));
    arr[0] = pow(x, 2);
    arr[1] = pow(x, 3);
    arr[2] = pow(x, 0.5);
    return arr;
}

void example5() {
    // Return string from function

    // Using the same approaches, you can pass and return a string to a
    // function. A string in C is an array of char type. In the following
    // example, we pass the string with a pointer, manipulate it inside the
    // function, and return it back to main().

    // Inside the called function, there is a local string. The string passed is
    // concatenated with the local string before returning.

    char *name = "TutorialsPoint";
    char *arr = hellomsg(name);
    printf("%s\n", arr);
}
char *hellomsg(char *x) {
    char *arr = (char *) malloc(50 * sizeof(char));
    strcpy(arr, "Hello ");
    strcat(arr, x);
    return arr;
}

void example6() {
    int x = 9;
    struct mystruct s = myStructFunction(x);
    printf("Square of %d: %f\n", x, s.arr[0]);
    printf("cube of %d: %f\n", x, s.arr[1]);
    printf("Square root of %d: %f\n", x, s.arr[2]);
}
struct mystruct myStructFunction(int x) {
    struct mystruct s1;
    s1.arr[0] = pow(x, 2);
    s1.arr[1] = pow(x, 3);
    s1.arr[2] = pow(x, 0.5);
    return s1;
}