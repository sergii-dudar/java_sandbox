// C program to demonstrate an example of
// user-defined function
#include <stdio.h>

// Function declarations
int add(int, int);
int sub(int, int);

int main() {
	// Declaring two integer variables to
	// store the numbers
	// and resultant variables to store the result
	int num1 = 36, num2 = 24;
	int res_add, res_sub;

	// Calling the functions
	res_add = add(num1, num2);
	res_sub = sub(num1, num2);

	// Printing the results
	printf("Addition is : %d\n", res_add);
	printf("Subtraction is : %d\n", res_sub);

	return 0;
}

// Function definitions
int add(int a, int b) { return (a + b); }
int sub(int a, int b) { return (a - b); }