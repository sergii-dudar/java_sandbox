#include "main2-square.h" // square.h is also included once here
#include <iostream>

int main() {
    std::cout << "a square has " << getSquareSides() << " sides\n";
    std::cout << "a square of length 5 has perimeter length "
              << getSquarePerimeter( 5 ) << '\n';

    return 0;
}