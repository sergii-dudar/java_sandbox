#include <stdio.h>
#define MAX 10

// https://www.tutorialspoint.com/cprogramming/c_typedef.htm
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
    typedef short unsigned int USHORT;
    typedef signed long int SLONG;

    static SLONG x = 100;
    USHORT y = 200;

    printf("Size of SLONG: %d \nSize of USHORT: %d",
           sizeof(SLONG),
           sizeof(USHORT));
}
// -----------------------------------------------------------
void example2() {
    typedef unsigned long int ULONG;
    typedef short int SHORT;

    struct mystruct {
        ULONG a;
        SHORT b;
    };

    typedef struct mystruct STR;
    STR s1 = {10, 20};
    printf("%ld %u", s1.a, s1.b);
}
// -----------------------------------------------------------
void example3() {
    typedef unsigned long int ULONG;
    typedef short int SHORT;

    typedef struct mystruct {
        ULONG a;
        SHORT b;
    } STR;

    STR s1 = {10, 20};
    typedef STR *strptr;
    strptr ptr = &s1;

    printf("%d %d \n", s1.a, s1.b);
    printf("%d %d", ptr->a, ptr->b);
}
// -----------------------------------------------------------
void example4() {
    typedef unsigned long int ULONG;
    typedef short int SHORT;

    typedef union myunion {
        char a;
        int b;
        double c;
    } UNTYPE;

    UNTYPE u1;
    u1.c = 65.50;

    typedef UNTYPE *UNPTR;
    UNPTR ptr = &u1;

    printf("a:%c b: %d c: %lf \n", u1.a, u1.b, u1.c);
    printf("a:%c b: %d c: %lf \n", ptr->a, ptr->b, ptr->c);
}
// -----------------------------------------------------------
void example5() {
    typedef unsigned long int ULONG;
    typedef short int SHORT;

    typedef struct employee {
        char name[MAX];
        int age;
    } EMP;

    EMP e1 = {"Krishna", 25};
    printf("Name: %s \nAge: %d", e1.name, e1.age);
}