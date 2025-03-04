#include <iostream>
#include <ostream>

int main() {

    // Different forms of initialization

    std::string msg = "Hello message!\n";
    std::cout << msg;

    int b = 5;
    b += 3;
    std::cout << "b is: " << b << "\n";

    int width{ 5 };
    std::cout << "width is: " << width << "\n";

    int a; // default-initialization (no initializer)

    // Traditional initialization forms:
    int bb = 5; // copy-initialization (initial value after equals sign)
    int c( 6 ); // direct-initialization (initial value in parenthesis)
    std::cout << "c is: " << c << "\n";

    // Modern initialization forms (preferred):
    int d{ 7 }; // direct-list-initialization (initial value in braces)
    int e{}; // value-initialization (empty braces)
    int f = { 6 }; // copy-list-initialization of initial value 6 into variable height (rarely used)
    std::cout << "d is: " << d << "\n";
    std::cout << "e is: " << e << "\n";
    std::cout << "f is: " << f << "\n";

    // List-initialization disallows narrowing conversions
    //  An integer can only hold non-fractional values.
    // Initializing an int with fractional value 4.5 requires the compiler to convert 4.5 to a value an int can hold.
    // Such a conversion is a narrowing conversion, since the fractional part of the value will be lost.

    // int w1{ 4.5 }; // compile error: list-init does not allow narrowing conversion
    // int w2 = 4.5; // compiles: w2 copy-initialized to value 4
    // int w3( 4.5 ); // compiles: w3 direct-initialized to value 4

    //----------------
    // Use direct-list-initialization when you’re actually using the initial value:
    int x{ 0 }; // direct-list-initialization with initial value 0
    std::cout << x; // we're using that 0 value here

    // Use value-initialization when the object’s value is temporary and will be replaced:
    int x1{}; // value initialization
    // std::cin >> x1; // we're immediately replacing that value so an explicit 0 would be meaningless

    //--- Initializing multiple variables
    int a2 = 5, b2 = 6; // copy-initialization
    int c2( 7 ), d2( 8 ); // direct-initialization
    int e2{ 9 }, f2{ 10 }; // direct-list-initialization
    int i2{}, j2{}; // value-initialization

    // maybe_unused

    // Here's some math/physics values that we copy-pasted from elsewhere
    double pi{ 3.14159 };
    [[maybe_unused]]
    double gravity{ 9.8 };
    double phi{ 1.61803 };

    std::cout << pi << '\n'; // pi is used
    std::cout << phi << '\n'; // phi is used

    // The compiler will likely complain about gravity being defined but unused
    return 0;
}
