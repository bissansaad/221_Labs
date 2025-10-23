#include <stdio.h>

int main() {
	unsigned int x;

    	printf("Enter a number: ");
    	scanf("%u", &x);
	
    	int first = !!x;
    	int second = !!(~x);
    	int third = !!(x & 0xFF);   
    	int fourth = !!(~(x >> 24) & 0xFF);

    	printf("1) Any bit of x == 1: %d\n", first);
    	printf("2) Any bit of x == 0: %d\n", second);
    	printf("3) Any bit in least significant byte == 1: %d\n", third);
    	printf("4) Any bit in most significant byte == 0: %d\n", fourth);

    	return 0;
}

