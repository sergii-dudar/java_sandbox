#include <stdio.h>
#include <stdlib.h>

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

struct mystruct {
    int a;
    struct mystruct *b;
};
void example1() {
    // Examples of Self-referential Structure
    struct mystruct x = {10, NULL}, y = {20, NULL}, z = {30, NULL};
    struct mystruct *p1, *p2, *p3;

    p1 = &x;
    p2 = &y;
    p3 = &z;

    x.b = p2;
    y.b = p3;

    printf("Address of x: %d a: %d Address of next: %d\n", p1, x.a, x.b);
    printf("Address of y: %d a: %d Address of next: %d\n", p2, y.a, y.b);
    printf("Address of z: %d a: %d Address of next: %d\n", p3, z.a, z.b);
}
// -----------------------------------------------------------
void example2() {
    struct mystruct *p1, *p2, *p3;

    p1 = (struct mystruct *) malloc(sizeof(struct mystruct));
    p2 = (struct mystruct *) malloc(sizeof(struct mystruct));
    p3 = (struct mystruct *) malloc(sizeof(struct mystruct));

    p1->a = 10;
    p1->b = NULL;
    p2->a = 20;
    p2->b = NULL;
    p3->a = 30;
    p3->b = NULL;

    p1->b = p2;
    p2->b = p3;

    printf("Add of x: %d a: %d add of next: %d\n", p1, p1->a, p1->b);
    printf("add of y: %d a: %d add of next: %d\n", p2, p2->a, p2->b);
    printf("add of z: %d a: %d add of next: %d\n", p3, p3->a, p3->b);
}
// -----------------------------------------------------------
void example3() {
    struct mystruct *p1, *p2, *p3;

    p1 = (struct mystruct *) malloc(sizeof(struct mystruct));
    p2 = (struct mystruct *) malloc(sizeof(struct mystruct));
    p3 = (struct mystruct *) malloc(sizeof(struct mystruct));

    p1->a = 10;
    p1->b = NULL;
    p2->a = 20;
    p2->b = NULL;
    p3->a = 30;
    p3->b = NULL;

    p1->b = p2;
    p2->b = p3;

    while (p1 != NULL) {
        printf("Add of current: %d a: %d add of next: %d\n", p1, p1->a, p1->b);
        p1 = p1->b;
    }
}
// -----------------------------------------------------------
void example4() {
    // Creating a Linked List with Self-referential Structure
    struct mystruct *p1, *p2, *start;
    int i;

    p1 = (struct mystruct *) malloc(sizeof(struct mystruct));
    p1->a = 10;
    p1->b = NULL;

    start = p1;

    for (i = 1; i <= 5; i++) {
        p2 = (struct mystruct *) malloc(sizeof(struct mystruct));
        p2->a = i * 2;
        p2->b = NULL;
        p1->b = p2;
        p1 = p2;
    }

    p1 = start;
    while (p1 != NULL) {
        printf("Add of current: %d a: %d add of next: %d\n", p1, p1->a, p1->b);
        p1 = p1->b;
    }
}
// -----------------------------------------------------------
void example5() {}