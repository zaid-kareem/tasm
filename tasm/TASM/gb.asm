s	segment
	assume	cs:s
	errr db ' error', '$ 
	okk db ' okay', '$'
	begin:
	
	mov ax, seg errr
	mov ds, ax	
	
	mov ah, 01h	
	int 21h
	mov bl, al
	int 21h
	mov bh, al
	int 21h
	mov dh, al	
	mov ah,09h
	
	inc bl
	cmp bh, bl
	je next
	jmp error	

	next:
		inc bh	
		cmp bh, dh
		jne error
		jmp ok
				  
	error:	mov dx, offset errr
		int 21h
		jmp endd
		
	ok:	mov dx, offset okk
		int 21h
		jmp endd
	
	endd: 
		mov ah, 4ch	
		int 21h		
		
s	ends
	end begin
