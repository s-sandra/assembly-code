#include <stdio.h>

extern int sum_numbers(int number);

int main() {
    printf("Sum from 1 to 5: %d\n", sum_numbers(5)); // prints 15
    return 0;
}
