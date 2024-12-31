#include <stdio.h>

void integerPromotions();

int main() {
	integerPromotions();

	return 0;
}

void integerPromotions() {
	char a = 'e', b = '2', c = 'M';
	char d = (a * b) / c;
	printf("d as int: %d as char: %c", d, d);
}
