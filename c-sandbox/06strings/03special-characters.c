#include <stdio.h>

void example1();
void example2();
void example3();
void example4();
void example5();

struct book {
    char title[10];
    double price;
    int pages;
};

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
    struct book b1 = {"Learn C", 675.50, 325};

    printf("Title: %s\n", b1.title);
    printf("Price: %lf\n", b1.price);
    printf("No of Pages: %d\n", b1.pages);
}
void example2() {
    struct book b1 = {"Learn C", 675.50, 325};
    struct book *strptr;
    strptr = &b1;

    printf("Title: %s\n", strptr->title);
    printf("Price: %lf\n", strptr->price);
    printf("No of Pages: %d\n", strptr->pages);
}
void example3() {}
void example4() {}
void example5() {}