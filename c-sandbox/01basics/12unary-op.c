#include <stdio.h>

/*We normally use the "*" symbol as the multiplication operator. However, it is
also used as the "dereference operator" in C.

When you want to store the memory address of a variable, the variable should be
declared with an asterisk (*) prefixed to it.
 */

void example1();
void example2();
void example3();
void example4();
void example5();

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

	return 0;
}

void example1() {
	int x = 10;
	int *y = &x;

	printf("x: %d Address of x: %d\n", x, &x);
	printf("Value at x with Dereference: %d", *y);
}
void example2() {
	// assign a value to the original variable with the help of the dereference
	// pointer
	int x = 10;
	int *y = &x;

	printf("x: %d Address of x %d\n", x, &x);

	*y = 20;

	printf("x: %d with Dereference: %d", x, *y);
}
void example3() {}
void example4() {}
void example5() {}