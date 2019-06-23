#include <stdio.h>

extern int find_largest_asm(int* array, int array_size);

int find_largest(int* array, int len){
	int largest = array[0];
	
	for (int i = 0; i < len; i++){
		if(array[i] > largest){
			largest = array[i];
		}
	}
	return largest;
}

int main() {
    int array[5] = {1, 5, -1, 30, 7};
    int ans = find_largest(&array, 5);
    printf("Answer: %d\n", ans); // prints 30
    ans = find_largest_asm(&array, 3);
    printf("Answer: %d\n", ans); // prints 5

    return 0;
}
