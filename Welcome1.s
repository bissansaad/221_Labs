.file	"welcome.s"
	.text
message:
	.ascii	"Bissan Saad\n"
message1:
	.ascii	"2231172238\n"
message2:
        .ascii  "Jordanien\n"
message3:
        .ascii  "2027-2028\n"

	.global	_start

	.text
_start:
	# write(1, message, 13)		# system call 1 is write
	mov	$1, %rax		# system call 1 is write
	mov	$1, %rdi		# file handle 1 is stdout
	mov	$message, %rsi		# address of string to output
	mov	$12, %rdx		# number of bytes
	syscall				# invoke operating system to do the write

	mov	$1, %rax		# system call 1 is write
	mov	$1, %rdi		# file handle 1 is stdout
	mov	$message1, %rsi		# address of string to output
	mov	$11, %rdx		# number of bytes
	syscall				# invoke operating system to do the write
	
	mov     $1, %rax                # system call 1 is write
        mov     $1, %rdi                # file handle 1 is stdout
        mov     $message2, %rsi         # address of string to output
        mov     $10, %rdx               # number of bytes
        syscall
	
	mov     $1, %rax                # system call 1 is write
        mov     $1, %rdi                # file handle 1 is stdout
        mov     $message3, %rsi         # address of string to output
        mov     $10, %rdx               # number of bytes
        syscall

	# exit(0)
	mov	$60, %rax		# system call 60 is exit
	xor	%rdi, %rdi		# we want return code 0
	syscall				# invoke operating system to exit
