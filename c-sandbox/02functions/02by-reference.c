#include <math.h>
#include <stdio.h>

// https://www.tutorialspoint.com/cprogramming/c_function_call_by_reference.htm
void example1();
void example2();
void example3();
void example4();
void example5();
int add(int *, int *);
int swap(int *x, int *y);
int calculate(int, int *, int *);

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
	printf("x: %d Address of x: %d", x, &x);
}
void example2() {
	int x = 10;
	int *y = &x;

	printf("x: %d Address of x: %d\n", x, &x);
	printf("Address of y: %d \n", &y);
	printf("Value at address in y: %d\n", *y);
}
void example3() {
	int a = 10, b = 20;
	int c = add(&a, &b);
	printf("Addition: %d", c);
}
void example4() {
	int a = 10;
	int b = 20;

	printf("Before swap, value of a: %d\n", a);
	printf("Before swap, value of b: %d\n", b);

	/* calling a function to swap the values */
	swap(&a, &b);

	printf("After swap, value of a: %d\n", a);
	printf("After swap, value of b: %d\n", b);
}
void example5() {
	int a = 10;
	int b, c;
	calculate(a, &b, &c);
	printf("a: %d \nSquare of a: %d \nCube of a: %d", a, b, c);
}
int add(int *x, int *y) {
	int z = *x + *y;
	return z;
}
int swap(int *x, int *y) {

	int z;

	z = *x;	 /* save the value at address x */
	*x = *y; /* put y into x */
	*y = z;	 /* put z into y */

	return 0;
}
int calculate(int x, int *y, int *z) {
	*y = pow(x, 2);
	*z = pow(x, 3);
	return 0;
}