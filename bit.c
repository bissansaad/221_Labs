#include <stdio.h>

int main(void) {
    unsigned int x;

    printf("Enter a number: ");
    scanf("%u", &x);

    int cond1 = !!x;                  // any bit of x = 1
    int cond2 = !!(~x);               // any bit of x = 0
    int cond3 = !!(x & 0xFF);         // any bit in least significant byte = 1
    int cond4 = !!(~(x >> 24) & 0xFF); // any bit in most significant byte = 0

    printf("1) Any bit of x == 1: %d\n", cond1);
    printf("2) Any bit of x == 0: %d\n", cond2);
    printf("3) Any bit in least significant byte == 1: %d\n", cond3);
    printf("4) Any bit in most significant byte == 0: %d\n", cond4);

    return 0;
}

