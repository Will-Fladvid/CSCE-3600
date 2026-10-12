processes are copies of installed files that run in the primary memory/cache

This is important to know because it is how we can run multiple things at the same time without needing to load
the full program into RAM (like counterstrike being 60GB but only use 12GB of RAM)

the process acts like its name, it executes instructions of a program in order.

** A program becomes a process when it is loaded into the RAM **

** OS is responsible for creating processes, suspesnion, process syncronization, and process communication **

** Processes are assigned PID's to identify which process is which, and which program owns each process **

## Parent process V.S. Child Processes

### Parent:
login (pid 50)
	bash (pid 500)
	ls -l/home
	top
### Child:
login
	bash
	ls -l/home (pid 501)
	top (pid 502)



## Well known processes and their ID's
Swapper/sched (PID 0)
	a part of the kernel responsible for memory management

init (PID 1) * was replaced by systemd in new distros *


# IMPORTANT: CHILD PROCESSES CAN BE INHARETED BY THE PARENT'S PARENT.
If FireFox was created by bash but bash is killed, FireFox can be picked up by init. There isn't a way to predict this
behavior either...

## Process Context
 
### User Level:

### Register Level:

### System Level:


##Context Switching


