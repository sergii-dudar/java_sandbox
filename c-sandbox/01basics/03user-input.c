#include <stdio.h>

/*
int scanf(const char *format, &var1, &var2, . . .);

The first argument to the scanf() function is a format string.
It indicates the data type of the variable in which the user input is to be
parsed. It is followed by one or more pointers to the variables. The variable
names prefixed by & gives the address of the variable.


%c	Character
%d	Signed integer
%f	Float values
%i	Unsigned integer
%l or %ld or %li	Long
%lf	Double
%Lf	Long double
%lu	Unsigned int or unsigned long
%lli or %lld	Long long
%llu	Unsigned long long
 */

void simpleInput();
void charactersInput();
void stringInput();

int main() {
	// simpleInput();
	// charactersInput();
	stringInput();

	char message[] = "Execution is finished!";
	printf("%s", message);

	return 0;
}

void simpleInput() {
	int price, qty, ttl;
	printf("Enter price and quantity: ");
	scanf("%d %d", &price, &qty);
	ttl = price * qty;
	printf("Total : %d", ttl);
}

void charactersInput() {
	char ch;
	char word[10];

	int i = 0;
	printf("Enter characters. End by pressing the Enter key: ");

	while (1) {
		ch = getchar();
		word[i] = ch;
		if (ch == '\n')
			break;
		i++;
	}
	printf("\nYou entered the word: %s", word);
}

void stringInput() {
	char name[20];

	printf("Enter your name: ");
	gets(name);

	printf("You entered the name: %s", name);
}