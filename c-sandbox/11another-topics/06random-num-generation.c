#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// https://www.tutorialspoint.com/cprogramming/c_random_number_generation.htm
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
    printf("%ld\n", rand());
    printf("%ld\n", rand());
    printf("%ld\n", rand());

    for (int i = 1; i <= 5; i++) {
        printf("random number %d: %d \n", i, rand() % 100);
    }
}
void example2() {
    int i, num;
    int lower = 50, upper = 100;

    for (i = 1; i <= 5; i++) {
        num = (rand() % (upper - lower + 1)) + lower;
        printf("random number %d: %d \n", i, num);
    }
}
void example3() {
    srand(time(NULL));
    printf("Random number: %d \n", rand());
}
void example4() {
    int i, num;
    time_t t;
    int lower = 100, upper = 200;
    srand((unsigned) time(&t));

    for (i = 1; i <= 5; i++) {
        num = (rand() % (upper - lower + 1)) + lower;
        printf("random number number %d: %d \n", i, num);
    }
}
void example5() {}