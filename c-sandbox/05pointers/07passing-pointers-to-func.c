#include <math.h>
#include <stdio.h>
#include <string.h>

struct rectangle {
    float len, brd;
    double area;
};

void example1();
void example2();
void example3();
void example4();
void example5();
int add(int *, int *);
int swap(int *x, int *y);
int arrfunction(int, float *);
int compare(char *, char *);
int area(struct rectangle *);

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
    int a = 10, b = 20;
    int c = add(&a, &b);
    printf("Addition: %d", c);
}
void example2() {
    int a = 10;
    int b = 20;
    printf("Before swap, value of a: %d\n", a);
    printf("Before swap, value of b: %d\n", b);

    /* calling a function to swap the values */
    swap(&a, &b);
    printf("After swap, value of a: %d\n", a);
    printf("After swap, value of b: %d\n", b);
}
void example3() {
    int x = 100;
    float arr[3];

    arrfunction(x, arr);

    printf("Square of %d: %f\n", x, arr[0]);
    printf("Cube of %d: %f\n", x, arr[1]);
    printf("Square root of %d: %f\n", x, arr[2]);
}
void example4() {
    char str1[] = "BAT";
    char str2[] = "BALL";
    int ret = compare(str1, str2);
}
void example5() {
    struct rectangle s;
    // scanf("%f %f", &s.len, &s.brd);
    s.len = 2;
    s.brd = 3;
    area(&s);
}
int add(int *x, int *y) {
    int z = *x + *y;
    return z;
}
int swap(int *x, int *y) {
    int z;
    z = *x;
    *x = *y;
    *y = z;
    return 0;
}
int arrfunction(int x, float *arr) {
    arr[0] = pow(x, 2);
    arr[1] = pow(x, 3);
    arr[2] = pow(x, 0.5);
    return 0;
}
int compare(char *x, char *y) {

    int val;

    if (strlen(x) > strlen(y)) {
        printf("Length of Str1 is greater than or equal to the length of Str2");
    } else {
        printf("Length of Str1 is less than the length of Str2");
    }
    return 0;
}
int area(struct rectangle *r) {
    r->area = (double) (r->len * r->brd);
    printf("Length: %f \n Breadth: %f \n Area: %lf\n", r->len, r->brd, r->area);

    return 0;
}