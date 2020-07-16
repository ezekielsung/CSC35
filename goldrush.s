# Ezekiel Sung CSC35
# Gold Rush Project



.data

#Counter variables for various items
numWeeks:
	.quad 1
	
numFunds:
	.quad 100

numSluice:
	.quad 0

numProfit:
	.quad 0

numCost:
	.quad 0

numCounter:
	.quad 1
	
numPanning:
	.quad 0
	
numSluicing:
	.quad 0
	
numFood:
	.quad 0
	
numBroke:
	.quad 0
numRandom:
	.quad 0
	
#Display Intro Screen and rules
Intro:
	.ascii "=========================\n"
	.ascii "      GOLD RUSH          \n"
	.ascii "=========================\n\0"
	
Rules:
	.ascii "\nRules:\n"
	.ascii "1. 20 weeks (5 months)\n" 
	.ascii "2. Panning for gold yields 0-25 dollars.\n"
	.ascii "3. A sluice yields 0-75 dollars (there is a 10% chance a sluice will break).\n"
	.ascii "4. Food cost 10-20 dollars.\n\0"
Week:
	.ascii "\n\n------------------------------------------\nWEEK \0"
	

#Various Print Statements throughout the game
Inventory1:
	.ascii "\nYou have $\0"
	
Inventory2:
	.ascii " and \0"

Inventory3:
	.ascii " sluice(s)\0"

Choice:
	.ascii "\n Do you want to (1) buy a sluice for $100 or (2) keep working?\n\0"
	
Panning:
	.ascii "Panning for gold yields $\0"

Sluicing1:
	.ascii "\nSluice \0"

Sluicing2:
	.ascii " yields \0"
	
Sluicing3:
	.ascii " in gold\n\0"

Food1:
	.ascii "\nYou ate $\0"
	
Food2:
	.ascii " in food\n\0"

Cost1:
	.ascii "\nYou earned $\0"

Cost2:
	.ascii " and spent $\0"

SluiceBroke1:
	.ascii "\n SLUICE \0"
	
SluiceBroke2:
	.ascii " BROKE!\n\0"
Ending:
	.ascii "\n\n========================================\nYou ended the 20 weeks with $\0"
Lucky:
	.ascii "\n\nYOU STRUCK GOLD AND GOT $100!!\0\n"
Unlucky:
	.ascii "\n\nYOU WERE ROBBED DURING THE NIGHT!\n\0"
SuperLucky:
	.ascii "\n\nYOU FOUND A SLUICE! \n\0"
	


.text
.global _start
_start:
	
	mov $Intro, %rcx
	Call PrintCString      #Print the GoldRush text
	
	mov $Rules, %rcx
	Call PrintCString      #Print the Rules of the game

Wholeweek:
	mov $Week, %rcx
	Call PrintCString   #Print "week"

	mov numWeeks, %rcx
	Call PrintInt      #Print week number

        

	#Print out amount of money and sluices
	mov $Inventory1, %rcx
	Call PrintCString

	mov numFunds, %rcx
	Call PrintInt

	mov $Inventory2, %rcx
	Call PrintCString

	mov numSluice, %rcx
	Call PrintInt

	mov $Inventory3, %rcx
	Call PrintCString

	
	#Print choice and ask user to make a choice
	mov $Choice, %rcx
	Call PrintCString

	Call ScanInt
	mov %rcx, %r10

	cmp $1, %r10   #compare user input to 1
	je Purchase    #jump to purchase sluice if 1
	jmp Work       #jump to work if anything but 1
	
Purchase:
	#make sure user has sufficient funds to purchase
	cmp $100, numFunds
	jl Work
		
	#purchase sluice
	add $1, numSluice
	add $100, numCost

#Pan for Gold and print how much gold made from panning	
Work:
	mov $Panning, %rcx
	Call PrintCString

	#random panning gold
	mov $25, %rcx
	Call Random


	mov %rcx, numPanning
	mov numPanning, %rcx
	Call PrintInt

	add %rcx, numProfit
	mov $0, %rcx
	mov %rcx, numPanning

	#If there are no sluices, jump to cost
	cmp $0, numSluice
	je Cost
	

	
ProfitSluice:

	
	mov $Sluicing1, %rcx	
	Call PrintCString
	
	mov numCounter, %rcx	#Loop through each sluice
	Call PrintInt

	mov $Sluicing2, %rcx
	Call PrintCString
	
	mov $76, %rcx			#Generate how much gold each sluice made
	Call Random
	Call PrintInt

	mov %rcx, numPanning	#Add that amount to total profit
	mov numPanning, %rcx
	add %rcx, numProfit

	mov $0,%rcx
	mov %rcx, numPanning

	mov $Sluicing3, %rcx
	Call PrintCString

	mov $1, %rcx			#Increment counter for amount of sluices 
	add %rcx, numCounter
	
	mov numCounter, %rcx
	cmp numSluice, %rcx
	
	jle ProfitSluice




Cost:
	
	mov $1, %rcx
	mov %rcx, numCounter  #resets the counter back to 1
	
	mov $Food1, %rcx
	Call PrintCString
	
	mov $10, %rcx			#generate how much food cost random from 10-20

	Call Random
	add $10, %rcx
	Call PrintInt
	
	add %rcx, numCost		#Add food cost to total cost
	
	
	mov $Cost1, %rcx		#Print out food cost and profit
	Call PrintCString
	
	mov numProfit, %rcx
	Call PrintInt
	
	mov $Cost2, %rcx
	Call PrintCString
	
	mov numCost, %rcx
	Call PrintInt
	
	mov numProfit, %rcx
	add %rcx, numFunds
	
	mov numFunds, %rcx    #If they spend more money than they have, they do not go negative, but just go to 0 dollars. 
	cmp numCost, %rcx
	jge Enough
	
	mov $0, %rcx
	mov %rcx, numFunds
	jmp Setzero

Enough:

	mov numCost, %rcx
	sub %rcx, numFunds

Setzero:	
	mov $0, %rcx
	mov %rcx, numProfit
	mov %rcx, numCost
	
	cmp $0, numSluice
	je Outside
	
Broke:
	mov $10, %rcx		#Loop through each sluice, and see if it broke
	Call Random			#10 percent chance that a sluice would break
	cmp $0, %rcx
	
	jg Didntbreak		#If it did not break, jump to "Didntbreak"
		
	mov $SluiceBroke1, %rcx		#Print out that the sluice broke
	Call PrintCString
	
	mov numCounter, %rcx
	Call PrintInt
			
	mov $SluiceBroke2, %rcx
	Call PrintCString
	
	mov $1, %rcx			#Add 1 to the amount of sluices broken
	add %rcx, numBroke	
	
	
Didntbreak:
	 
	 mov $1, %rcx			#Increment to next sluice 
	 add %rcx, numCounter
	 
	 mov numCounter, %rcx	#Jump back to Broke and break the sluice if there are more sluices
	 cmp numSluice, %rcx
	 
	 jle Broke
	 
#Random event 1. 5% chance of getting $100 
GetLucky:
	
	mov $20, %rcx
	Call Random
	cmp $1, %rcx
	jg GetUnlucky
	
	mov $Lucky, %rcx
	Call PrintCString
	
	mov $100, %rcx
	add %rcx, numFunds

#Random event 2. 3% chance of losing $100
GetUnlucky:
	
	mov $20, %rcx
	Call Random
	cmp $1, %rcx
	jg GetSuperLucky
	
	mov $Unlucky, %rcx
	Call PrintCString
	
	mov $100, %rcx
	cmp numFunds, %rcx
	jge Unlucky1
	
	mov $100, %rcx
	sub %rcx, numFunds
	jmp GetSuperLucky
	

#in the case that they lose $100 but have less than $100. set their funds to $0	
Unlucky1:
	mov $0, %rcx
	mov %rcx, numFunds

#Random event 3. 1.5% chance to gain extra sluice
GetSuperLucky:
	mov $23, %rcx
	Call Random
	cmp $1, %rcx
	jg Outside
	
	mov $SuperLucky, %rcx
	Call PrintCString
	
	mov $1, %rcx
	add %rcx, numSluice



Outside:

	mov numBroke, %rcx     #Subtract the amount of sluices broken from amount of sluices
	sub %rcx, numSluice
	
	mov $0, %rcx
	mov %rcx, numBroke		#Reset the counter of sluices broken back to 0
	
	mov $1, %rcx
	mov %rcx, numCounter	#Reset counter variable back to 1




	mov $1, %rcx			#Increment week
	add %rcx, numWeeks
	mov numWeeks, %rcx
	
	cmp $21, %rcx
	jl Wholeweek			#If it is not the 20th week, jump back to Wholeweek


	mov $Ending, %rcx			#Print end statement with how much money user was left with
	Call PrintCString

	mov numFunds, %rcx
	Call PrintInt


	Call EndProgram			#EndProgram
