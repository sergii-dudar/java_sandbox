#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

void example1();
void example2();
void example3();
void example4();
void example5();

float *arrfunction(int);
int *getRandom();
char *hellomsg(char *);

struct rectangle {
	float len, brd;
	double area;
};

struct rectangle *area(float x, float y);

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
	int x = 100, i;
	float *arr = arrfunction(x);

	printf("Square of %d: %f\n", x, *arr);
	printf("Cube of %d: %f\n", x, arr[1]);
	printf("Square root of %d: %f\n", x, arr[2]);
}
void example2() {
	int *p; /* a pointer to an int */
	p = getRandom();

	for (int i = 0; i < 10; i++) {
		printf("*(p + %d): %d\n", i, *(p + i));
	}
}
void example3() {
	char *name = "TutorialsPoint";
	char *arr = hellomsg(name);
	printf("%s\n", arr);
}
void example4() {
	struct rectangle *r;
	float x, y;
	x = 10.5, y = 20.5;
	r = area(x, y);

	printf("Length: %f \nBreadth: %f \nArea: %lf\n", r->len, r->brd, r->area);
}
void example5() {}

float *arrfunction(int x) {
	static float arr[3];
	arr[0] = pow(x, 2);
	arr[1] = pow(x, 3);
	arr[2] = pow(x, 0.5);

	return arr;
}
int *getRandom() {
	static int r[10];
	srand((unsigned) time(NULL)); /* set the seed */

	for (int i = 0; i < 10; ++i) {
		r[i] = rand();
	}

	return r;
}
char *hellomsg(char *x) {
	char *arr = (char *) malloc(50 * sizeof(char));
	strcpy(arr, "Hello ");
	strcat(arr, x);

	return arr;
}
struct rectangle *area(float x, float y) {
	double area = (double) (x * y);
	static struct rectangle r;
	r.len = x;
	r.brd = y;
	r.area = area;

	return &r;
}