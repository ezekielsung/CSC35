#lab5.s
# Ezekiel Sung
#1.Assemble	: as -o lab5.o lab5.s
#2.Link		: ld -o lab4.o csc35.o
#3.Execute	: a.out


.data

intro:
	.ascii "I am your delicious Hogwarts Alphabet Soup.\nBefore you can eat me, you must guess my letter!\n\0"
guess:
	.ascii "Guess: \0"
low:
	.ascii "You are too low\n\0"
high:
	.ascii "You are too high\n\0"
correct:
	.ascii "Correct! You may now eat me!\0"


.text
.global _start

_start:
	
	mov $26, %rcx
	Call Random
	add $97, %rcx
	mov %rcx, %rax
		
	mov $intro, %rcx
	Call PrintCString

while:

	mov $guess, %rcx
	Call PrintCString
	Call ScanChar
	
	cmp %al, %cl
	je right
	jl higher
	jg lower



right:
	mov $correct, %rcx
	Call PrintCString
	jmp  End

higher:
	mov $low, %rcx
	Call PrintCString
	jmp while

lower:
	mov $high, %rcx
	Call PrintCString
	jmp while

End:
	Call  EndProgram	
