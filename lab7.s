# Lab 7
# Ezekiel Sung


.data

Intro:
	.ascii "I'M MR. MEESEEKS. LOOK AT ME!\n\0"
Conclusion:
	.ascii "? CAN DO!\n\0"
Sentence:
	.space 30


.text
.global _start

_start:

	mov $Intro, %rcx
	Call PrintCString   #Print Intro message
	
	mov $Sentence, %rdx #Move memory address to rdx
	
	Call ScanCString	#Scan for user input
	
	mov %rcx, %r13	#Move user input into sentence
	
	mov %r13, %rcx	#Check how long is user input
	Call LengthCString
	
	mov %rcx, %r15
	mov $0, %r14
	
Do:

	cmp %r15, %r14     #Jump to end if counter greater than size
	jg End
	
	cmpb $122, (%r13,%r14) #Compare each byte of the String
	jg Increment
	
	cmpb $96, (%r13, %r14)
	jg Subtract
	
	add $1, %r14
	jmp Do
	
Subtract:
	subb $32, (%r13, %r14)  #Make it uppercase
	add $1, %r14
	jmp Do
	
Increment:
	add $1, %r14   #Add 1 to the counter
	jmp Do
	
End:
	mov %r13, %rcx     #Print output 
	Call PrintCString
	
	mov $Conclusion, %rcx
	Call PrintCString

	
	
	
	Call EndProgram
