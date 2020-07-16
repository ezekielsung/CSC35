.data

q1:
	.ascii "What is the size of sugar cube?\n\0"
q2:
	.ascii "How many sugar cubes does the dessert take?\n\0"
s1:
	.ascii "Total sugar for each is \0"
s2:
	.ascii "!\n\0"
q3:
	.ascii "How much sugar can the Weene have?\n\0"
s3:
	.ascii "The Weenie can only have \0"
s4:
	.ascii " of these.\0"

.text
.global _start

_start:
	

MOV $q1, %rcx
Call PrintCString
Call ScanInt
mov %rcx, %r15
mov %rcx, %r14
imul %r15, %r15
imul %r15, %r14

mov $q2, %rcx
Call PrintCString
Call ScanInt
mov %rcx, %r13
imul %r14, %r13
mov $s1, %rcx
Call PrintCString
mov %r13, %rcx
Call PrintInt
mov $s2, %rcx
Call PrintCString

mov %r13, %rbx
mov $q3, %rcx
Call PrintCString
Call ScanInt
mov %rcx, %rax
CQO
div %rbx
mov %rax, %r12

mov $s3, %rcx
Call PrintCString

mov %r12, %rcx
Call PrintInt

mov $s4, %rcx
Call PrintCString















call EndProgram

