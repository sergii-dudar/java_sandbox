#include <stdio.h>
#include <string.h>

struct book {
	char title[10];
	double price;
	int pages;
};
struct person {
	char *name;
	int age;
	float weight;
};

void example1();
void example2();
void example3();
void example4();
void example5();

int main() {
	char name1[] = "data";
	printf("%s\n", name1);
	char *name2 = name1;
	printf("%s\n", name2);

	printf("\n\n");
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
	struct book b1 = {"Learn C", 675.50, 325};
	struct book *strptr;
	strptr = &b1;

	printf("Title: %s\n", strptr->title);
	printf("Price: %lf\n", strptr->price);
	printf("No of Pages: %d\n", strptr->pages);
}
void example2() {
	struct person *personPtr, person1;

	person1.name = "Meena";
	person1.age = 40;
	person1.weight = 60;

	personPtr = &person1;

	printf("Displaying the Data: \n");
	printf("Name: %s\n", personPtr->name);
	printf("Age: %d\n", personPtr->age);
	printf("Weight: %f", personPtr->weight);
}
void example3() {}
void example4() {}
void example5() {}