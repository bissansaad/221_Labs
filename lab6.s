	.file "lab6.s"
	.data
message:
	.ascii "Enter your name?\n"
Name:
	.ascii "             \n"
message1:
	.ascii "Enter your university?\n"
uni:
	.ascii "                   \n"
message2:
	.ascii "Enter your graduation date?\n"
date:
	.ascii "     \n"
	
	.global _start
	.text
_start:
	mov	$1,	%rax
	mov	$1,	%rdi
	mov	$message,	%rsi
	mov	$18,	%rdx
	syscall
	
	mov	$0,	%rax
	mov	$0,	%rdi
	mov	$Name,	%rsi 
	mov	$14,	%rdx
	syscall
	
	# takes from the user the uni name
	mov     $1,     %rax
        mov     $1,     %rdi
        mov     $message1,       %rsi
        mov     $23,    %rdx
        syscall

	mov     $0,     %rax
        mov     $0,     %rdi
        mov     $uni,  	%rsi 
        mov     $20,    %rdx
        syscall
 
	#takes from the user the graduation date
	 mov     $1,     %rax
        mov     $1,     %rdi
        mov     $message2,       %rsi
        mov     $28,    %rdx
        syscall

        mov     $0,     %rax
        mov     $0,     %rdi
        mov     $date,   %rsi
        mov     $6,    %rdx
        syscall

	#writes the output
	mov     $1,     %rax
        mov     $1,     %rdi
        mov     $Name,  %rsi
        mov     $14,    %rdx
        syscall

	mov     $1,     %rax
        mov     $1,     %rdi
        mov     $uni,  %rsi
        mov     $20,    %rdx
        syscall

	mov     $1,     %rax
        mov     $1,     %rdi
        mov     $date,  %rsi
        mov     $6,    %rdx
        syscall

	mov	$60,	%rax
	xor	%rdi,	%rdi
	syscall

