#include <stdio.h>

void example1();
void example2();
void example3();
void example4();
void example5();

int main() {
    example1();

    printf(">>>>>--------------EXAMPLE1--------------<<<<<\n");
    example2();

    printf("\n\n>>>>>--------------EXAMPLE2--------------<<<<<\n");
    example3();

    printf("\n\n>>>>>--------------EXAMPLE3--------------<<<<<\n");
    example4();

    printf("\n\n>>>>>--------------EXAMPLE4--------------<<<<<\n");
    example5();

    return 0;
}

void example1() {
    int i = 2;
    int x = 121;
    printf("x: %d\n", x);

    while (i < x / 2) {
        if (x % i == 0)
            break;
        i++;
    }
    if (i >= x / 2)
        printf("%d is prime", x);
    else
        printf("%d is not prime", x);
}
void example2() {
    int i, num, n, flag;
    printf("The prime numbers in between the range 1 to 30:\n");

    for (num = 2; num <= 30; num++) {
        flag = 0;
        for (i = 2; i <= num / 2; i++) {
            if (num % i == 0) {
                flag++;
                break;
            }
        }
        if (flag == 0)
            printf("%d is prime\n", num);
    }
}
void example3() {
    int i = 0, j, k;

    while (i < 10) {
        i++;
        if (i % 2 == 0)
            continue;

        printf("i: %d\n", i);
    }

    for (i = 1; i <= 3; i++) {

        for (j = 1; j <= 3; j++) {
            if (i == j)
                continue;

            for (k = 1; k <= 3; k++) {
                if (k == j || k == i)
                    continue;

                printf("%d %d %d \n", i, j, k);
            }
        }
    }
}
void example4() {
    int n = 64;
    int i, m = 2;

    printf("Prime factors of %d: \n", n);

    while (n > 1) {
        if (n % m == 0) {
            n = n / m;
            printf("%d ", m);
            continue;
        }
        if (m == 2)
            m++;
        else
            m = m + 2;
    }
}
void example5() {}