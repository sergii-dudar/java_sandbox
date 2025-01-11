#include <stdio.h>

// htt0ps://www.tutorialspoint.com/cprogramming/c_callback_function.htm

void hello() { printf("Hello World\n"); }

void callback(void (*ptr)()) {

	printf("Calling a function with its pointer\n");

	(*ptr)(); // calling the callback function
}

void example1();

int main() {
	example1();

	return 0;
}

void example1() {
	void (*ptr)() = hello;
	callback(ptr);
}