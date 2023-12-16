.586
.model flat, stdcall
includelib libucrt.lib
includelib kernel32.lib
includelib "../Debug/GenLib.lib
ExitProcess PROTO:DWORD 
.stack 4096


 outnum PROTO : DWORD

 outstr PROTO : DWORD

 concat PROTO : DWORD, : DWORD, : DWORD

 lenght PROTO : DWORD, : DWORD

 atoii  PROTO : DWORD,  : DWORD

.const
		newline byte 13, 10, 0
		LTRL1 sdword 4
		LTRL2 sdword 3
		LTRL3 sdword 80
		LTRL4 byte 'true', 0
		LTRL5 sdword 0
		LTRL6 byte 'str', 0
		LTRL7 byte 'a', 0
		LTRL8 byte 'b', 0
		LTRL9 byte 'F', 0
		LTRL10 byte '2', 0
		LTRL11 sdword 10
.data
		temp sdword ?
		buffer byte 256 dup(0)
		mainm sdword 0
		maink sdword 0
		mainstr dword ?
		mainj sdword 0
		mainr sdword 0
.code

;----------- MAIN ------------
main PROC
push LTRL1

pop ebx
mov mainm, ebx

mov edx, LTRL2
cmp edx, LTRL3

jl right1
jmp next1
right1:

push offset LTRL4
call outstr

next1:
push LTRL5

pop ebx
mov maink, ebx


push offset LTRL6
push offset buffer
call lenght
push eax

pop ebx
mov maink, ebx

push offset newline
call outstr


push maink
call outnum

mov mainstr, offset LTRL7

push offset LTRL8
push mainstr
push offset buffer
call concat
mov mainstr, eax
push offset newline
call outstr


push mainstr
call outstr

push LTRL5

pop ebx
mov mainj, ebx


push offset LTRL9
push offset buffer
call atoii
push eax

pop ebx
mov mainj, ebx

push offset newline
call outstr


push mainj
call outnum

push LTRL5

pop ebx
mov mainr, ebx


push offset LTRL10
push offset buffer
call atoii
push eax
push LTRL1
push LTRL11
pop ebx
pop eax
imul eax, ebx
push eax
pop ebx
pop eax
add eax, ebx
push eax

pop ebx
mov mainr, ebx

push offset newline
call outstr


push mainr
call outnum

push 0
call ExitProcess
main ENDP
end main
