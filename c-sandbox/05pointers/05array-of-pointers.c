#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Declaring a structure
typedef struct {
    char title[50];
    float price;
} Book;
const int MAX = 3;

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
    // Declaring integers
    int var1 = 1;
    int var2 = 2;
    int var3 = 3;

    // Declaring an array of pointers to integers
    int *ptr[3];

    // Initializing each element of
    // array of pointers with the addresses of
    // integer variables
    ptr[0] = &var1;
    ptr[1] = &var2;
    ptr[2] = &var3;

    // Accessing values
    for (int i = 0; i < 3; i++) {
        printf("Value at ptr[%d] = %d\n", i, *ptr[i]);
    }
}
void example2() {
    int var[] = {10, 100, 200};
    int length = sizeof(var) / sizeof(int);
    int i, *ptr[length];

    for (i = 0; i < length; i++) {
        ptr[i] = &var[i]; /* assign the address of integer. */
    }

    for (i = 0; i < length; i++) {
        printf("Value of var[%d] = %d\n", i, *ptr[i]);
    }
}
void example3() {
    int length = 4;
    char *names[] = {"Zara Ali", "Hina Ali", "Nuha Ali", "Sara Ali"};

    int i = 0;

    for (i = 0; i < length; i++) {
        printf("Value of names[%d] = %s\n", i, names[i]);
    }
}
void example4() {
    Book *book[MAX];

    // Initialize each book (pointer)
    for (int i = 0; i < MAX; i++) {
        book[i] = malloc(sizeof(Book));
        snprintf(book[i]->title, 50, "Book %d", i + 1);
        book[i]->price = 100 + i;
    }

    // Print details of each book
    for (int i = 0; i < MAX; i++) {
        printf("Title: %s, Price: %.2f\n", book[i]->title, book[i]->price);
    }

    // Free allocated memory
    for (int i = 0; i < MAX; i++) {
        free(book[i]);
    }
}
void example5() {}