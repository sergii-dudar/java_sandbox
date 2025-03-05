#include <iostream>
#include <ostream>
using namespace std;

#define MY_NAME "Alex"
#define PRINT_JOE

void example1() {
    std::cout << "My name is: " << MY_NAME << '\n';
#ifdef PRINT_JOE
    std::cout << "Joe\n"; // will be compiled since PRINT_JOE is defined
#endif

#ifdef PRINT_BOB
    std::cout << "Bob\n"; // will be excluded since PRINT_BOB is not defined
#endif

#ifndef PRINT_BOB
    std::cout << "Bob\n";
#endif

#if 0 // Don't compile anything starting here (1 will compile)
    std::cout << "Bob\n";
    std::cout << "Steve\n";
#endif // until this point

#if 1 // always true, so the following code will be compiled
    std::cout << "Bob\n";
    /* Some
     * multi-line
     * comment here
     */
    std::cout << "Steve\n";
#endif
}

int main() {
    cout << ">>>>>--------------EXAMPLE1--------------<<<<<\n";
    example1();

    return 0;
}