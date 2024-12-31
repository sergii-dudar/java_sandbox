#include <stdio.h>

void example1();
void writeFileIO();
void readFileIO();
void example4();
void example5();

int main() {
	// example1();
	writeFileIO();
	// example3();
	// example4();
	// example5();

	return 0;
}
void example1() {
	int sum = 17, count = 5;
	double mean;

	mean = (double) sum / count;
	printf("Value of mean: %f\n", mean);
}

void writeFileIO() {
	int i = 17;
	char c = 'c'; /* ascii value is 99 */
	int sum;
	// float sum;

	sum = i + c;
	printf("Value of sum : %d\n", sum);
}
void readFileIO() {}
void example4() {}
void example5() {}