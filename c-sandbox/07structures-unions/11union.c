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

void example1() {
    union Data {
        int i;
        float f;
        char str[20];
    };

    union Data data;

    data.i = 10;
    data.f = 220.5;
    strcpy(data.str, "C Programming");

    printf("data.i: %d \n", data.i);
    printf("data.f: %f \n", data.f);
    printf("data.str: %s \n", data.str);
}
// -----------------------------------------------------------
void example2() {
    union Data {
        int i;
        float f;
        char str[20];
    };
    union Data data;

    data.i = 10;
    printf("data.i: %d \n", data.i);

    data.f = 220.5;
    printf("data.f: %f \n", data.f);

    strcpy(data.str, "C Programming");
    printf("data.str: %s \n", data.str);
}
// -----------------------------------------------------------
void example3() {
    union Data {
        int a;
        float b;
        char c[20];
    };
    union Data data;

    // Printing the size of the each member of union
    printf("Size of a: %lu bytes\n", sizeof(data.a));
    printf("Size of b: %lu bytes\n", sizeof(data.b));
    printf("Size of c: %lu bytes\n", sizeof(data.c));

    // Printing the size of the union
    printf("Size of union: %lu bytes\n", sizeof(data));
}
// -----------------------------------------------------------
void example4() {
    union Data {
        int i;
        float f;
        char str[20];
    };
    struct DataS {
        int i;
        float f;
        char str[20];
    };
    union Data data;
    struct DataS datas;
    printf("Memory occupied by Union Data: %d \n", sizeof(data));
    printf("Memory occupied by Struct Data: %d \n", sizeof(datas));
}
// -----------------------------------------------------------
void example5() {}