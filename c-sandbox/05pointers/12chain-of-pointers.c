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
	int a = 10;

	int *x = &a;
	int **y = &x;
	int ***z = &y;

	printf("a: %d\n", a);

	printf("a: %d\n", *x);	 // dereferencing x;
	printf("a: %d\n", **y);	 // double dereferencing y;
	printf("a: %d\n", ***z); // triple dereferencing z;
}
void example2() {
	float a = 10.25;

	float *x = &a;
	float **y = &x;
	float ***z = &y;

	printf("a: %f\n", a);
	printf("a: %f\n", *x);
	printf("a: %f\n", **y);
	printf("a: %f\n", ***z);
}
void example3() {
	float a = 10.25;

	float *x = &a;
	float **y = &x;
	float ***z = &y;

	printf("a: %f\n", a);

	// update with first pointer
	*x = 11.25;
	printf("a: %f\n", *x);

	// update with second pointer
	**y = 12.25;
	printf("a: %f\n", **y);

	// update with third pointer
	***z = 13.25;
	printf("a: %f\n", ***z);
}
void example4() {
	char *a = "Hello";

	char **x = &a;
	char ***y = &x;
	char ****z = &y;

	printf("a: %s\n", a);
	printf("a: %s\n", *x);
	printf("a: %s\n", **y);
	printf("a: %s\n", ***z);
}
void example5() {}