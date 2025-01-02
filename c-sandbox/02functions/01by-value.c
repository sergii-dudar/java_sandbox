#include <stdio.h>

int add(int x, int y) {
	int z = x + y;
	return z;
}

void swap(int x, int y);
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
	int a = 10, b = 20;
	int c = add(a, b);
	printf("Addition: %d", c);
}
void swap(int x, int y) {
	int temp;
	temp = x; /* save the value of x */
	x = y;		/* put y into x */
	y = temp; /* put temp into y */
	return;
}
void example2() {
	/* local variable definition */
	int a = 100;
	int b = 200;

	printf("Before swap, value of a: %d\n", a);
	printf("Before swap, value of b: %d\n", b);

	/* calling a function to swap the values */
	swap(a, b);

	printf("After swap, value of a: %d\n", a);
	printf("After swap, value of b: %d\n", b);
}
void example3() {}
void example4() {}
void example5() {}