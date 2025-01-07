#include <stdio.h>
#include <stdlib.h>

void example1();
void example2();
void example3();
void example4();
void example5();
void example6();
void example7();
void example8();

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
	printf("\n\n");
	example6();
	printf("\n\n");
	example7();
	printf("\n\n");
	example8();

	return 0;
}

void example1() {
	static int *ptr[5];

	for (int i = 0; i < 5; i++) {
		printf("ptr[%d] = %d\n", i, ptr[i]);
	}
}
void example2() {
	int a = 10, b = 20, c = 30;
	int *ptr[3] = {&a, &b, &c};

	for (int i = 0; i < 3; i++) {
		printf("ptr[%d]: address: %d value: %d\n", i, ptr[i], *ptr[i]);
	}

	//---
	printf("\n");
	int arr[] = {10, 20, 30};
	int *ptr1[3] = {&arr[0], &arr[1], &arr[2]};

	for (int i = 0; i < 3; i++) {
		printf("ptr[%d]: address: %d value: %d\n", i, ptr1[i], *ptr1[i]);
	}
}
void example3() {
	// Traversing an Array with its Base address
	int arr[] = {10, 20, 30};
	int *ptr = arr;

	for (int i = 0; i < 3; i++) {
		printf("ptr[%d]: address: %d value: %d\n", i, ptr + i, *(ptr + i));
	}
}
void example4() {
	int arr[3][4] = {
			{1, 2, 3, 4},
			{5, 6, 7, 8},
	};

	int ROWS = 2, COLS = 4;
	int i, j;

	// pointer
	int(*ptr)[4] = arr;

	// print the element of the array via pointer ptr
	for (i = 0; i < ROWS; i++) {
		for (j = 0; j < COLS; j++) {
			printf("%d ", *(ptr[i] + j));
		}
		printf("\n");
	}
}
void example5() {
	// 2d array
	int arr[3][4] = {
			{1, 2, 3, 4},
			{5, 6, 7, 8},
	};

	int ROWS = 2, COLS = 4;
	int i, j;

	// pointer
	int *ptr = arr;

	// print the element of the array via pointer ptr
	for (i = 0; i < ROWS; i++) {
		for (j = 0; j < COLS; j++) {
			printf("%d  ", *(ptr + i * COLS + j));
		}
		printf("\n");
	}
}
void example6() {
	char *langs[10] = {"PYTHON", "JAVASCRIPT", "PHP",			 "NODE JS", "HTML",
										 "KOTLIN", "C++",				 "REACT JS", "RUST",		"VBSCRIPT"};

	for (int i = 0; i < 10; i++)
		printf("%s\n", langs[i]);
}
void example7() {
	int *arr = (int *) malloc(sizeof(int) * 5);

	for (int i = 0; i < 5; i++) {
		arr[i] = i;
	}
	for (int x = 0; x < 5; x++) {
		printf("%d %d\n", x, arr[x]);
	}
}
void example8() {}