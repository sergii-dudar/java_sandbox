#include <stdio.h>

/*A void pointer in C is a type of pointer that is not associated with any data
 * type. A void pointer can hold an address of any type and can be typecasted to
 * any type. They are also called general-purpose or generic pointers. */

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
	int a = 10;
	char b = 'x';

	// void pointer holds address of int a
	void *ptr = &a;
	printf("Address of 'a': %d", &a);
	printf("\nVoid pointer points to: %d", ptr);

	// it now points to char b
	ptr = &b;
	printf("\nAddress of 'b': %d", &b);
	printf("\nVoid pointer points to: %d", ptr);
}
void example2() {
	void *arr[3];

	int a = 100;
	float b = 20.5;
	char *c = "Hello";

	arr[0] = &a;
	arr[1] = &b;
	arr[2] = &c;

	printf("Integer: %d\n", *((int *) arr[0]));
	printf("Float: %f\n", *((float *) arr[1]));
	printf("String: %s\n", *((char **) arr[2]));
}
void example3() {}
void example4() {}
void example5() {}