#include <iostream>
#include <ostream>
using namespace std;

int five() { return 5; }
void example1() {
    int a{ 2 }; // initialize variable a with literal value 2
    int b{ 2 + 3 }; // initialize variable b with computed value 5
    int c{ ( 2 * 3 ) + 4 }; // initialize variable c with computed value 10
    int d{ b }; // initialize variable d with variable value 5
    int e{ five() }; // initialize variable e with function return value 5

    cout << "a: " << a << "\n";
    cout << "b: " << b << "\n";
    cout << "c: " << c << "\n";
    cout << "d: " << d << "\n";
    cout << "e: " << e << "\n";
}
void example2() {}
void example3() {}
void example4() {}
void example5() {}
void example6() {}
void example7() {}
void example8() {}
void example9() {}
void example10() {}
void example11() {}
void example12() {}

int main() {
    cout << ">>>>>--------------EXAMPLE1--------------<<<<<\n";
    example1();
    cout << "\n\n>>>>>--------------EXAMPLE2--------------<<<<<\n";
    example2();
    cout << "\n\n>>>>>--------------EXAMPLE3--------------<<<<<\n";
    example3();
    cout << "\n\n>>>>>--------------EXAMPLE4--------------<<<<<\n";
    example4();
    cout << "\n\n>>>>>--------------EXAMPLE5--------------<<<<<\n";
    example5();
    cout << "\n\n>>>>>--------------EXAMPLE6--------------<<<<<\n";
    example6();
    cout << "\n\n>>>>>--------------EXAMPLE7--------------<<<<<\n";
    example7();
    cout << "\n\n>>>>>--------------EXAMPLE8--------------<<<<<\n";
    example8();
    cout << "\n\n>>>>>--------------EXAMPLE9--------------<<<<<\n";
    example9();
    cout << "\n\n>>>>>--------------EXAMPLE10--------------<<<<<\n";
    example10();
    cout << "\n\n>>>>>--------------EXAMPLE11--------------<<<<<\n";
    example11();
    cout << "\n\n>>>>>--------------EXAMPLE12--------------<<<<<\n";
    example12();

    return 0;
}