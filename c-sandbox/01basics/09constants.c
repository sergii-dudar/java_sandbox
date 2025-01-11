#include <stdio.h>
// #define PI 3.14159265359
#define LENGTH 10
#define WIDTH 5
#define NEWLINE '\n'

// types:
// Using the const Keyword
// Using the #define Directive

const float PI = 3.14159265359;

void example1();
void writeFileIO();
void changeConstantValueByPointers();
void example4();
void example5();

int main() {
	// example1();
	// example2();
	changeConstantValueByPointers();
	// example3();
	// example4();
	// example5();

	return 0;
}

void example1() {
	// const float PI = 3.14159265359;
	float radius = 5;
	float area = PI * radius * radius;
	printf("area: %f", area);
}
void writeFileIO() {
	int area;
	area = LENGTH * WIDTH;
	printf("length: %d width: %d", LENGTH, WIDTH);
	printf("%c", NEWLINE);
	printf("value of area : %d", area);
}
void changeConstantValueByPointers() {
	const int x = 10;
	printf("Initial Value of Constant: %d\n", x);

	// y is a pointer to constant x
	int *y = &x;

	// assign new value
	*y = 100;
	printf("Value of Constant after change: %d", x);
}
void example4() {}
void example5() {}