#include <math.h>
#include <stdio.h>

#define PI 3.14159265

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
    double x, sn, cs, tn, val;

    x = 45.0;
    val = PI / 180;

    sn = sin(x * val);
    cs = cos(x * val);
    tn = tan(x * val);

    printf("sin(%f) : %f\n", x, sn);
    printf("cos(%f) : %f\n", x, cs);
    printf("tan(%f) : %f\n", x, tn);
}
void example2() {
    double x, asn, acs, atn, val;

    x = 0.9;
    val = 180 / PI;

    asn = asin(x);
    acs = acos(x);
    atn = atan(x);

    printf("asin(%f) : %f in radians\n", x, asn);
    printf("acos(%f) : %f in radians\n", x, acs);
    printf("atan(%f) : %f in radians\n", x, atn);

    asn = (asn * 180) / PI;
    acs = (acs * 180) / PI;
    atn = (atn * 180) / PI;

    printf("asin(%f) : %f in degrees\n", x, asn);
    printf("acos(%f) : %f in degrees\n", x, acs);
    printf("atan(%f) : %f in degrees\n", x, atn);
}
void example3() {}
void example4() {}
void example5() {}