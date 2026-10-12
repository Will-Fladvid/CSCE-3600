#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <stdlib.h>

int main(){

	pid_t pid;
	int i = 0;
	pid = fork();
	if (pid == -1){
		printf("Fork Failed:");
		exit(1);
	}
	else if(pid == 0){
		for(i = 0; i<10; i++){
			printf("Child\n");
		}
	}
	else{
		for(i = 0; i<5; i++){
			printf("Parent\n");
		}
	}
return 0;
}
