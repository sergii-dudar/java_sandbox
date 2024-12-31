#include <stdio.h>
#include <stdlib.h>

void implicit();
void explicit();
void castFunc();

int main() {
	// implicit();
	// explicit();
	castFunc();
	return 0;
}

void castFunc() {
	// The atoi() function converts a string of characters to an integer value.
	// The function is declared in the stdlib.h header file.

	char str[] = "123";
	int num = atoi(str);
	printf("%d\n", num);
}

void explicit() {
	int x = 10, y = 4;
	float z = (float)x / y;

	printf("%f", z);
}

void implicit() {

	int i = 17;
	char c = 'c'; /* ascii value is 99 */
	int sum;
	sum = i + c;
	printf("Value of sum: %d\n", sum);

	int x = 10, y = 4;
	float z = x / y;
	printf("%f", z);
}
