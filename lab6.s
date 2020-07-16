 # lab6.s
 # Ezekiel Sung
 # Silly Sentences
 
.data
 
 
Intro:
	.ascii "Welcome to Silly Sentences!\n\0"
	
A1:
	.ascii "Player A, enter a noun: \0"
A2:
	.ascii "\nPlayer A, enter a preposition: \0"
B1:
	.ascii "\nPlayer B, enter a verb: \0"
B2:
	.ascii "\nPlayer B, enter a noun: \0"
Outro:
	.ascii "\nYour sentence is:\n\n\0"
Space:
	.ascii " \0"
Period:
	.ascii ".\0"

Noun:
	.space 60
Verb:
	.space 60
Preposition:
	.space 60
Noun2:
	.space 60
	
	
.text
.global _start

_start:

	mov $Intro, %rcx
	Call PrintCString      #Print welcome message
	
	mov $A1, %rcx
	Call PrintCString      #Scan for player A noun
	
	mov $Noun, %rdx			

	Call ScanCString		
	mov %rcx, Noun
	
	
	
	Call ClearScreen		#clear screen
	
	mov $B1, %rcx			#Scan  for player B verb
	Call PrintCString
	
	mov $Verb, %rdx
	
	Call ScanCString
	mov %rcx, Verb
					
	Call ClearScreen  #clear screen
	
	
	mov $A2, %rcx   #scan for player A preposition
	Call PrintCString
	
	mov $Preposition, %rdx
	
	Call ScanCString
	mov %rcx, Preposition
	
			
	Call ClearScreen #clear screen
	
	mov $B2, %rcx
	Call PrintCString
	
	mov $Noun2, %rdx
	
	Call ScanCString
	mov %rcx, Noun2
	
	Call ClearScreen	
	
	#Print out outro and silly sentence
	mov $Outro, %rcx
	Call PrintCString
	
	mov Noun, %rcx
	Call PrintCString
	
	mov $Space, %rcx
	Call PrintCString
	
	mov Verb, %rcx
	Call PrintCString
	
	mov $Space, %rcx
	Call PrintCString
	
	mov Preposition, %rcx
	Call PrintCString
	
	mov $Space, %rcx
	Call PrintCString
	
	mov Noun2, %rcx
	Call PrintCString
	
	mov $Period, %rcx
	Call PrintCString

	
	
	Call EndProgram	
