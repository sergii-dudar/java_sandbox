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

void example1() {
    /* define simple structure */
    struct {
        unsigned int widthValidated;
        unsigned int heightValidated;
    } status1;

    /* define a structure with bit fields */
    struct {
        unsigned int widthValidated : 1;
        unsigned int heightValidated : 1;
    } status2;

    printf("Memory size occupied by status1: %d\n", sizeof(status1));
    printf("Memory size occupied by status2: %d\n", sizeof(status2));
}
// -----------------------------------------------------------
void example2() {
    struct {
        unsigned int age : 3;
    } Age;

    Age.age = 4;
    printf("Sizeof(Age): %d\n", sizeof(Age));
    printf("Age.age: %d\n", Age.age);

    Age.age = 7;
    printf("Age.age : %d\n", Age.age);

    // Age.age = 8;
    // printf("Age.age : %d\n", Age.age);
}
// -----------------------------------------------------------
void example3() {}
// -----------------------------------------------------------
void example4() {}
// -----------------------------------------------------------
void example5() {}