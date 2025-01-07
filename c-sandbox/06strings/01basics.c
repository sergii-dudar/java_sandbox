#include <stdio.h>

// https://www.tutorialspoint.com/cprogramming/c_strings.htm

// A string in C is a one-dimensional array of char type, with the last
// character in the array being a "null character" represented by '\0'. Thus, a
// string in C can be defined as a null-terminated sequence of char type values.

// If the string is not terminated by "\0", it results in unpredictable
// behavior.

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
	char greeting[] = {'H', 'e', 'l', 'l', 'o', '\0'};

	for (int i = 0; i < 5; i++) {
		printf("%c", greeting[i]);
	}

	//----
	char greeting1[] = {'H', 'e', 'l', 'l', 'o', '\0'};
	printf("\nGreeting message: %s\n", greeting1);

	//----
	printf("%s\n", greeting);
}
void example2() {}
void example3() {}
void example4() {}
void example5() {}