#include <stdio.h>

/*Since C treats "0" as False and any non-zero number as True, any operand to a
 * logical operand is converted to a Boolean data. */

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
    int a = 5;
    int b = 20;

    if (a && b) {
        printf("Line 1 - Condition is true\n");
    }

    if (a || b) {
        printf("Line 2 - Condition is true\n");
    }

    /* lets change the value of  a and b */
    a = 0;
    b = 10;

    if (a && b) {
        printf("Line 3 - Condition is true\n");
    } else {
        printf("Line 3 - Condition is not true\n");
    }

    if (!(a && b)) {
        printf("Line 4 - Condition is true\n");
    }
}
void example2() {
    char a = 'a';
    char b = '\0'; // Null character

    if (a && b) {
        printf("Line 1 - Condition is true\n");
    }

    if (a || b) {
        printf("Line 2 - Condition is true\n");
    }
}
void example3() {
    int phy = 50;
    int maths = 60;

    if (phy < 50 || maths < 50) {
        printf("Result:Fail");
    } else {
        printf("Result:Pass");
    }
}
void example4() {
    int phy = 50;
    int maths = 60;

    if (phy >= 50 && maths >= 50) {
        printf("Result: Pass");
    } else {
        printf("Result: Fail");
    }
}
void example5() {
    int i = 0;
    while (!(i > 5)) {
        printf("i = %d\n", i);
        i++;
    }
}