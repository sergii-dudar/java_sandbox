#include <stdio.h>
#include <string.h>

void example1();
void example2();
void example3();
void example4();
void example5();

int main() {
    example1();
    printf("\n\n");
    example2();
    printf("\n\n");
    example3();
    printf("\n\n");
    example4();
    printf("\n\n");
    example5();

    return 0;
}

struct book {
    char title[20];
    double price;
    int pages;
};
void example1() {
    // Reading a Struct Array
    struct book b[3];

    strcpy(b[0].title, "Learn C");
    b[0].price = 650.50;
    b[0].pages = 325;

    strcpy(b[1].title, "C Pointers");
    b[1].price = 175;
    b[1].pages = 225;

    strcpy(b[2].title, "C Pearls");
    b[2].price = 250;
    b[2].pages = 325;

    printf("\nList of Books:\n");
    for (int i = 0; i < 3; i++) {
        printf("Title: %s \tPrice: %7.2lf \tPages: %d\n",
               b[i].title,
               b[i].price,
               b[i].pages);
    }
}
// -----------------------------------------------------------
struct student {
    char name[10];
    int physics, chemistry, maths;
    double percent;
};
void example2() {
    struct student s[3];

    strcpy(s[0].name, "Ravi");
    s[0].physics = 50;
    s[0].chemistry = 60;
    s[0].maths = 70;

    strcpy(s[1].name, "Kiran");
    s[1].physics = 55;
    s[1].chemistry = 66;
    s[1].maths = 77;

    strcpy(s[2].name, "Anil");
    s[2].physics = 45;
    s[2].chemistry = 55;
    s[2].maths = 65;

    for (int i = 0; i < 3; i++) {
        s[i].percent =
            (double) (s[i].physics + s[i].maths + s[i].chemistry) / 3;
    }

    printf("\nName\tPhysics\tChemistry\tMaths\tPercent\n");

    for (int i = 0; i < 3; i++) {
        printf("%s \t\t%d \t\t%d \t\t%d \t\t%5.2lf\n",
               s[i].name,
               s[i].physics,
               s[i].chemistry,
               s[i].maths,
               s[i].percent);
    }
}
// -----------------------------------------------------------
void example3() {
    // Sorting a Struct Array
    struct book b[3] = {{"Learn C", 650.50, 325},
                        {"C Pointers", 175, 225},
                        {"C Pearls", 250, 250}};

    int i, j;
    struct book temp;

    for (i = 0; i < 2; i++) {
        for (j = i; j < 3; j++) {
            if (b[i].price > b[j].price) {
                temp = b[i];
                b[i] = b[j];
                b[j] = temp;
            }
        }
    }

    printf("\nList of Books in Ascending Order of Price:\n");

    for (i = 0; i < 3; i++) {
        printf("Title: %s \tPrice: %7.2lf \tPages: %d\n",
               b[i].title,
               b[i].price,
               b[i].pages);
    }
}
// -----------------------------------------------------------
void example4() {
    // Declaring a Pointer to a Struct Array
    struct book b[3] = {{"Learn C", 650.50, 325},
                        {"C Pointers", 175, 225},
                        {"C Pearls", 250, 250}};

    struct book *ptr = b;

    for (int i = 0; i < 3; i++) {
        printf("Title: %s \tPrice: %7.2lf \tPages: %d\n",
               ptr->title,
               ptr->price,
               ptr->pages);
        ptr++;
    }
}
// -----------------------------------------------------------
void example5() {}