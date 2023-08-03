org 0x7c00
jmp start

data:
	msg db "Salve", 0

start:
	xor ax, ax
	mov bx, ax
	call video
	mov ah, 0xb
	mov bh, 0
	mov bl, 4
	int 10h
	mov si, msg
	call string
	jmp $
	
video:
	mov ah, 0
	mov al, 10h
	int 10h
	ret

string:
	loop:
		lodsb
		cmp al, 0
		je end
		call print
		jmp loop
	end:
		ret
print:
	mov ah, 0xe
	mov bl, 2
	int 10h
	ret
	
times 510-($-$$) db 0
dw 0xaa55
