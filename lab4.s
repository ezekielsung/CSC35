#lab4.s
# Ezekiel Sung
#1.Assemble 	: as -o lab4.o lab4.s
#2.Link 	: ld -o lab4.o csc35.o
#3.Execute	: a.out


.data

m1:
	.ascii "Not doing homework 	: 3 points\n\0"
m2:
	.ascii "Breaking something	: 7 points\n\0"
m3:
	.ascii "House on fire		: 24 points\n\0"

q1:
	.ascii "How many times did he not do homework?\n\0"
q2:
	.ascii "How many times did he break something?\n\0"
q3:
	.ascii "How many times did house catch on fire?\n\0"
s1:
	.ascii "That's \0"
s2:
	.ascii " naughty points!\n\0"

punish1:
	.ascii "No punishment.\n\0"
punish2:
	.ascii "No dessert for a week.\n\0"
punish3:
	.ascii "No video games for 2 weeks.\n\0"


.text
.global _start

_start:

	mov $m1, %rcx
	Call PrintCString

	mov $m2, %rcx
	Call PrintCString

	mov $m3, %rcx
	Call PrintCString

	mov $q1, %rcx
	Call PrintCString
	Call ScanInt
	mov %rcx, %r15
	imul $3, %r15

	mov $q2, %rcx
	Call PrintCString
	Call ScanInt
	mov %rcx, %r14
	imul $7, %r14

	mov $q3, %rcx
	Call PrintCString
	Call ScanInt
	mov %rcx, %r13
	imul $24, %r13

	add %r14, %r15
	add %r13, %r15
	
	mov $s1, %rcx
	Call PrintCString

	mov %r15, %rcx
	Call PrintInt

	mov $s2, %rcx
	Call PrintCString
	
	mov %r15, %rcx
	cmp $7, %rcx
	jle punishment1

	cmp $20, %rcx
	jle punishment2

	
	


punishment3:
	mov $punish3, %rcx
	Call PrintCString
	jmp End

punishment2:
	mov $punish2, %rcx
	Call PrintCString
	jmp End

punishment1:
	mov $punish1, %rcx
	Call PrintCString
	jmp End







End:
	Call EndProgram

