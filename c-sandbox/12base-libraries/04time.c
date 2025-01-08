#include <stdio.h>
#include <time.h>
#include <wchar.h>
// https://www.tutorialspoint.com/c_standard_library/time_h.htm
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
    struct tm tm = *localtime(&(time_t) {time(NULL)});
    printf("Current local time (using asctime()): %s\n", asctime(&tm));

    time_t curtime;
    time(&curtime);
    printf("Current time = %s", ctime(&curtime));
}
void example2() {
    size_t maxsize = 80;
    char dest[maxsize];

    time_t now;
    struct tm *tm_struct;

    time(&now);
    tm_struct = localtime(&now);

    strftime(dest, maxsize, "%D", tm_struct);
    printf("Current date: %s\n", dest);
}
void example3() {
    // format the date and time as a string
    // https://www.tutorialspoint.com/c_standard_library/c_function_strftime.htm
    time_t rawtime;
    struct tm *info;
    char buffer[80];

    time(&rawtime);

    info = localtime(&rawtime);

    strftime(buffer, 80, "%x - %I:%M%p", info);
    printf("Formatted date and time : |%s|\n", buffer);
}
void example4() {
    // Get the current time
    time_t now = time(NULL);

    printf("Current timestamp: %ld\n", now);

    // Convert to local time
    struct tm *local_time = localtime(&now);
    printf("Local time: %s", asctime(local_time));

    // Calculate a new time (add 1 minute)
    local_time->tm_min += 1;
    time_t new_time = mktime(local_time);
    printf("New timestamp (1 minute later): %ld\n", new_time);

    // Format the time
    char formatted_time[100];
    strftime(formatted_time, sizeof(formatted_time), "%l %p", local_time);
    printf("Formatted time: %s\n", formatted_time);

    // Measure execution time
    clock_t start = clock();
    for (int i = 0; i < 100000000; ++i) {
    }
    clock_t end = clock();

    double total_time = (double) (end - start) / CLOCKS_PER_SEC;
    printf("Execution time: %.6f seconds\n", total_time);
}
void example5() {
    // https://www.tutorialspoint.com/c_standard_library/c_function_wcsftime.htm
    time_t demotime;
    struct tm *timeinfo;
    wchar_t buffer[80];

    time(&demotime);
    timeinfo = localtime(&demotime);

    // Custom formatting of time
    wcsftime(buffer, 80, L"The current Date: %A, %F %I:%M %p", timeinfo);
    wprintf(L"%ls\n", buffer);
}