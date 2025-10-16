.file	"welcome.s"
	.text
message:
	.ascii	"Hello, world\n"
message1:
	.ascii	"Welcome to 221 course\n"

	.global	_start

	.text
_start:
	# write(1, message, 13)		# system call 1 is write
	mov	$1, %rax		# system call 1 is write
	mov	$1, %rdi		# file handle 1 is stdout
	mov	$message, %rsi		# address of string to output
	mov	$13, %rdx		# number of bytes
	syscall				# invoke operating system to do the write

	mov	$1, %rax		# system call 1 is write
	mov	$1, %rdi		# file handle 1 is stdout
	mov	$message1, %rsi		# address of string to output
	mov	$22, %rdx		# number of bytes
	syscall				# invoke operating system to do the write

	# exit(0)
	mov	$60, %rax		# system call 60 is exit
	xor	%rdi, %rdi		# we want return code 0
	syscall				# invoke operating system to exit
