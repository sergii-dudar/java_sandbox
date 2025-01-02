#include <stdio.h>

/*
The compiler allocates space to a static variable in the computer’s main memory.
Unlike auto, a static variable is initialized to zero and not garbage.
A static variable is not re-initialized on every function call, if it is
declared inside a function. A static variable has local scope.
 */

void counter();
// void myfunction(int x);

void example1();
void example2();
void example3();
void example4();
void example5();

int main() {
	// example1();
	// printf("\n\n");
	// example2();
	// printf("\n\n");
	example3();
	printf("\n\n");
	example4();
	printf("\n\n");
	example5();

	return 0;
}

void example1() {
	auto int a = -28;
	static int b = 8;

	printf("The value of auto variable: %d\n", a);
	printf("The value of static variable b: %d\n", b);

	if (a != 0) {
		printf("The sum of static variable and auto variable: %d\n", (b + a));
	}
	/*
 However, when the variable x in the counter() function is declared as static,
 it is initialized to "0" when the counter() function is called for the first
 time. On each subsequent call, it is not re-initialized. Instead, it retains
 the earlier value.
 */
}
void example2() {
	counter();
	counter();
	counter();
}
void counter() {
	static int x = 0;
	printf("Value of x as it enters the function: %d\n", x);
	x++;
	printf("Incremented value of x: %d\n", x);
}

void myfunction(int *x) {
	*x = *x + 1;
	printf("Incremented value of x: %d\n", *x);
}
void example3() {
	int x = 5;
	myfunction(&x);
	printf("in main - x:%d\n", x);
}

void example4() {}
void example5() {}