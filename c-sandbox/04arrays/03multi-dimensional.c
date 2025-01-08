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
    int arr1[3][5] = {1, 2, 3, 4, 5, 10, 20, 30, 40, 50, 5, 10, 15, 20, 25};
    int arr2[][5] = {1, 2, 3, 4, 5, 10, 20, 30, 40, 50, 5, 10, 15, 20, 25};
    int arr3[][5] = {
        {1, 2, 3, 4, 5}, {10, 20, 30, 40, 50}, {5, 10, 15, 20, 25}};

    // --
    int a[5][2] = {{0, 0}, {1, 2}, {2, 4}, {3, 6}, {4, 8}};
    int i, j;

    /* output each array element's value */
    for (i = 0; i < 5; i++) {
        for (j = 0; j < 2; j++) {
            printf("a[%d][%d] = %d\n", i, j, a[i][j]);
        }
    }

    printf("\n");
    //--

    int arr4[3][5] = {1, 2, 3, 4, 5, 10, 20, 30, 40, 50, 5, 10, 15, 20, 25};

    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 5; j++) {
            printf("%4d", arr4[i][j]);
        }
        printf("\n");
    }
}
void example2() {
    int i, j, k;
    int arr[3][3][3] = {
        {{11, 12, 13}, {14, 15, 16}, {17, 18, 19}},
        {{21, 22, 23}, {24, 25, 26}, {27, 28, 29}},
        {{31, 32, 33}, {34, 35, 36}, {37, 38, 39}},
    };

    printf("Printing 3D Array Elements\n");

    for (i = 0; i < 3; i++) {
        for (j = 0; j < 3; j++) {
            for (k = 0; k < 3; k++) {
                printf("%4d", arr[i][j][k]);
            }
            printf("\n");
        }
        printf("\n");
    }
}
void example3() {
    int arr[3][5] = {
        {1, 2, 3, 4, 5}, {10, 20, 30, 40, 50}, {5, 10, 15, 20, 25}};
    int i, j;
    int sum;

    for (i = 0; i < 3; i++) {
        sum = 0;
        for (j = 0; j < 5; j++) {
            sum += arr[i][j];
        }
        printf("Sum of row %d: %d\n", i, sum);
    }
}
void example4() {
    //-- Matrix Multiplication
    int mat1[3][3] = {{2, 4, 1}, {2, 3, 9}, {3, 1, 8}};
    int mat2[3][3] = {{1, 2, 3}, {3, 6, 1}, {2, 4, 7}};
    int mat3[3][3], sum = 0, i, j, k;

    for (i = 0; i < 3; i++) {
        for (j = 0; j < 3; j++) {
            sum = 0;
            for (k = 0; k < 3; k++)
                sum = sum + mat1[i][k] * mat2[k][j];
            mat3[i][j] = sum;
        }
    }
    printf("\nMatrix 1 ...\n");
    for (i = 0; i < 3; i++) {
        for (j = 0; j < 3; j++)
            printf("%d\t", mat1[i][j]);
        printf("\n");
    }

    printf("\nMatrix 2 ...\n");
    for (i = 0; i < 3; i++) {
        for (j = 0; j < 3; j++)
            printf("%d\t", mat2[i][j]);
        printf("\n");
    }

    printf("\nMultiplication of the two given Matrices: \n");
    for (i = 0; i < 3; i++) {
        for (j = 0; j < 3; j++)
            printf("%d\t", mat3[i][j]);
        printf("\n");
    }
}
void example5() {}