#include <stdio.h>
#include <stdlib.h>



int main(){ 

	int* int_ptr = (int*)malloc(2 * sizeof(int_ptr));

	if(int_ptr == NULL){
	printf("memory allocation failed\n");
	return 1;
	}

	printf(stderr, "please enter an integer\n");
	scanf("%d", &int_ptr[0]);

	printf("please enter your second integer\n");
	scanf("%d", &int_ptr[1]);

	printf("original values:%d %d\n", int_ptr[0], int_ptr[1]);

	int_ptr[0] = int_ptr[0] ^ int_ptr[1];
	int_ptr[1] = int_ptr[0] ^ int_ptr[1];
	int_ptr[0] = int_ptr[0] ^ int_ptr[1];

	printf("new values: %d %d\n", int_ptr[0], int_ptr[1]);

	free(int_ptr);

return 0;
}
