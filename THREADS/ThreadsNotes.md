#Threads

##Process are considered heavyweight, while Threads can be seen as a lightweight process

## Multithreading:
Allowing multiple threads per process 
 
### Benefitres of multithreading:
- Responsiveness
- Resource sharing
- Economy
- Scalability 
 
## Thread View
### Operating System Perspective:
An indepentent stream of instructions that can be scheduled to be run by the OS 
 
### Programmer Perspective:
can be seen as a "function" that executes independently from the main program 
 
A single stream of instrucitons in a program 
 
### Multiple threads ccan share a process
- Multiple flows of control within a precess
- Share code and data space of a process
- lower overhead, avoid context switches 
 
## Execution Environment
The process is the **xecution environment** for a family of threads 
 
## Thread Properties
Each thread has its own:
	- Program Counter (PC)
	- Stack
	- Stack Pointer (SP)
	- Registers
	- Scheduling properties
	- Set of pending/blocked signals
	- Thread specific data
Threads share:
- Address space
- Variables
- code
- Open files

## Thread Issues:
- **Two pointers having the same value** pont to the same data
- Reading and writing to the same memory locations is possible
- Meaning it needs required explicit sychronization by the programmer like locking the register or forcing one to wait while it is in use by the other threads

#POSIX Threads 
 
- The most commonly used thread package on LINUX also known as pthreads
- Standards-based API to create, manage, and synchronize threads
------------------------------------------------------------------------------
- Thread package includes library calls for
- Thread management (creation, destruction)
- Mutual exclusion (synchronization, short-term locking)
- Condition variables (waiting on events of unbounded duration)


## Creating Threads
Code snippet: 
 
int pthread_create(pthread_t *tid, const
pthread_attr_t *tattr, void* (*start_routine)
(void *), void *arg);

- tid: an unsigned long integer that indicates a thread’s id
- tattr: attributes of the thread – usually NULL
- start_routine: the name of the function the thread starts executing
- arg: the argument to be passed to the start routine – only one
- After this function gets executed, a new thread has been created and is executing the function indicated by start_routine
-----------------------------------------------------------------------------
- Once created, Threads are peers, and may create other threads
- THere is no implied hierarchy or dependency between threads


## Joining Threads
- Joining is one way to sync threads where the pocess waits for all threads to compete
- we call the funtion * pthread_join() * once for each thread

### How to wait for the completeion of a thread 
 
int pthread_join(thread_t tid, void **status);

- tid: identification of the thread to wait for
- status: the exit status of the terminating thread – can be NULL
- The process that calls this pthread_join function blocks its own execution until the thread indicated by tid terminates its execution
- Finishes the function it started with, or
- Issues a pthread_exit() command

