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
		LTRL1 byte 'inside function', 0
		LTRL2 sdword 120
		LTRL3 byte 'inside procedure', 0
		LTRL4 sdword 4
		LTRL5 sdword 1
		LTRL6 byte 'someslkdfjalksjfksdjflkajslfkjsklj', 0
		LTRL7 sdword 5
		LTRL8 sdword 25
		LTRL9 sdword 2
		LTRL10 byte '123', 0
.data
		temp sdword ?
		buffer byte 256 dup(0)
		myNuncstr dword ?
		mainmynumber sdword 0
		maina sdword 0
		mainj dword ?
		mainmyNum sdword 0
		maink sdword 0
		maini sdword 0
		mainu sdword 0
.code

;----------- myNunc ------------
myNunc PROC 
	
; --- save registers ---
push ebx
push edx
; ----------------------
push offset newline
call outstr

mov myNuncstr, offset LTRL1

push myNuncstr
call outstr

; --- restore registers ---
pop edx
pop ebx
; -------------------------
mov eax, LTRL2
ret
myNunc ENDP
;------------------------------


;----------- me ------------
me PROC 
	
; --- save registers ---
push ebx
push edx
; ----------------------
push offset newline
call outstr


push offset LTRL3
call outstr

; --- restore registers ---
pop edx
pop ebx
; -------------------------
ret
me ENDP
;------------------------------


;----------- MAIN ------------
main PROC
push LTRL2

pop ebx
mov mainmynumber, ebx


push mainmynumber
call outnum

push LTRL4
push LTRL5
pop ebx 
pop eax 
mov cl, bl 
shl eax, cl
push eax

pop ebx
mov maina, ebx

push offset newline
call outstr


push maina
call outnum

mov mainj, offset LTRL6
push offset newline
call outstr


push mainj
call outstr

push LTRL7

pop ebx
mov mainmyNum, ebx

push offset newline
call outstr


push mainmyNum
call outnum


call myNunc
push eax

pop ebx
mov maink, ebx

push offset newline
call outstr


push maink
call outnum

push LTRL8

pop ebx
mov maini, ebx

push LTRL7

call myNunc
push eax
push LTRL9
pop ebx
pop eax
cdq
idiv ebx
push eax
pop ebx
pop eax
add eax, ebx
push eax

pop ebx
mov maini, ebx

push offset newline
call outstr


push maini
call outnum


push offset LTRL10
push offset buffer
call atoii
push eax

pop ebx
mov mainu, ebx

push offset newline
call outstr


push mainu
call outnum


call me

push 0
call ExitProcess
main ENDP
end main
