#include <stdio.h>

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

int g = 10;
void example1() {
	/* local variable declaration */
	int a;

	/* actual initialization */
	a = g * 2;
	printf("Value of a = %d, and g = %d\n", a, g);
}

void function1() {
	g = g + 10;
	printf("New value of g in function1(): %d\n", g);
}

void function2() {
	printf("The value of g in function2(): %d\n", g);
	g = g + 10;
}
void example2() {
	printf("Value of Global variable g = %d\n", g);

	function1();
	printf("Updated value of Global variable g = %d\n", g);

	function2();
	printf("Updated value of Global variable g = %d\n", g);
}

int x = 50;
void example3() {
	// Local variable x
	int x = 10;
	{
		extern int x;
		printf("Value of global x is %d\n", x);
	}

	printf("Value of local x is %d\n", x);
}
void example4() {}
void example5() {}