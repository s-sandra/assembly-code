#include <stdio.h>

extern int increment_asm();

int not_on_stack = 10;

void increment_c(int *value) { 
   (*value)++; 
}

int main (int argc, char **argv) {
    int value = 12;
    printf("value in main: address: 0x%p, value: %d\n", &value, value);
    printf("not_on_stack: address: 0x%p, value: %d\n", &not_on_stack, not_on_stack);
    printf("address of main: 0x%p\n", &main);
    printf("address of increment_asm: 0x%p\n", increment_asm);
    increment_c(&value);
    printf("after increment_c call:\n");
    printf("value in main: address: 0x%p, value: %d\n", &value, value);
    printf("not_on_stack: address: 0x%p, value: %d\n", &not_on_stack, not_on_stack);
    printf("address of main: 0x%p\n", &main);
    increment_asm(&value);
    printf("after increment_asm call:\n");
    printf("value in main: address: 0x%p, value: %d\n", &value, value);
    printf("not_on_stack: address: 0x%p, value: %d\n", &not_on_stack, not_on_stack);
    printf("address of main: 0x%p\n", &main);
}
