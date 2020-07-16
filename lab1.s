# lab1.s
# Ezekiel Sung
#
# 1. Assemble : as -o lab1.o lab1.s
# 2. Link     : ld -o a.out. lab1.o csc35.o
# 3. Execute  : a.out

.data
Message:
	.ascii "Hello, world\n"
	.ascii "My name is Ezekiel Sung\n"
	.ascii "I am the future Flash\n"
	.ascii "I will graduate in 2.5 years from Sacramento State1!\n\0"
.text
.global _start

_start:
	mov $Message, %rcx
	call PrintCString

	call EndProgram

