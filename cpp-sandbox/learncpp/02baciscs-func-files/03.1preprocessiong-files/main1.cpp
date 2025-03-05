#include "main1-alex.h" // copies #define MY_NAME from Alex.h here
#include <iostream>

int main() {
    std::cout << "My name is: " << MY_NAME
              << '\n'; // preprocessor replaces MY_NAME with "Alex"

    return 0;
}