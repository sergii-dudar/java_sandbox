/* Online C Compiler and Editor */
#include <math.h>
#include <stdio.h>

/*forward declaration of function*/
float area_of_square(float);

enum week { Mon = 10, Tue, Wed, Thur, Fri = 10, Sat = 16, Sun };

// main function - entire line is a comment
int main() {

	// variable declaration (this comment is after the C statement)
	float side = 5.50;

	float area = area_of_square(side); // calling a function
	printf("Side = %5.2f Area = %5.2f\n", side, area);

	printf("The value of enum week: %d\n", Mon);
	return 0;
}

float area_of_square(float side) {
	float area = pow(side, 2);
	return area;
}