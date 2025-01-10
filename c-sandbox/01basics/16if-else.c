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
    int a = 15;
    printf("a: %d\n", a);

    if (a % 2 == 0) {
        if (a % 3 == 0) {
            printf("Divisible by 2 and 3");
        } else {
            printf("Divisible by 2 but not 3");
        }
    } else {
        if (a % 3 == 0) {
            printf("Divisible by 3 but not 2");
        } else {
            printf("Not divisible by 2, not divisible by 3");
        }
    }
}
void example2() {
    int year = 2024;
    if (year % 4 == 0 && (year % 400 == 0 || year % 100 != 0)) {
        printf("%d is a leap year", year);
    } else {
        printf("%d is not a leap year", year);
    }
}
void example3() {
    int age = 15;

    if (age < 18) {
        printf("You need to be over 18 years old to continue\n");
    } else if (age < 21) {
        printf("You need to be over 21\n");
    } else {
        printf("You are over 18 and older than 21 so you can continue \n");
    }
}
void example4() {}
void example5() {}