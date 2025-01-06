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

void example1() {
	int *ptr;
	int balance[5] = {1, 2, 3, 4, 5};

	ptr = balance;

	printf("Pointer 'ptr' points to the address: %d", ptr);
	printf("\nAddress of the first element: %d", balance);
	printf("\nAddress of the first element: %d", &balance[0]);
}
void example2() {
	/* an array with 5 elements */
	double balance[5] = {1000.0, 2.0, 3.4, 17.0, 50.0};
	double *ptr;
	int i;

	ptr = balance;

	/* output each array element's value */
	printf("Array values using pointer: \n");

	for (i = 0; i < 5; i++) {
		printf("*(ptr + %d): %f\n", i, *(ptr + i));
	}

	printf("\nArray values using balance as address:\n");

	for (i = 0; i < 5; i++) {
		printf("*(balance + %d): %f\n", i, *(balance + i));
	}
}
void example3() {}
void example4() {}
void example5() {}