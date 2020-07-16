# Lab 8
# Ezekiel Sung


.data

Intro:
	.ascii "Welcome human!\n\n\0"
Prompt:
	.ascii "Tell the Great Bender your name:\n\0"
Hello:
	.ascii "\nHello \0"
Conclusion:
	.ascii "! I'm fun on a bun!\0"
Name:
	.space 40


.text
.global _start

_start:

	#write intro to screen
	mov $1, %rax
	mov $1, %rdi
	mov $Intro, %rsi
	mov $16, %rdx
	syscall

	#Write prompt to screen
	mov $1, %rax
	mov $1, %rdi
	mov $Prompt, %rsi
	mov $33, %rdx
	syscall


	#Read from the keyboard
	mov $0, %rax
	mov $0, %rdi
	mov $Name, %rsi
	mov $40, %rdx
	Syscall
	mov %rax, %r15  #store name bytes

		

	#write hello
	mov $1, %rax
	mov $1, %rdi
	mov $Hello, %rsi
	mov $7, %rdx
	syscall		
	
	
	mov %r15, %rcx
	sub $1, %rcx
	mov %rcx, %r15

		
	#Print name
	mov $1, %rax
	mov $1, %rdi
	mov $Name, %rsi
	mov %r15, %rdx
	syscall
	
	#write conclusion
	mov $1, %rax
	mov $1, %rdi
	mov $Conclusion, %rsi
	mov $19, %rdx
	syscall
	
	#end the program
	mov $60, %rax
	Syscall

	
