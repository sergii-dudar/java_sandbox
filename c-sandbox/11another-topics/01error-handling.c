#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void example1();
void example2();
void example3();
void example4();
void example5();
void example6();
void example7();

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
    printf("\n\n");
    example6();
    printf("\n\n");
    example7();

    return 0;
}

void example1() {
    FILE *fp;

    // opening a file which does not exist
    fp = fopen("nosuchfile.txt", "r");
    printf("Value of errno: %d\n", errno);
}
void example2() {
    FILE *fp;

    // opening a file which does not exist
    fp = fopen("nosuchfile.txt", "r");

    printf("Value of errno: %d\n", errno);
    perror("Error message:");
}
void example3() {
    FILE *fp;

    // opening a file which does not exist
    fp = fopen("nosuchfile.txt", "r");

    printf("Value of errno: %d\n", errno);
    printf("The error message is : %s\n", strerror(errno));
}
void example4() {
    FILE *fp;
    fp = fopen("test.txt", "w");
    char ch = fgetc(fp); // Trying to read data, from writable file
    if (ferror(fp)) {
        printf("File is opened in writing mode! You cannot read data from it!");
    }
    fclose(fp);
}
void example5() {
    FILE *fp;
    fp = fopen("test.txt", "w");

    char ch = fgetc(fp); // Trying to read data, from writable file

    if (ferror(fp)) {
        printf(
            "File is opened in writing mode! You cannot read data from it!\n");
    }

    // Clears error-indicators from the file stream
    // Subsequent ferror() doesn't show error
    clearerr(fp);

    if (ferror(fp)) {
        printf("Error again in reading from file!");
    }
    fclose(fp);
}
void example6() {
    int dividend = 20;
    int divisor = 0;
    int quotient;

    if (divisor == 0) {
        fprintf(stderr, "Division by zero! Exiting...\n");
        exit(-1);
    }
    quotient = dividend / divisor;
    fprintf(stderr, "Value of quotient : %d\n", quotient);
    exit(0);
}
void example7() {
    int dividend = 20;
    int divisor = 5;
    int quotient;

    if (divisor == 0) {
        fprintf(stderr, "Division by zero! Exiting...\n");
        exit(EXIT_FAILURE);
    }

    quotient = dividend / divisor;
    fprintf(stderr, "Value of quotient: %d\n", quotient);

    exit(EXIT_SUCCESS);
}