#include <stdio.h>
#include <stdlib.h>

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
	int *ptr = NULL; // null pointer

	if (ptr == NULL) {
		printf("Pointer is a NULL pointer");
	} else {
		printf("Value stored in the address referred by the pointer: %d", *ptr);
	}
}
void example2() {
	int *ptr = (int *) malloc(sizeof(int));

	if (ptr == NULL) {
		printf("Memory Allocation Failed");
		exit(0);
	} else {
		printf("Memory Allocated successfully");
	}
}
void example3() {
	FILE *fp;
	char *s;
	int i, a;
	float p;

	fp = fopen("file3.txt", "r");

	if (fp == NULL) {
		puts("Cannot open file");
		exit(0);
	}

	while (fscanf(fp, "%d %f %s", &a, &p, s) != EOF)
		printf("Name: %s Age: %d Percent: %f\n", s, a, p);

	fclose(fp);
}
void example4() {}
void example5() {}