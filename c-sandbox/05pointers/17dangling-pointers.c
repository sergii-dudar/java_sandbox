#include <stdio.h>
#include <stdlib.h>

/*Dangling pointers in C is used to describe the behavior of a pointer when its
 * target (the variable it is pointing to) has been deallocated or is no longer
 * accessible. In other words, a dangling pointer in C is a pointer that doesn't
 * point to a valid variable of the appropriate type. */

void example1();
void example2();
void example3();
void example4();
void example5();
int *function();

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
	int *x = (int *) malloc(sizeof(int));
	*x = 100;
	printf("x: %d\n", *x);

	free(x);
	printf("x: %d\n", *x);
}
void example2() {
	int *x = function();
	printf("x: %d", *x);
}
void example3() {
	int *ptr;
	{
		int a = 10;
		ptr = &a;
	}

	// 'a' is now out of scope
	// ptr is a dangling pointer now
	printf("%d", ptr);
}
void example4() {}
void example5() {}

int *function() {
	int a = 100;
	return &a;
}