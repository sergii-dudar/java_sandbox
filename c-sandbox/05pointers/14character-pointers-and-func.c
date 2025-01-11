#include <stdio.h>
#include <string.h>
// https://www.tutorialspoint.com/cprogramming/c_character_pointers_and_functions.htm

// A character pointer stores the address of a character type or address of the
// first character of a character array (string). Character pointers are very
// useful when you are working to manipulate the strings.
//
// The following is the syntax to initialize a character pointer of a character
// array :
// char *pointer_name = char_array;
// char *pointer_name = &char_array[0];

/* char arr[] = "Hello";
 The string is a NULL terminated array of characters. The last element in the
 above array is a NULL character (\0).

Declare a pointer of char type and assign it the address of the character at the
0th position − char *ptr = &arr[0];

Remember that the name of the array itself is the address of 0th element.
char *ptr = arr;

A string may be declared using a pointer instead of an array variable (no square
brackets). char *ptr = "Hello";

This causes the string to be stored in the memory, and its address stored in
ptr. We can traverse the string by incrementing the ptr.

while(*ptr != '\0'){
   printf("%c", *ptr);
   ptr++;
}

 */

void example1();
void example2();
void example3();
void example4();
void example5();
void example6();
int str_len(char *);
void str_cpy(char *d, char *s);
int str_cmp(char *str1, char *str2);

int main() {

    printf(">>>>>--------------EXAMPLE1--------------<<<<<\n");
    example1();

    printf("\n\n>>>>>--------------EXAMPLE2--------------<<<<<\n");
    example2();

    printf("\n\n>>>>>--------------EXAMPLE3--------------<<<<<\n");
    example3();

    printf("\n\n>>>>>--------------EXAMPLE4--------------<<<<<\n");
    example4();

    printf("\n\n>>>>>--------------EXAMPLE5--------------<<<<<\n");
    example5();

    printf("\n\n>>>>>--------------EXAMPLE6--------------<<<<<\n");
    example6();

    return 0;
}

void example1() {
    // Declare two variables
    char x = 'P';
    char arr[] = "TutorialsPoint";

    // Declaring character pointers
    char *ptr_x = &x;
    char *ptr_arr = arr;

    // Printing values
    // printf("Value of x : %s\n", ptr_x);
    printf("Value of x : %c\n", *ptr_x);
    printf("Value of arr: %s\n", ptr_arr);
}
void example2() {
    char arr[] = "Character Pointers and Functions in C";
    char *ptr = arr;

    while (*ptr != '\0') {
        printf("%c", *ptr);
        ptr++;
    }

    // Alternatively, pass ptr to printf() with %s format to print the string.
    char *ptr2 = arr;
    printf("\n%s", ptr2);
}
void example3() {
    char *ptr = "Hello";

    printf("Given string: %s \n", ptr);
    printf("Length of the string: %d", strlen(ptr));
    printf("\nLength of the string: %d", str_len(ptr));
}
int str_len(char *ptr) {
    int i = 0;
    while (*ptr != '\0') {
        i++;
        ptr++;
    }
    return i;
}

void example4() {
    char *ptr = "How are you doing?";
    char ptr1[20];

    strcpy(ptr1, ptr);
    printf("%s", ptr1);

    str_cpy(ptr1, ptr);
    printf("\n%s", ptr1);
}
void str_cpy(char *d, char *s) {
    int i;
    for (i = 0; s[i] != '\0'; i++)
        d[i] = s[i];

    d[i] = '\0';
}
void example5() {
    char *s1 = "BASK";
    char *s2 = "BALL";

    int ret = strcmp(s1, s2);

    if (ret == 0)
        printf("Both strings are identical\n");
    else if (ret > 0)
        printf("The first string appears after the second string \n");
    else
        printf("The first string appears before the second string \n");
}
void example6() {
    char *s1 = "The Best C Programming Tutorial Available Online";
    char *s2 = "The Best C Programming Tutorial Available Online";

    int ret = str_cmp(s1, s2);

    if (ret == 0)
        printf("Both strings are identical\n");
    else if (ret > 0)
        printf("The first string appears after the second string\n");
    else
        printf("The first string appears before the second string\n");
}
int str_cmp(char *str1, char *str2) {
    while (*str1 != '\0' && *str2 != '\0') {
        if (*str1 != *str2) {
            return *str1 - *str2;
        }
        str1++;
        str2++;
    }

    // If both strings are equal, return 0

    return 0;
}