#include <stdio.h>

void example1();
void example2();
void example3();
void example4();
void example5();
void example6();
void example7();
void example8();

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

    return 0;
}

enum status_codes { OKAY = 1, CANCEL = 0, ALERT = 2 };
void example1() {
    printf("OKAY = %d\n", OKAY);
    printf("CANCEL = %d\n", CANCEL);
    printf("ALERT = %d\n\n", ALERT);

    enum myenum { val1, val2, val3, val4 } var;
    var = val2;
    printf("var = %d", var);
}
// -----------------------------------------------------------
enum colors { VIOLET, INDIGO, BLUE, GREEN, YELLOW, ORANGE, RED };
void example2() {
    // Enum variable declaration
    enum colors color = YELLOW;
    // switch statement using enum
    switch (color) {
        case BLUE:
            printf("Blue color");
            break;

        case GREEN:
            printf("Green color");
            break;

        case RED:
            printf("Red color");
            break;

        default:
            printf("Color other than RGB");
    }
}
// -----------------------------------------------------------
void example3() {
    enum weekdays { Sun, Mon, Tue, Wed, Thu, Fri, Sat };

    printf("Monday = %d\n", Mon);
    printf("Thursday = %d\n", Thu);
    printf("Sunday = %d\n", Sun);

    enum weekdays day;
    day = Wed;
    printf("\nDay number of Wed is = %d", day);
}
// -----------------------------------------------------------
void example4() {
    enum months { Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec };
    for (int i = Jan; i <= Dec; i++)
        printf("Month No: %d\n", i);
}
// -----------------------------------------------------------
void example5() {
    // Starting an Enum from 1
    enum months {
        Jan = 1,
        Feb,
        Mar,
        Apr,
        May,
        Jun,
        Jul,
        Aug,
        Sep,
        Oct,
        Nov,
        Dec
    };
    for (int i = Jan; i <= Dec; i++)
        printf("Month No: %d\n", i);
}
// -----------------------------------------------------------
void example6() {
    // HTTP Status Codes
    enum status {
        OK = 200,
        BadRequest = 400,
        Unauthorized = 401,
        Forbidden = 403,
        NotFound = 404,
        InternalServerError = 500,
    };
    enum status code = InternalServerError;
    if (code == 500) {
        printf("Internal Server Error has been encountered");
    }
}
// -----------------------------------------------------------
void example7() {
    // Assigning a Fixed Number to Enum Constants
    enum myenum { a, b = 5, c, d, e = 10, f };
    printf("a: %d\n", a);
    printf("b: %d\n", b);
    printf("c: %d\n", c);
    printf("d: %d\n", d);
    printf("e: %d\n", e);
    printf("f: %d\n", f);
}
// -----------------------------------------------------------
void example8() {}