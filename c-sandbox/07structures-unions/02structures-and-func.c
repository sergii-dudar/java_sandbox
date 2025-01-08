#include <stdio.h>

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

struct rectangle {
    float len, brd;
    double area;
};
int area(float, float);
void example1() {
    // How to Pass Struct Elements
    struct rectangle r;
    r.len = 10.50;
    r.brd = 20.5;
    area(r.len, r.brd);
}
int area(float a, float b) {
    double area = (double) (a * b);
    printf("Length: %f \nBreadth: %f \nArea: %lf\n", a, b, area);
    return 0;
}
// -----------------------------------------------------------
int area1(struct rectangle);
void example2() {
    // How to Pass a Struct Variable
    struct rectangle r;
    r.len = 10.50;
    r.brd = 20.5;
    area1(r);
}
int area1(struct rectangle r) {
    r.area = (double) (r.len * r.brd);
    printf("Length: %f \nBreadth: %f \nArea: %lf\n", r.len, r.brd, r.area);
    return 0;
}
// -----------------------------------------------------------
struct rectangle area2(float x, float y);
void example3() {
    // How to Return Struct from a Function
    struct rectangle r;
    float x, y;

    x = 10.5;
    y = 20.5;
    r = area2(x, y);

    printf("Length: %f \n Breadth: %f \n Area: %lf\n", r.len, r.brd, r.area);
}
struct rectangle area2(float x, float y) {
    double area = (double) (x * y);
    struct rectangle r = {x, y, area};
    return r;
}
// -----------------------------------------------------------
int area3(struct rectangle *);
void example4() {
    // How to Pass a Struct by Reference
    struct rectangle r;
    r.len = 10.50;
    r.brd = 20.5;
    area3(&r);
}
int area3(struct rectangle *r) {
    r->area = (double) (r->len * r->brd);
    printf("Length: %f \nBreadth: %f \nArea: %lf\n", r->len, r->brd, r->area);
    return 0;
}
// -----------------------------------------------------------
struct rectangle *area4(float x, float y);
void example5() {
    // How to Return a Struct Pointer
    struct rectangle *r;
    float x, y;

    x = 10.5;
    y = 20.5;
    r = area4(x, y);
    printf("Length: %f \n Breadth: %f \n Area: %lf\n", r->len, r->brd, r->area);
}
struct rectangle *area4(float x, float y) {
    double area = (double) (x * y);
    static struct rectangle r;
    r.len = x;
    r.brd = y;
    r.area = area;
    return &r;
}