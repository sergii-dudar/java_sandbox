#include <stdio.h>
#include <stdlib.h>
#include <string.h>

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
    char *name;
    name = (char *) malloc(strlen("TutorialsPoint"));
    strcpy(name, "TutorialsPoint");

    if (name == NULL) {
        fprintf(stderr, "Error - unable to allocate required memory\n");
    } else {
        printf("Name = %s\n", name);
    }
}
void example2() {
    char *name;
    name = (char *) calloc(strlen("TutorialsPoint"), sizeof(char));
    strcpy(name, "TutorialsPoint");

    if (name == NULL) {
        fprintf(stderr, "Error - unable to allocate required memory\n");
    } else {
        printf("Name = %s\n", name);
    }
}
void example3() {
    char *name;
    name = (char *) calloc(strlen("TutorialsPoint"), sizeof(char));
    strcpy(name, "TutorialsPoint");

    name = (char *) realloc(name, strlen(" India Private Limited"));
    strcat(name, " India Private Limited");

    if (name == NULL) {
        fprintf(stderr, "Error - unable to allocate required memory\n");
    } else {
        printf("Name = %s\n", name);
    }
}
void example4() {
    char *name;
    name = (char *) calloc(strlen("TutorialsPoint"), sizeof(char));
    strcpy(name, "TutorialsPoint");

    if (name == NULL) {
        fprintf(stderr, "Error - unable to allocate required memory\n");
    } else {
        printf("Name = %s\n", name);
        free(name);
    }
}
void example5() {}