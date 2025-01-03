#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void example1();
void example2();
void example3();
void example4();
void example5();
void example6();

// void oneDArray(int length, int a[length]);
//
// // function prototype
// void twoDArray(int row, int col, int a[row][col]);

int main() {
	// example1();
	// printf("\n\n");
	// example2();
	// printf("\n\n");
	// example3();
	// printf("\n\n");
	// example4();
	// printf("\n\n");
	example5();
	printf("\n\n");
	example6();

	return 0;
}

void example1() {
	int i, j;
	int size; // variable to hold size of one-dimensional array

	printf("Enter the size of one-dimensional array: ");
	scanf("%d", &size);

	int arr[size];

	for (i = 0; i < size; ++i) {
		printf("Enter a number: ");
		scanf("%d", &j);
		arr[i] = j;
	}

	for (i = 0; i < size; ++i)
		printf("a[%d]: %d\n", i, arr[i]);
}
void example2() {
	int i, j, x;

	int row, col; // number of rows & columns of two D array

	printf("Enter number of rows & columns of 2-D array:\n");
	scanf("%d %d", &row, &col);

	int arr2D[row][col];
	for (i = 0; i < row; ++i) {
		for (j = 0; j < col; ++j) {
			printf("Enter a number: ");
			scanf("%d", &x);
			arr2D[i][j] = x;
		}
	}

	for (i = 0; i < row; ++i) {
		printf("\n");
		for (j = 0; j < col; ++j)
			printf("%d\t", arr2D[i][j]);
	}
}
void example3() {
	int n;

	printf("Enter the size of the array: \n");
	scanf("%d", &n);

	int arr[n];

	for (int i = 0; i < n; i++)
		arr[i] = i + 1;

	printf("The array elements are: ");

	for (int i = 0; i < n; i++)
		printf("%d ", arr[i]);
}
void example4() {
	int i, j;

	// counter variable
	int size;

	// variable to hold size of one dimensional array
	int row, col;

	// number of rows & columns of two D array
	srand(time(NULL));

	printf("Enter the size of one-dimensional array: ");
	scanf("%d", &size);

	printf("Enter the number of rows & columns of 2-D array:\n");
	scanf("%d %d", &row, &col);

	// declaring arrays
	int arr[size];

	// 2-D array
	int arr2D[row][col];

	// one dimensional array
	for (i = 0; i < size; ++i) {
		arr[i] = rand() % 100 + 1;
	}

	// two dimensional array
	for (i = 0; i < row; ++i) {
		for (j = 0; j < col; ++j) {
			arr2D[i][j] = rand() % 100 + 1;
		}
	}

	// printing arrays
	printf("One-dimensional array:\n");

	// oneDArray(size, arr);
	for (i = 0; i < size; ++i)
		printf("a[%d]: %d\n", i, arr[i]);

	printf("\nTwo-dimensional array:\n");
	// twoDArray(row1, col1, arr2D);
	for (i = 0; i < row; ++i) {
		printf("\n");
		for (j = 0; j < col; ++j)
			printf("%5d", arr2D[i][j]);
	}
}
void example5() {
	// Jagged Array
	int a[] = {1, 2};
	int b[] = {3, 4, 5};
	int c[] = {6, 7, 8, 9};

	int l1 = sizeof(a) / sizeof(int), l2 = sizeof(b) / sizeof(int),
			l3 = sizeof(c) / sizeof(int);

	int *arr[] = {a, b, c};
	int size[] = {l1, l2, l3};
	int *ptr;
	int i, j, k = 0;

	for (i = 0; i < 3; i++) {
		ptr = arr[i];
		for (j = 0; j < size[k]; j++) {
			printf("%d\t", *ptr);
			ptr++;
		}
		printf("\n");
		k++;
		arr[i]++;
	}
}
void example6() {}