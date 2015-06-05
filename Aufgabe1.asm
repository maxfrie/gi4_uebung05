SECTION .data
	a DD 5
	b DD 10
	ergebnis DQ 0

SECTION .text
	GLOBAL main

main:
	PUSH ebp	; Neuen Stackframe erstellen
	MOV ebp, esp

	MOV eax, dword [a] ; Faktoren laden
	MOV ebx, dword [b]
	PUSH edx        ; früheren Inhalt von edx sichern
	IMUL eax, ebx	; edx:eax := eax * edx

	JNC noproblem	; Auf Überlauf prüfen (Carry und Overflow-Flags
	JNO noproblem	; nicht gesetzt) (32-Bit Ergebnis)

	MOV dword [ergebnis+4], edx	; sonst 64-Bit Ergebnis speichern
					; (Little-Endian)

noproblem:
	MOV dword [ergebnis], eax

	POP edx		; edx wiederherstellen

	MOV esp, ebp	; Stack Frame restaurieren
	POP ebp

	MOV ebx, 0
	MOV eax, 1
	INT 0x80
