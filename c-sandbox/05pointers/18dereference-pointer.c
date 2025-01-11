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
    int a = 10;
    int *b = &a;
    float x = 10.5;
    float *y = &x;

    printf("Address of 'a': %d Value of 'a': %d\n", b, *b);
    printf("Address of 'x': %d Value of 'x': %f\n", y, *y);
}
void example2() {
    int a = 10;
    int *b = &a;
    float x = 10.5;
    float *y = &x;

    *b = 100;
    *y = 100.50;

    printf("Address of 'a': %d Value of 'a': %d\n", b, *b);
    printf("Address of 'x': %d Value of 'x': %f\n", y, *y);
}
void example3() {
    int a = 10;
    int *b = &a;
    printf("a: %d \n Address: %d \n Value at 'a': %d\n\n", a, b, *b);

    int **c = &b;
    printf(
        "b: %d \n Pointer to 'b' is 'c': %d \n Value at 'b': %d\n", b, c, *c);
    printf("Value of 'a' from 'c': %d", **c);
}

struct book {
    char title[10];
    double price;
    int pages;
};
void example4() {
    struct book b1 = {"Learn C", 650.50, 325};
    struct book *ptr = &b1;

    printf("With -> Operator: \n");
    printf("Title: %s \nPrice: %7.2lf \nNumber of Pages: %d\n\n",
           ptr->title,
           ptr->price,
           ptr->pages);

    printf("With . Operator:\n");
    printf("Title: %s \nPrice: %7.2lf \nNumber of Pages: %d\n",
           b1.title,
           b1.price,
           b1.pages);
}

struct employee {
    char name[10];
    float salary;

    struct dob {
        int d, m, y;
    } d1;
};
void example5() {
    struct employee e1 = {"Arjun", 45000, {12, 5, 1990}};
    struct employee *ptr = &e1;

    printf("Name: %s\n", ptr->name);
    printf("Salary: %f\n", ptr->salary);
    printf("Date of Birth: %d-%d-%d\n", ptr->d1.d, ptr->d1.m, ptr->d1.y);
}