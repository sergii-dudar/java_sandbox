#include <iostream>
#include <ostream>
using namespace std;

void example1() {
    std::cout << "Hello world!\n"; // print Hello world! to console
    std::cout << 4; // print 4 to console

    std::cout << std::endl;
    int x{ 5 }; // define integer variable x, initialized with value 5
    std::cout << x << "\n"; // print value of x (5) to console
    std::cout << "Hello" << " world!\n";

    std::cout << std::endl;
    int x1{ 5 };
    std::cout << "x1 is equal to: " << x1 << "\n";

    std::cout << std::endl;
    std::cout << "Hi!" << std::endl; // std::endl will cause the cursor to move to the next line
    std::cout << "My name is Alex." << std::endl;

    std::cout << std::endl;
    int x2{ 5 };
    std::cout << "x2 is equal to: " << x2 << '\n'; // single quoted (by itself) (conventional)
    std::cout << "Yep." << "\n"; // double quoted (by itself) (unconventional but okay)
    std::cout << "And that's all, folks!\n"; // between double quotes in existing text (conventional)
}
void example2() {
    // std::cout << "Enter a number: "; // ask user for a number
    // int x{}; // define variable x to hold user input (and value-initialize it)
    // std::cin >> x; // get number from keyboard and store it in variable x
    // std::cout << "You entered " << x << '\n';

    std::cout << "Enter two numbers separated by a space: ";

    int x{}; // define variable x to hold user input (and value-initialize it)
    int y{}; // define variable y to hold user input (and value-initialize it)
    std::cin >> x >> y; // get two numbers and store in variable x and y respectively
    std::cout << "You entered " << x << " and " << y << '\n';
}
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
    cout << ">>>>>--------------EXAMPLE1--------------<<<<< sout \n";
    example1();
    cout << "\n\n>>>>>--------------EXAMPLE2--------------<<<<< sin \n";
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