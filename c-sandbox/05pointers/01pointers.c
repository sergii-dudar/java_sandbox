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
	int x = 10;

	// Pointer declaration and initialization
	int *ptr = &x;

	// Printing the current value
	printf("Value of x = %d\n", *ptr);

	// Changing the value
	*ptr = 20;

	// Printing the updated value
	printf("Value of x = %d\n", *ptr);
}
void example2() {
	int x = 10;
	float y = 1.3f;
	char z = 'p';

	// Pointer declaration and initialization
	int *ptr_x = &x;
	float *ptr_y = &y;
	char *ptr_z = &z;

	// Printing the values
	printf("Value of x = %d\n", *ptr_x);
	printf("Value of y = %f\n", *ptr_y);
	printf("Value of z = %c\n", *ptr_z);
}
void example3() {
	int x = 10;
	float y = 1.3f;
	char z = 'p';

	// Pointer declaration and initialization
	int *ptr_x = &x;
	float *ptr_y = &y;
	char *ptr_z = &z;

	// Printing the size of pointer variables
	printf("Size of integer pointer : %lu\n", sizeof(ptr_x));
	printf("Size of float pointer : %lu\n", sizeof(ptr_y));
	printf("Size of char pointer : %lu\n", sizeof(ptr_z));
}
void example4() {
	int var = 10;
	int *intptr = &var;
	int **ptrptr = &intptr;

	printf("var: %d \nAddress of var: %d \n\n", var, &var);
	printf("inttptr: %d \nAddress of inttptr: %d \n\n", intptr, &intptr);
	printf("var: %d \nValue at intptr: %d \n\n", var, *intptr);
	printf("ptrptr: %d \nAddress of ptrtptr: %d \n\n", ptrptr, &ptrptr);
	printf("intptr: %d \nValue at ptrptr: %d \n\n", intptr, *ptrptr);
	printf("var: %d \n*intptr: %d \n**ptrptr: %d", var, *intptr, **ptrptr);
}
void example5() {
	int var1;
	char var2[10];

	printf("Address of var1 variable: %x\n", &var1);
	printf("Address of var2 variable: %x\n", &var2);
}