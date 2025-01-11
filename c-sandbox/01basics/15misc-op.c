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
    float var1 = 10.55;
    float *floatptr = &var1;

    printf("var1: %f address of var1: %d\n", var1, &var1);
    printf("floatptr: %d address of floatptr: %d\n", floatptr, &floatptr);
    printf("var1: %f value at floatptr: %f", var1, *floatptr);
}

struct book {
    char title[10];
    double price;
    int pages;
};
void example2() {
    struct book b1 = {"Learn C", 675.50, 325};
    printf("Title: %s\n", b1.title);
    printf("Price: %lf\n", b1.price);
    printf("No of Pages: %d\n", b1.pages);
    printf("size of book struct: %d", sizeof(struct book));
}
void example3() {

    /*C defines the arrow (→) symbol to be used with struct pointer as
     * indirection operator (also called struct dereference operator). It helps
     * to access the elements of the struct variable to which the pointer
     * reference to.
     */

    struct book b1 = {"Learn C", 675.50, 325};
    struct book *strptr;
    strptr = &b1;
    printf("Title: %s\n", strptr->title);
    printf("Price: %lf\n", strptr->price);
    printf("No of Pages: %d\n", strptr->pages);
}
void example4() {}
void example5() {}