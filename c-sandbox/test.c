#include <math.h>
#include <stdio.h>

void register1(int, int);

int main() {

	int a = 5, b = 7;
	register1(a, b);

	return 0;
}

void register1(int a, int b) { printf("%d", a + b); }