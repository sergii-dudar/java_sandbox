#include <stdio.h>

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

int square(int x) { return x * x; }
void example1() {
    int num[5] = {1, 2, 3, 4, 5};
    for (int i = 0; i <= 4; i++) {
        printf("No: %d \tSquare(%d): %d\n", i + 1, i + 1, square(i + 1));
    }

    printf("\n");
    int squares[5] = {1, 4, 9, 16, 25};
    for (int i = 0; i <= 4; i++) {
        printf("No: %d \tSquare(%d): %d\n", i + 1, i + 1, squares[i]);
    }

    printf("\n");
    int num1 = 3;
    switch (num1) {
        case 1:
            puts("Hydrogen");
            break;
        case 2:
            puts("Helium");
            break;
        case 3:
            puts("Lithium");
            break;
        case 4:
            puts("Beryllium");
            break;
        case 5:
            puts("Boron");
            break;
        default:
            puts("error: unknown element!");
    }
}
// -----------------------------------------------------------
static const char *table[] = {"Hydrogen",
                              "Helium",
                              "Lithium",
                              "Beryllium",
                              "Boron"};
void example2() {
    int num = 3;

    if (num >= 1 && num <= 5) {
        printf("Name of the element with atomic number %d is %s",
               num,
               table[num - 1]);
    } else {
        puts("error: Atomic number not in the lookup table!");
    }
}
// -----------------------------------------------------------
void example3() {
    // Array to represent numbers 0-9 in 7-segment display binary encoding
    int const nums[] = {
        0x3f, 0x06, 0x5b, 0x4f, 0x66, 0x6d, 0x7d, 0x07, 0x7f, 0x6f};

    static int bin[8];

    int i = 0, num = 7, rem;

    printf("The binary equivalent of 7 is: ");

    for (i = 7; i >= 0; i--) {
        rem = num % 2;
        bin[i] = rem;
        num /= 2;
    }

    for (i = 0; i <= 7; i++) {
        printf("%d", bin[i]);
        if (i == 3)
            printf(" ");
    }
}
// -----------------------------------------------------------
void example4() {}
// -----------------------------------------------------------
void example5() {}