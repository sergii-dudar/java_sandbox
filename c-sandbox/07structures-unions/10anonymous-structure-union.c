#include <stdio.h>
#include <string.h>
// https://www.tutorialspoint.com/cprogramming/c_anonymous_structures_and_unions.htm
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

struct employee {
    char name[10];
    float salary;
    struct {
        int d, m, y;
    };
};
void example1() {
    struct employee e1;
    strcpy(e1.name, "Kiran");
    e1.salary = 25000;
    e1.d = 12;
    e1.m = 5;
    e1.y = 1990;

    printf("Name: %s\n", e1.name);
    printf("Salary: %f\n", e1.salary);
    printf("Date of Birth: %d-%d-%d\n", e1.d, e1.m, e1.y);
}
// -----------------------------------------------------------
void example2() {
    struct student {
        char name[10];
        int age;
        struct {
            char coursettl[20];
            int courseid;
        };
    };
    struct student s1;
    strcpy(s1.name, "Kiran");
    s1.age = 27;
    strcpy(s1.coursettl, "C Programming");
    s1.courseid = 1;

    printf("Name: %s\n", s1.name);
    printf("age: %d\n", s1.age);
    printf("Course Title: %s Course ID: %d\n", s1.coursettl, s1.courseid);
}
// -----------------------------------------------------------
void example3() {
    // Anonymous Union
    struct mystruct {
        int var;
        union {
            int var1;
            float var2;
            char var3;
        };
    };
    struct mystruct data;

    data.var = 10;
    data.var2 = 5.55;

    printf("mystruct.var: %d\n", data.var);
    printf(
        "anonymous union elements: %d %f %c", data.var1, data.var2, data.var3);
}
// -----------------------------------------------------------
void example4() {}
// -----------------------------------------------------------
void example5() {}