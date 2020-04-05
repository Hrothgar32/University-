	.file	"BoilerPlate_Arbori.c"
	.text
	.globl	fatalError
	.type	fatalError, @function
fatalError:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$10, %edi
	call	putchar@PLT
	movl	$1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE6:
	.size	fatalError, .-fatalError
	.section	.rodata
.LC0:
	.string	"%d \n"
	.text
	.globl	postorder
	.type	postorder, @function
postorder:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L4
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	postorder
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	postorder
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L4:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	postorder, .-postorder
	.globl	search
	.type	search, @function
search:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L6
	movl	$0, %eax
	jmp	.L7
.L6:
	cmpq	$0, -24(%rbp)
	je	.L8
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, -28(%rbp)
	jne	.L8
	movq	-24(%rbp), %rax
	jmp	.L7
.L8:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movl	-28(%rbp), %edx
	movl	%edx, %esi
	movq	%rax, %rdi
	call	search
	movq	%rax, -16(%rbp)
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	movl	-28(%rbp), %edx
	movl	%edx, %esi
	movq	%rax, %rdi
	call	search
	movq	%rax, -8(%rbp)
	cmpq	$0, -16(%rbp)
	je	.L9
	movq	-16(%rbp), %rax
	jmp	.L7
.L9:
	cmpq	$0, -8(%rbp)
	je	.L10
	movq	-8(%rbp), %rax
	jmp	.L7
.L10:
	movl	$0, %eax
.L7:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	search, .-search
	.globl	inorder
	.type	inorder, @function
inorder:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L13
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	inorder
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	inorder
.L13:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	inorder, .-inorder
	.globl	leaf_node
	.type	leaf_node, @function
leaf_node:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L15
	movl	$0, %eax
	jmp	.L16
.L15:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L17
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	jne	.L17
	movl	$1, %eax
	jmp	.L16
.L17:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	leaf_node
	movl	%eax, %ebx
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	leaf_node
	addl	%ebx, %eax
.L16:
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	leaf_node, .-leaf_node
	.globl	noduri_interne
	.type	noduri_interne, @function
noduri_interne:
.LFB11:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -24(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L19
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L20
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	jne	.L20
.L19:
	movl	$0, %eax
	jmp	.L21
.L20:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	noduri_interne
	leal	1(%rax), %ebx
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	noduri_interne
	addl	%ebx, %eax
.L21:
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	noduri_interne, .-noduri_interne
	.globl	maxim
	.type	maxim, @function
maxim:
.LFB12:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jle	.L23
	movl	-4(%rbp), %eax
	jmp	.L24
.L23:
	movl	-8(%rbp), %eax
.L24:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	maxim, .-maxim
	.globl	inaltime
	.type	inaltime, @function
inaltime:
.LFB13:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L26
	movl	$-1, %eax
	jmp	.L27
.L26:
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	inaltime
	movl	%eax, %ebx
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	inaltime
	movl	%ebx, %esi
	movl	%eax, %edi
	call	maxim
	addl	$1, %eax
.L27:
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	inaltime, .-inaltime
	.globl	preorder
	.type	preorder, @function
preorder:
.LFB14:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L30
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	preorder
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	preorder
.L30:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	preorder, .-preorder
	.section	.rodata
	.align 8
.LC1:
	.string	"Valoarea pentru radacina [0 pt null] ="
	.align 8
.LC2:
	.string	"Fiul stang al nodului cu valoarea %d [0 pt null] ="
	.align 8
.LC3:
	.string	"Fiul drept al nodului cu valoarea %d [0 pt null] ="
.LC4:
	.string	"%d"
	.align 8
.LC5:
	.string	"Nu mai avem memorie in createBinTree"
	.text
	.globl	createBinTree
	.type	createBinTree, @function
createBinTree:
.LFB15:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -36(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	cmpl	$0, -36(%rbp)
	jne	.L32
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L33
.L32:
	cmpl	$1, -36(%rbp)
	jne	.L34
	movq	-48(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L33
.L34:
	movq	-48(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L33:
	leaq	-20(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-20(%rbp), %eax
	testl	%eax, %eax
	jne	.L35
	movl	$0, %eax
	jmp	.L38
.L35:
	movl	$24, %edi
	call	malloc@PLT
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L37
	leaq	.LC5(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %edi
	call	exit@PLT
.L37:
	movl	-20(%rbp), %edx
	movq	-16(%rbp), %rax
	movl	%edx, (%rax)
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	createBinTree
	movq	-16(%rbp), %rdx
	movq	%rax, 8(%rdx)
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	movl	$2, %edi
	call	createBinTree
	movq	-16(%rbp), %rdx
	movq	%rax, 16(%rdx)
	movq	-16(%rbp), %rax
.L38:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L39
	call	__stack_chk_fail@PLT
.L39:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	createBinTree, .-createBinTree
	.globl	createBinTreeFromFile
	.type	createBinTreeFromFile, @function
createBinTreeFromFile:
.LFB16:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-20(%rbp), %rdx
	movq	-40(%rbp), %rax
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	movl	-20(%rbp), %eax
	testl	%eax, %eax
	jne	.L41
	movl	$0, %eax
	jmp	.L44
.L41:
	movl	$24, %edi
	call	malloc@PLT
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L43
	leaq	.LC5(%rip), %rdi
	call	fatalError
.L43:
	movl	-20(%rbp), %edx
	movq	-16(%rbp), %rax
	movl	%edx, (%rax)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	createBinTreeFromFile
	movq	-16(%rbp), %rdx
	movq	%rax, 8(%rdx)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	createBinTreeFromFile
	movq	-16(%rbp), %rdx
	movq	%rax, 16(%rdx)
	movq	-16(%rbp), %rax
.L44:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L45
	call	__stack_chk_fail@PLT
.L45:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	createBinTreeFromFile, .-createBinTreeFromFile
	.section	.rodata
.LC6:
	.string	"r"
.LC7:
	.string	"ArboreBinar.txt"
	.align 8
.LC8:
	.string	"Nu se poate deschide fisierul ArboreBinar.txt"
.LC9:
	.string	"\nParcurgere in preordine"
.LC10:
	.string	"Numarul de frunze este %d\n"
.LC11:
	.string	"Noduri interne = %d \n"
.LC12:
	.string	"Inaltimea arborelui = %d \n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB17:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	leaq	.LC6(%rip), %rsi
	leaq	.LC7(%rip), %rdi
	call	fopen@PLT
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L47
	leaq	.LC8(%rip), %rdi
	call	puts@PLT
	movl	$-1, %eax
	jmp	.L48
.L47:
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	createBinTreeFromFile
	movq	%rax, -8(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	leaq	.LC9(%rip), %rdi
	call	puts@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	preorder
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	postorder
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	inorder
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	leaf_node
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC10(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	noduri_interne
	movl	%eax, %esi
	leaq	.LC11(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	inaltime
	movl	%eax, %esi
	leaq	.LC12(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
.L48:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	main, .-main
	.ident	"GCC: (Arch Linux 9.3.0-1) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
