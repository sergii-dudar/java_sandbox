#include <stdio.h>
#define message_for(a, b) printf(#a " and " #b ": We love you!\n")
#define tokenpaster(n) printf("token" #n " = %d", token##n)

#if !defined(MESSAGE)
#define MESSAGE "You wish!"
#endif

#define MAX(x, y) ((x) > (y) ? (x) : (y))

// https://www.tutorialspoint.com/cprogramming/c_preprocessors.htm
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
    printf("File: %s\n", __FILE__);
    printf("Date: %s\n", __DATE__);
    printf("Time: %s\n", __TIME__);
    printf("Line: %d\n", __LINE__);
    printf("ANSI: %d\n", __STDC__);
}
void example2() { message_for(Ram, Raju); }
void example3() {
    int token34 = 40;
    tokenpaster(34);
}
void example4() { printf("Here is the message: %s\n", MESSAGE); }
void example5() { printf("Max between 20 and 10 is %d\n", MAX(10, 20)); }