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
    struct employee {
        char name[10];
        float salary;
        struct dob {
            int d, m, y;
        } d1;
    };

    struct employee e1 = {"Kiran", 25000, {12, 5, 1990}};
    printf("Name: %s\n", e1.name);
    printf("Salary: %f\n", e1.salary);
    printf("Date of Birth: %d-%d-%d\n", e1.d1.d, e1.d1.m, e1.d1.y);
}
// -----------------------------------------------------------
void example2() {
    struct dob {
        int d, m, y;
    };

    struct employee {
        char name[10];
        float salary;
        struct dob d1;
    };

    struct employee e1 = {"Kiran", 25000, {12, 5, 1990}};
    printf("Name: %s\n", e1.name);
    printf("Salary: %f\n", e1.salary);
    printf("Date of Birth: %d-%d-%d\n", e1.d1.d, e1.d1.m, e1.d1.y);
}
// -----------------------------------------------------------
void example3() {
    struct date {
        int d, m, y;
    };

    struct experience {
        char designation[10];
        struct date from;
        struct date to;
    };

    struct employee {
        char name[10];
        float salary;
        struct experience exp;
    };

    struct date d1 = {12, 5, 1990};
    struct date d2 = {31, 3, 2021};
    struct experience exp = {"Clerk", d1, d2};
    struct employee e1 = {"Kiran", 25000, exp};

    printf("Name: %s\n", e1.name);
    printf("Salary: %f\n", e1.salary);
    printf("Experience: Designation: %s\n", e1.exp.designation);
    printf("From:  %d-%d-%d\n", e1.exp.from.d, e1.exp.from.m, e1.exp.from.y);
    printf("To: %d-%d-%d\n", e1.exp.to.d, e1.exp.to.m, e1.exp.to.y);
}
// -----------------------------------------------------------
void example4() {
    // Pointer to Nested Structure
    struct employee {
        char name[10];
        float salary;
        struct dob {
            int d, m, y;
        } d1;
    };
    struct employee e1 = {"Kiran", 25000, {12, 5, 1990}};
    struct employee *ptr = &e1;

    printf("Name: %s\n", ptr->name);
    printf("Salary: %f\n", ptr->salary);
    printf("Date of Birth: %d-%d-%d\n", ptr->d1.d, ptr->d1.m, ptr->d1.y);
}
// -----------------------------------------------------------
void example5() {}