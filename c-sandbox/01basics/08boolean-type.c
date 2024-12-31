#include <stdbool.h>
#include <stdio.h>

void example1();
void writeFileIO();
void readFileIO();
void example4();
void example5();

int main() {
	// example1();
	// example2();
	// example3();
	example4();
	// example5();

	return 0;
}

// void example1() {
// 	// Using enum to Implement Boolean Type in C
// 	enum bool { false, true };
// 	enum bool x = true;
// 	enum bool y = false;
//
// 	printf("%d\n", x);
// 	printf("%d\n", y);
// }
// void example2() {
// 	// typedef enum as BOOL
// 	typedef enum { false, true } BOOL;
// 	BOOL x = true;
// 	BOOL y = false;
// 	printf("%d\n", x);
// 	printf("%d\n", y);
// }
void readFileIO() {
	bool a = true;
	bool b = false;

	printf("True: %d\n", a);
	printf("False: %d\n\n", b);

	bool x;
	x = 10 > 5;

	if (x)
		printf("x is True\n");
	else
		printf("x is False\n");

	bool y;
	int marks = 40;
	y = marks > 50;

	if (y)
		printf("Result: Pass\n");
	else
		printf("Result: Fail\n");
}
void example4() {
	bool loop = true;
	int i = 0;

	while (loop) {
		i++;
		printf("i: %d \n", i);

		if (i >= 5)
			loop = false;
	}
	printf("Loop stopped!\n");
}
void example5() {}