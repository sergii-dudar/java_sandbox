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
	char ch = 'm';
	printf("Time code: %c\n\n", ch);

	switch (ch) {
		case 'a':
			printf("Good Afternoon\n");
			break;

		case 'e':
			printf("Good Evening\n");
			break;

		case 'm':
			printf("Good Morning\n");
	}
}
void example2() {
	char grade = 'B';

	switch (grade) {
		case 'A':
			printf("Outstanding!\n");
			break;
		case 'B':
			printf("Excellent!\n");
			break;
		case 'C':
			printf("Well Done\n");
			break;
		case 'D':
			printf("You passed\n");
			break;
		case 'F':
			printf("Better try again\n");
			break;
		default:
			printf("Invalid grade\n");
	}
	printf("Your grade is  %c\n", grade);
}
void example3() {
	int number = 5;

	switch (number) {
		case 1 ... 10:
			printf("The number is between 1 and 10\n");
			break;

		default:
			printf("The number is not between 1 and 10\n");
	}
}
void example4() {
	char ch = 'g';

	switch (ch) {
		case 'a' ... 'z':
			printf("%c is a lowercase alphabet\n", ch);
			break;

		case 'A' ... 'Z':
			printf("%c is an uppercase alphabet\n", ch);
			break;

		case 48 ... 57:
			printf("%c is a digit\n", ch);
			break;

		default:
			printf("%c is a non-alphanumeric character\n", ch);
	}
}
void example5() {
	// nested
	int x = 1, y = 'b', z = 'X';

	// Outer Switch
	switch (x) {
		case 1:
			printf("Case 1 \n");

			switch (y) {
				case 'a':
					printf("Case a \n");
					break;
				case 'b':
					printf("Case b \n");
					break;
			}
			break;

		case 2:
			printf("Case 2 \n");
			switch (z) {
				case 'X':
					printf("Case X \n");
					break;
				case 'Y':
					printf("Case Y \n");
					break;
			}
	}
}