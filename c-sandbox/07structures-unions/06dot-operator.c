#include <stdio.h>
#include <string.h>

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

struct book {
    char title[10];
    double price;
    int pages;
};
void example1() {
    struct book b1 = {"Learn C", 675.50, 325};

    printf("Title: %s\n", b1.title);
    printf("Price: %lf\n", b1.price);
    printf("No of Pages: %d\n", b1.pages);
    printf("size of book struct: %d", sizeof(struct book));
}
// -----------------------------------------------------------
union Data {
    int i;
    float f;
    char str[20];
};
void example2() {
    union Data data;

    data.i = 10;
    data.f = 220.5;
    strcpy(data.str, "C Programming");

    printf("data.i : %d\n", data.i);
    printf("data.f : %f\n", data.f);
    printf("data.str : %s\n", data.str);
}
// -----------------------------------------------------------
struct employee {
    char name[10];
    float salary;
    struct dob {
        int d, m, y;
    } d1;
};
void example3() {
    // Dot Operator with Nested Structure
    struct employee e1 = {"Kiran", 25000, {12, 5, 1990}};

    printf("Name: %s\n", e1.name);
    printf("Salary: %f\n", e1.salary);
    printf("Date of Birth: %d-%d-%d\n", e1.d1.d, e1.d1.m, e1.d1.y);
}
// -----------------------------------------------------------
void example4() {
    // Accessing the Members Using the Arrow Operator
    struct book b1 = {"Learn C", 675.50, 325};
    struct book *strptr;
    strptr = &b1;

    printf("Title: %s\n", strptr->title);
    printf("Price: %lf\n", strptr->price);
    printf("No of Pages: %d\n", strptr->pages);
}
// -----------------------------------------------------------
void example5() {
    struct employee e1 = {"Kiran", 25000, {12, 5, 1990}};
    struct employee *ptr = &e1;

    printf("Name: %s\n", ptr->name);
    printf("Salary: %f\n", ptr->salary);
    printf("Date of Birth: %d-%d-%d\n", ptr->d1.d, ptr->d1.m, ptr->d1.y);
}