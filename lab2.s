#lab2.s
#
#1.Assemble   : as -o lab2.o lab2.s
#2.Link       : ld -o a.out lab2.o csc35.o
#3.Execute    : a.out

.data

q1:
	.ascii "How much do you make each month?\n\0"
q2: 
	.ascii "Monthly car payment?\n\0"
q3:
	.ascii "Monthly credit card payment?\n\0"
q4:
	.ascii "Monthly house/apartment cost?\n\0"
message1:
	.ascii "Well, your actual income is $\0"

.text
.global _start

_start:
	mov $q1, %rcx
	call PrintCString
	call ScanInt
	mov %rcx, %r15

	mov $q2, %rcx
	call PrintCString
	call ScanInt
	mov %rcx, %r14

	mov $q3, %rcx
	call PrintCString
	call ScanInt
	mov %rcx, %r13


	mov $q4, %rcx
	call PrintCString
	call ScanInt
	mov %rcx, %r12

	mov $message1, %rcx
	Call PrintCString

	add %r13, %r14
	add %r12, %r14
	sub %r14, %r15
	mov %r15, %rcx
	Call PrintInt



	call EndProgram
	

