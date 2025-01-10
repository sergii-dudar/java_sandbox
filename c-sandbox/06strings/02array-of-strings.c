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
    char langs[10][15] = {"PYTHON",
                          "JAVASCRIPT",
                          "PHP",
                          "NODE JS",
                          "HTML",
                          "KOTLIN",
                          "C++",
                          "REACT JS",
                          "RUST",
                          "VBSCRIPT"};

    for (int i = 0; i < 10; i++) {
        printf("%s\n", langs[i]);
    }
}

void example2() {
    char *langs[10] = {"PYTHON",
                       "JAVASCRIPT",
                       "PHP",
                       "NODE JS",
                       "HTML",
                       "KOTLIN",
                       "C++",
                       "REACT JS",
                       "RUST",
                       "VBSCRIPT"};

    for (int i = 0; i < 10; i++) {
        printf("%s\n", langs[i]);
    }
}

void example3() {
    char langs[10][15] = {"PYTHON",
                          "JAVASCRIPT",
                          "PHP",
                          "NODE JS",
                          "HTML",
                          "KOTLIN",
                          "C++",
                          "REACT JS",
                          "RUST",
                          "VBSCRIPT"};

    int l = strlen(langs[0]);
    int p = 0;

    for (int i = 0; i < 10; i++) {
        if (strlen(langs[i]) >= l) {
            l = strlen(langs[i]);
            p = i;
        }
    }
    printf("Language with the longest name: %s Length: %d", langs[p], l);
}

void example4() {
    char langs[10][15] = {"PYTHON",
                          "JAVASCRIPT",
                          "PHP",
                          "NODE JS",
                          "HTML",
                          "KOTLIN",
                          "C++",
                          "REACT JS",
                          "RUST",
                          "VBSCRIPT"};

    int i, j;
    char temp[15];
    for (i = 0; i < 9; i++) {
        for (j = i + 1; j < 10; j++) {
            if (strcmp(langs[i], langs[j]) > 0) {
                strcpy(temp, langs[i]);
                strcpy(langs[i], langs[j]);
                strcpy(langs[j], temp);
            }
        }
    }

    for (i = 0; i < 10; i++) {
        printf("%s\n", langs[i]);
    }
}

void example5() {}