#include <stdio.h>
#include <stdlib.h>
#include <string.h>
// https://www.tutorialspoint.com/cprogramming/c_file_io.htm
// "rb", "wb", "ab", "rb+", "r+b", "wb+", "w+b", "ab+", "a+b"
// r	Opens an existing text file for reading purposes.
//
// w	Opens a text file for writing. If it does not exist, then a new file is
// created. Here your program will start writing content from the beginning of
// the file.
//
// a	Opens a text file for writing in appending mode. If it does not exist,
// then a new file is created. Here your program will start appending content in
// the existing file content.
//
// r+	Opens a text file for both reading and writing.
//
// Opens a text file for both reading and writing. It first truncates the file
// to zero length if it exists, otherwise creates a file if it does not exist.
//
// a+	Opens a text file for both reading and writing. It creates the file if it
// does not exist. The reading will start from the beginning but writing can
// only be appended.
void example1();
void example2();
void example3();
void example4();
void example5();
void example6();
void example7();
void example8();
void example9();
void example10();

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
    printf("\n\n");
    example8();
    printf("\n\n");
    example9();
    printf("\n\n");
    example10();

    return 0;
}

void example1() {
    // Writing Single Character to a File
    FILE *fp;
    char *string = "C Programming tutorial from TutorialsPoint";
    int i;
    char ch;

    fp = fopen("file1.txt", "w");

    for (i = 0; i < strlen(string); i++) {
        ch = string[i];
        if (ch == EOF)
            break;
        fputc(ch, fp);
    }
    printf("\n");
    fclose(fp);
}
void example2() {
    // Writing String to a File
    FILE *fp;
    char *sub[] = {"C Programming Tutorial\n",
                   "C++ Tutorial\n",
                   "Python Tutorial\n",
                   "Java Tutorial\n"};
    fp = fopen("file2.txt", "w");

    for (int i = 0; i < 4; i++) {
        fputs(sub[i], fp);
    }

    fclose(fp);
}
void example3() {
    // Writing Formatted String to a File
    struct employee {
        int age;
        float percent;
        char *name;
    };
    FILE *fp;
    struct employee emp[] = {
        {25, 65.5, "Ravi"}, {21, 75.5, "Roshan"}, {24, 60.5, "Reena"}};

    fp = fopen("file3.txt", "w");

    for (int i = 0; i < 3; i++) {
        fprintf(fp, "%d %f %s\n", emp[i].age, emp[i].percent, emp[i].name);
    }
    fclose(fp);
}
void example4() {
    // Reading from a Text File
    FILE *fp;
    char ch;
    printf("example4\n");
    fp = fopen("file1.txt", "r");

    while (1) {
        ch = fgetc(fp);
        if (ch == EOF)
            break;
        printf("%c", ch);
    }
    printf("\n");
    fclose(fp);
}
void example5() {
    // Reading String from a File
    FILE *fp;
    char string[256];
    printf("example5\n");
    fp = fopen("file2.txt", "r");

    if (fp == NULL) {
        perror("Error opening file");
        return exit(EXIT_FAILURE);
    }

    // while (!feof(fp)) {
    //     fgets(string, 256, fp);
    //     printf("%s", string);
    // }
    while (fgets(string, sizeof(string), fp) != NULL) {
        printf("%s", string);
    }
    fclose(fp);
}
void example6() {
    // Reading Formatted String from a File
    FILE *fp;
    char s[256];
    int i, a;
    float p;

    fp = fopen("file3.txt", "r");

    if (fp == NULL) {
        puts("Cannot open file");
        return;
    }

    printf("example6\n");
    while (fscanf(fp, "%d %f %s", &a, &p, s) != EOF)
        printf("Name: %s Age: %d Percent: %f\n", s, a, p);
    fclose(fp);
}
void example7() {
    // File Handing Binary Read and Write Functions
    struct employee {
        int age;
        float percent;
        char name[10];
    };
    FILE *fp;
    struct employee e[] = {
        {25, 65.5, "Ravi"}, {21, 75.5, "Roshan"}, {24, 60.5, "Reena"}};

    fp = fopen("file4.dat", "wb");
    for (int i = 0; i < 3; i++) {
        fwrite(&e[i], sizeof(struct employee), 1, fp);
    }

    fclose(fp);
}
void example8() {
    // Reading from Binary File
    struct employee {
        int age;
        float percent;
        char name[10];
    };
    FILE *fp;
    struct employee e;

    fp = fopen("file4.dat", "rb");

    if (fp == NULL) {
        puts("Cannot open file");
        return;
    }

    printf("example8\n");
    while (fread(&e, sizeof(struct employee), 1, fp) == 1)
        printf("Name: %s Age: %d Percent: %f\n", e.name, e.age, e.percent);

    fclose(fp);
}
void example9() {}
void example10() {}