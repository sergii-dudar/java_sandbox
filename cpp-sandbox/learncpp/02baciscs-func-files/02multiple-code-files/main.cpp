#include <iostream>

int add( int x, int y ); // needed so main.cpp knows that add() is a function
                         // defined elsewhere

int main() {
    std::cout << "The sum of 3 and 4 is: " << add( 3, 4 )
              << '\n'; // compile error
    return 0;
}