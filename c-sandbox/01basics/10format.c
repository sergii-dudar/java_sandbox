#include <stdio.h>

void example1();
void writeFileIO();
void readFileIO();
void example4();
void example5();

int main() {
	// example1();
	writeFileIO();
	readFileIO();
	// example3();
	// example4();
	// example5();

	return 0;
}

void example1() {
	int age = 18;
	float percent = 67.75;
	printf("Age: %d \nPercent: %f\n", age, percent);

	// printf("Enter Age and Percent: \n");
	// scanf("%d %f", &age, &percent);
	// printf("Age: %d Percent: %f", age, percent);

	int num1 = 20;
	printf("Signed integer: %d\n", num1);
	printf("Unsigned integer: %i\n", num1);
	printf("Long integer: %ld\n", num1);
	printf("Octal integer: %o\n", num1);
	printf("Hexadecimal integer: %x\n\n", num1);

	float num = 5.347;
	printf("float: %f\n", num);
	printf("double: %lf\n", num);
	printf("Scientific notation: %e\n", num);
	printf("width and precision: %4.2f\n\n", num);

	char ch = 'D';
	char word[] = "Hello World";
	printf("As character: %c\n", ch);
	printf("As its ASCII value: %d\n", ch);
	printf("String format: %s", word);
}
void writeFileIO() {
	int x, y, z;
	FILE *fp = fopen("test.txt", "w");
	x = 10;
	y = 20;
	z = 30;
	fprintf(fp, "%d, %d, %d", x, y, z);
	fclose(fp);
}
void readFileIO() {
	int x, y, z;
	FILE *fp = fopen("test.txt", "r");
	fscanf(fp, "%d, %d, %d", &x, &y, &z);
	printf("%d, %d, %d", x, y, z);
	fclose(fp);
}
void example4() {}
void example5() {}

/*
%c	Character
%d	Signed integer
%e or %E	Scientific notation of floats
%f	Float values
%g or %G	Similar as %e or %E
%hi	Signed integer (short)
%hu	Unsigned Integer (short)
%i	Unsigned integer
%l or %ld or %li	Long
%lf	Double
%Lf	Long double
%lu	Unsigned int or unsigned long
%lli or %lld	Long long
%llu	Unsigned long long
%o	Octal representation
%p	Pointer
%s	String
%u	Unsigned int
%x or %X	Hexadecimal representation
 */