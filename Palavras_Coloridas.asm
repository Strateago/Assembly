org 0x7c00
jmp start

data:
	msg db "Infra de Software Sla", 0
start:
	xor ax, ax
	mov bx, ax
	call video
	mov ah, 0xb
	mov bh, 0
	mov bl, 0
	int 10h
	mov bl, 1
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
		cmp al, ' '
		je aumenta_bl
		jmp print
	end:
		ret
print:
	mov ah, 0xe
	int 10h
	jmp loop

reinicia_bl:
	mov bl, 1
	jmp print

aumenta_bl:
	add bl, 1
	cmp bl, 16
	je reinicia_bl
	jmp print

times 510-($-$$) db 0
dw 0xaa55
