#include <stdio.h>


extern void foo();

int main() {
	foo();
	printf("hello main\n");
	return 0;
}
