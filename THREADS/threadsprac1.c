#include <stdio.h>
#include <pthread.h>

void * thread1(void* arg)
{
	printf("Thread 1 in action \n");
	pthread_exit(NULL);
}

void * thread2(void* arg)
{
	printf("Thread 2 in action \n");
	pthread_exit(NULL);
}

int main()
{
	pthread_t t1;
	pthread_t t2;

	pthread_create(&t1,NULL,thread1,NULL);
	pthread_create(&t2,NULL,thread2,NULL);

	pthread_join(t1,NULL);
	pthread_join(t2,NULL);

	return 0;
}

