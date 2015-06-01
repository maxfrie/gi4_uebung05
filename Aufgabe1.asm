SECTION .data
	a DD 1
	b DD 2

SECTION .text
	GLOBAL main

main:
	PUSH ebp
	MOV ebp, esp

	PUSH edx	; früheren Inhalt von edx sichern
	MOV eax, dword [a]
	MOV ebx, dword [b]
	IMUL eax, ebx

	POP edx		; edx wiederherstellen

	MOV esp, ebp
	POP ebp

	MOV ebx, 0
	MOV eax, 1
	INT 0x80
