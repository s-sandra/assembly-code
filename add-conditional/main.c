#include <stdio.h>

extern int add_more_asm(char o, int a, int b);

int main() {
	int a, b, c;
	char o;

    do {
        printf("Enter hex operands: ");
        scanf("%x %x", &a, &b);   
        printf("Enter operation: ");
        scanf(" %c", &o);
        printf("confirm: a = 0x%08x b = 0x%08x operator = %c\n", a, b, o); 
        c = add_more_asm(o, a, b);
        printf("0x%08x %c 0x%08x = 0x%08x\n", a, o, b, c);
    } while (c != 0x12345678);
    
    return 0;
}
