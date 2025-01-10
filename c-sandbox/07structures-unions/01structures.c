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
    char author[20];
    double price;
    int pages;
};
void example1() {
    struct book book1 = {"Learn C", "Dennis Ritchie", 675.50, 325};

    printf("Title:  %s \n", book1.title);
    printf("Author: %s \n", book1.author);
    printf("Price:  %lf\n", book1.price);
    printf("Pages:  %d \n", book1.pages);
    printf("Size of book struct: %d", sizeof(struct book));
}
// -------------------------------------------------
struct bookk {
    char title[10];
    char author[20];
    double price;
    int pages;
} book1;
void example2() {
    strcpy(book1.title, "Learn C");
    strcpy(book1.author, "Dennis Ritchie");
    book1.price = 675.50;
    book1.pages = 325;

    printf("Title: %s \n", book1.title);
    printf("Author: %s \n", book1.author);
    printf("Price: %lf \n", book1.price);
    printf("Pages: %d \n", book1.pages);
}
// -------------------------------------------------
void example3() {
    // Copying Structures
    struct book book1 = {"Learn C", "Dennis Ritchie", 675.50, 325}, book2;
    book2 = book1;

    printf("Title: %s \n", book2.title);
    printf("Author: %s \n", book2.author);
    printf("Price: %lf \n", book1.price);
    printf("Pages: %d \n", book1.pages);
    printf("Size of book struct: %d", sizeof(struct book));
}
// -------------------------------------------------

struct Books2 {
    char title[50];
    char author[50];
    char subject[100];
    int book_id;
};
void printBook(struct Books2 book);
void example4() {
    // Structures as Function Arguments
    struct Books2 Book1; /* Declare Book1 of type Book */
    struct Books2 Book2; /* Declare Book2 of type Book */

    /* book 1 specification */
    strcpy(Book1.title, "C Programming");
    strcpy(Book1.author, "Nuha Ali");
    strcpy(Book1.subject, "C Programming Tutorial");
    Book1.book_id = 6495407;

    /* book 2 specification */
    strcpy(Book2.title, "Telecom Billing");
    strcpy(Book2.author, "Zara Ali");
    strcpy(Book2.subject, "Telecom Billing Tutorial");
    Book2.book_id = 6495700;

    /* print Book1 info */
    printBook(Book1);

    /* Print Book2 info */
    printBook(Book2);
}
void printBook(struct Books2 book) {
    printf("Book title : %s\n", book.title);
    printf("Book author : %s\n", book.author);
    printf("Book subject : %s\n", book.subject);
    printf("Book book_id : %d\n", book.book_id);
}
// -----------------------------------------------------------
void example5() {
    // Pointers to Structures
    struct book book1 = {"Learn C", "Dennis Ritchie", 675.50, 325};
    struct book *strptr;
    strptr = &book1;

    printf("Title: %s \n", strptr->title);
    printf("Author: %s \n", strptr->author);
    printf("Price: %lf \n", strptr->price);
    printf("Pages: %d \n", strptr->pages);
}