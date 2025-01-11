#include <stdio.h>
#pragma pack(1)
// https://www.tutorialspoint.com/cprogramming/c_structure_padding_and_packing.htm
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
    struct struct1 {
        char a;
        char b;
        int c;
    };
    printf("Size: %d", sizeof(struct struct1));
}
// -----------------------------------------------------------
void example2() {
    struct struct1 {
        char a;
        int b;
        char c;
    };

    printf("size: %d", sizeof(struct struct1));
}
// -----------------------------------------------------------
void example3() {}
// -----------------------------------------------------------
void example4() {}
// -----------------------------------------------------------
void example5() {}