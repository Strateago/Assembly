org 0x7c00
jmp start

data:
	msg db "Hello World", 0

start:
	xor ax, ax
	mov bx, ax
	mov cx, ax
	mov dx, ax
	call video
	mov ah, 0xb
	mov bh, 0
	mov bl, 0
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
	add bl, 1
	cmp bl, 16
	je reinicia_bl
	int 10h
	ret

reinicia_bl:
	mov bl, 1
	int 10h
	ret
	
times 510-($-$$) db 0
dw 0xaa55
