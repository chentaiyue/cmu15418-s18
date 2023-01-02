	.file	"sim.c"
	.text
.Ltext0:
	.p2align 4
	.type	simulate._omp_fn.0, @function
simulate._omp_fn.0:
.LVL0:
.LFB60:
	.file 1 "sim.c"
	.loc 1 147 13 view -0
	.cfi_startproc
	.loc 1 147 13 is_stmt 0 view .LVU1
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	(%rdi), %r13
.LVL1:
	.loc 1 147 13 view .LVU2
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	call	omp_get_num_threads@PLT
.LVL2:
	.loc 1 147 13 view .LVU3
	movl	%eax, %ebp
	call	omp_get_thread_num@PLT
.LVL3:
	movl	%eax, %ebx
.LBB12:
	.loc 1 147 13 view .LVU4
	movl	24(%r13), %eax
	addl	$1, %eax
	cltd
	idivl	%ebp
	cmpl	%edx, %ebx
	jl	.L2
.L5:
	imull	%eax, %ebx
	addl	%edx, %ebx
	leal	(%rax,%rbx), %r12d
	cmpl	%r12d, %ebx
	jge	.L1
	movslq	%ebx, %rbp
	salq	$3, %rbp
	.p2align 4,,10
	.p2align 3
.L4:
.LVL4:
	.loc 1 150 9 is_stmt 1 discriminator 1 view .LVU5
	.loc 1 150 16 is_stmt 0 discriminator 1 view .LVU6
	movq	0(%r13), %r14
	.loc 1 150 30 discriminator 1 view .LVU7
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%ebx, %xmm0
	addl	$1, %ebx
.LVL5:
	.loc 1 150 22 discriminator 1 view .LVU8
	divsd	72(%r13), %xmm0
	call	mweight@PLT
.LVL6:
	.loc 1 150 16 discriminator 1 view .LVU9
	addq	%rbp, %r14
	addq	$8, %rbp
	.loc 1 150 20 discriminator 1 view .LVU10
	movsd	%xmm0, (%r14)
	cmpl	%ebx, %r12d
	jne	.L4
.LVL7:
.L1:
	.loc 1 150 20 discriminator 1 view .LVU11
.LBE12:
	.loc 1 147 13 view .LVU12
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
.LVL8:
	.loc 1 147 13 view .LVU13
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.LVL9:
	.p2align 4,,10
	.p2align 3
.L2:
	.cfi_restore_state
	.loc 1 147 13 view .LVU14
	addl	$1, %eax
.LBB13:
	.loc 1 147 13 discriminator 1 view .LVU15
	xorl	%edx, %edx
	jmp	.L5
.LBE13:
	.cfi_endproc
.LFE60:
	.size	simulate._omp_fn.0, .-simulate._omp_fn.0
	.p2align 4
	.type	process_batch._omp_fn.0, @function
process_batch._omp_fn.0:
.LVL10:
.LFB61:
	.loc 1 92 13 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 92 13 is_stmt 0 view .LVU17
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	.loc 1 92 13 view .LVU18
	movl	12(%rdi), %eax
	movq	(%rdi), %rbx
	movl	8(%rdi), %r13d
	movl	%eax, 8(%rsp)
.LVL11:
.LBB24:
	.loc 1 96 30 view .LVU19
	movq	16(%rbx), %r15
	call	omp_get_num_threads@PLT
.LVL12:
	.loc 1 96 30 view .LVU20
	movl	%eax, %r12d
	call	omp_get_thread_num@PLT
.LVL13:
	movl	%eax, %ebp
	movl	(%r15), %eax
	cltd
	idivl	%r12d
	cmpl	%edx, %ebp
	jl	.L10
.L24:
	movl	%eax, %ecx
	imull	%ebp, %ecx
	addl	%edx, %ecx
	addl	%ecx, %eax
	cmpl	%eax, %ecx
	jge	.L11
.LBB25:
.LBB26:
	.loc 1 77 18 view .LVU21
	movq	8(%rbx), %r14
	.loc 1 79 22 view .LVU22
	movq	16(%r15), %r8
	movslq	%ecx, %rcx
	pxor	%xmm1, %xmm1
	.loc 1 81 10 view .LVU23
	movq	8(%r15), %r11
	.p2align 4,,10
	.p2align 3
.L14:
.LVL14:
	.loc 1 81 10 view .LVU24
.LBE26:
.LBE25:
	.loc 1 97 13 is_stmt 1 discriminator 1 view .LVU25
.LBB30:
.LBI25:
	.loc 1 76 20 discriminator 1 view .LVU26
.LBB29:
	.loc 1 77 5 discriminator 1 view .LVU27
	.loc 1 77 13 is_stmt 0 discriminator 1 view .LVU28
	movq	(%r14,%rcx,8), %rsi
.LVL15:
	.loc 1 78 5 is_stmt 1 discriminator 1 view .LVU29
	.loc 1 79 5 discriminator 1 view .LVU30
	.loc 1 79 9 is_stmt 0 discriminator 1 view .LVU31
	movslq	(%r8,%rcx,4), %rdx
.LVL16:
	.loc 1 79 45 discriminator 1 view .LVU32
	movl	4(%r8,%rcx,4), %edi
.LVL17:
	.loc 1 80 5 is_stmt 1 discriminator 1 view .LVU33
	.loc 1 81 5 discriminator 1 view .LVU34
	.loc 1 82 5 discriminator 1 view .LVU35
	.loc 1 82 10 is_stmt 0 discriminator 1 view .LVU36
	movq	$0x000000000, (%rsi)
	.loc 1 83 5 is_stmt 1 discriminator 1 view .LVU37
.LVL18:
	.loc 1 84 5 discriminator 1 view .LVU38
	.loc 1 84 27 discriminator 1 view .LVU39
	.loc 1 84 5 is_stmt 0 discriminator 1 view .LVU40
	cmpl	%edi, %edx
	jge	.L12
	movq	%rdx, %r15
	.loc 1 85 16 view .LVU41
	movq	(%rbx), %r10
	movq	64(%rbx), %r9
	movapd	%xmm1, %xmm0
	negq	%r15
	leaq	(%rsi,%r15,8), %r15
.LVL19:
	.p2align 4,,10
	.p2align 3
.L13:
	.loc 1 85 9 is_stmt 1 view .LVU42
.LBB27:
.LBI27:
	.loc 1 4 22 view .LVU43
.LBB28:
	.loc 1 5 5 view .LVU44
	.loc 1 6 5 view .LVU45
	.loc 1 5 29 is_stmt 0 view .LVU46
	movslq	(%r11,%rdx,4), %rsi
	.loc 1 6 19 view .LVU47
	movslq	(%r9,%rsi,4), %rsi
.LBE28:
.LBE27:
	.loc 1 85 50 view .LVU48
	addsd	(%r10,%rsi,8), %xmm0
	.loc 1 85 14 view .LVU49
	movsd	%xmm0, 8(%r15,%rdx,8)
	.loc 1 84 42 is_stmt 1 view .LVU50
.LVL20:
	.loc 1 84 27 view .LVU51
	addq	$1, %rdx
.LVL21:
	.loc 1 84 5 is_stmt 0 view .LVU52
	cmpl	%edx, %edi
	jg	.L13
.LVL22:
.L12:
	.loc 1 84 5 view .LVU53
	addq	$1, %rcx
.LVL23:
	.loc 1 84 5 view .LVU54
	cmpl	%ecx, %eax
	jg	.L14
.L11:
	.loc 1 84 5 view .LVU55
	call	GOMP_barrier@PLT
.LVL24:
	movl	8(%rsp), %eax
	cltd
	idivl	%r12d
	cmpl	%edx, %ebp
	jl	.L15
.L23:
	imull	%eax, %ebp
	addl	%edx, %ebp
	addl	%ebp, %eax
	cmpl	%eax, %ebp
	jge	.L9
	addl	%r13d, %eax
	addl	%r13d, %ebp
.LVL25:
	.loc 1 84 5 view .LVU56
	movl	%eax, 12(%rsp)
	movslq	%ebp, %r12
	salq	$2, %r12
.LVL26:
	.p2align 4,,10
	.p2align 3
.L22:
	.loc 1 84 5 view .LVU57
.LBE29:
.LBE30:
.LBE24:
.LBB31:
	.loc 1 103 13 is_stmt 1 discriminator 3 view .LVU58
.LBB32:
.LBB33:
	.loc 1 55 9 is_stmt 0 discriminator 3 view .LVU59
	movq	40(%rbx), %rax
	.loc 1 58 13 discriminator 3 view .LVU60
	movq	8(%rbx), %rdx
	.loc 1 59 14 discriminator 3 view .LVU61
	movq	16(%rbx), %r15
	.loc 1 57 15 discriminator 3 view .LVU62
	movq	56(%rbx), %rdi
	.loc 1 58 25 discriminator 3 view .LVU63
	movslq	(%rax,%r12), %rax
.LBE33:
.LBE32:
	.loc 1 103 33 discriminator 3 view .LVU64
	movq	48(%rbx), %r13
.LBB41:
.LBB38:
	.loc 1 57 15 discriminator 3 view .LVU65
	addq	%r12, %rdi
	.loc 1 58 13 discriminator 3 view .LVU66
	movq	(%rdx,%rax,8), %rsi
	.loc 1 60 22 discriminator 3 view .LVU67
	movq	16(%r15), %rdx
.LBE38:
.LBE41:
	.loc 1 103 33 discriminator 3 view .LVU68
	addq	%r12, %r13
.LVL27:
.LBB42:
.LBI32:
	.loc 1 54 19 is_stmt 1 discriminator 3 view .LVU69
.LBB39:
	.loc 1 55 5 discriminator 3 view .LVU70
	.loc 1 56 5 discriminator 3 view .LVU71
	.loc 1 57 5 discriminator 3 view .LVU72
	.loc 1 58 5 discriminator 3 view .LVU73
	.loc 1 59 5 discriminator 3 view .LVU74
	.loc 1 60 5 discriminator 3 view .LVU75
	.loc 1 60 9 is_stmt 0 discriminator 3 view .LVU76
	movl	(%rdx,%rax,4), %r14d
.LVL28:
	.loc 1 60 45 discriminator 3 view .LVU77
	movl	4(%rdx,%rax,4), %eax
.LVL29:
	.loc 1 61 5 is_stmt 1 discriminator 3 view .LVU78
.LBB34:
.LBI34:
	.loc 1 10 22 discriminator 3 view .LVU79
.LBB35:
	.loc 1 11 5 discriminator 3 view .LVU80
	.loc 1 11 5 is_stmt 0 discriminator 3 view .LVU81
.LBE35:
.LBE34:
	.loc 1 62 5 is_stmt 1 discriminator 3 view .LVU82
	.loc 1 62 18 is_stmt 0 discriminator 3 view .LVU83
	movq	%rsi, (%rsp)
.LBB37:
.LBB36:
	.loc 1 11 22 discriminator 3 view .LVU84
	movl	%eax, %edx
	movl	%eax, 8(%rsp)
	subl	%r14d, %edx
.LVL30:
	.loc 1 11 22 discriminator 3 view .LVU85
	movslq	%edx, %rdx
	.loc 1 11 22 discriminator 3 view .LVU86
.LBE36:
.LBE37:
	.loc 1 62 18 discriminator 3 view .LVU87
	movsd	(%rsi,%rdx,8), %xmm0
	call	next_random_float@PLT
.LVL31:
	.loc 1 63 5 is_stmt 1 discriminator 3 view .LVU88
	.loc 1 63 24 is_stmt 0 discriminator 3 view .LVU89
	movl	8(%rsp), %eax
	.loc 1 64 11 discriminator 3 view .LVU90
	movl	%r14d, %r8d
	.loc 1 63 24 discriminator 3 view .LVU91
	subl	$1, %eax
.LVL32:
	.loc 1 64 5 is_stmt 1 discriminator 3 view .LVU92
	.loc 1 64 11 discriminator 3 view .LVU93
	cmpl	%eax, %r14d
	jg	.L17
	.loc 1 64 11 is_stmt 0 view .LVU94
	movq	(%rsp), %rsi
.LVL33:
	.p2align 4,,10
	.p2align 3
.L21:
	.loc 1 65 9 is_stmt 1 view .LVU95
	.loc 1 65 18 is_stmt 0 view .LVU96
	leal	(%rax,%r8), %edi
	.loc 1 65 13 view .LVU97
	movl	%edi, %edx
	shrl	$31, %edx
	addl	%edi, %edx
	sarl	%edx
.LVL34:
	.loc 1 66 9 is_stmt 1 view .LVU98
	.loc 1 66 26 is_stmt 0 view .LVU99
	movl	%edx, %edi
	subl	%r14d, %edi
	.loc 1 66 21 view .LVU100
	movslq	%edi, %rdi
	.loc 1 66 12 view .LVU101
	movsd	8(%rsi,%rdi,8), %xmm1
	comisd	%xmm0, %xmm1
	jb	.L30
	.loc 1 67 13 is_stmt 1 view .LVU102
	.loc 1 67 15 is_stmt 0 view .LVU103
	leal	-1(%rdx), %eax
.LVL35:
	.loc 1 64 11 is_stmt 1 view .LVU104
	cmpl	%eax, %r8d
	jle	.L21
.LVL36:
.L17:
	.loc 1 72 5 view .LVU105
	.loc 1 72 10 is_stmt 0 view .LVU106
	movq	8(%r15), %rdx
	.loc 1 72 23 view .LVU107
	movslq	%r8d, %rax
.LVL37:
	.loc 1 72 23 view .LVU108
	addl	$1, %ebp
.LVL38:
	.loc 1 72 23 view .LVU109
	addq	$4, %r12
	.loc 1 72 10 view .LVU110
	movl	(%rdx,%rax,4), %eax
.LVL39:
	.loc 1 73 5 is_stmt 1 view .LVU111
	.loc 1 73 5 is_stmt 0 view .LVU112
.LBE39:
.LBE42:
	.loc 1 103 39 view .LVU113
	movl	%eax, 0(%r13)
	cmpl	%ebp, 12(%rsp)
	jg	.L22
.LVL40:
.L9:
	.loc 1 103 39 view .LVU114
.LBE31:
	.loc 1 92 13 view .LVU115
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
.LVL41:
	.loc 1 92 13 view .LVU116
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.LVL42:
	.p2align 4,,10
	.p2align 3
.L30:
	.cfi_restore_state
.LBB44:
.LBB43:
.LBB40:
	.loc 1 69 13 is_stmt 1 view .LVU117
	.loc 1 69 15 is_stmt 0 view .LVU118
	leal	1(%rdx), %r8d
.LVL43:
	.loc 1 64 11 is_stmt 1 view .LVU119
	cmpl	%r8d, %eax
	jge	.L21
	jmp	.L17
.LVL44:
	.p2align 4,,10
	.p2align 3
.L10:
	.loc 1 64 11 is_stmt 0 view .LVU120
	addl	$1, %eax
.LBE40:
.LBE43:
.LBE44:
.LBB45:
	.loc 1 96 33 view .LVU121
	xorl	%edx, %edx
	jmp	.L24
	.p2align 4,,10
	.p2align 3
.L15:
	addl	$1, %eax
	xorl	%edx, %edx
	jmp	.L23
.LBE45:
	.cfi_endproc
.LFE61:
	.size	process_batch._omp_fn.0, .-process_batch._omp_fn.0
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"WARNING: Unknown update mode.  Using batch mode\n"
	.text
	.p2align 4
	.globl	simulate
	.type	simulate, @function
simulate:
.LVL45:
.LFB59:
	.loc 1 125 89 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 125 89 is_stmt 0 view .LVU123
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rdi, %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%edx, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%r8d, %ebx
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
.LBB58:
.LBB59:
	.loc 1 40 9 view .LVU124
	movl	24(%rdi), %r13d
	.loc 1 38 10 view .LVU125
	movq	40(%rdi), %rbp
.LBE59:
.LBE58:
	.loc 1 125 89 view .LVU126
	movl	%esi, 20(%rsp)
.LBB71:
.LBB68:
.LBB60:
.LBB61:
	.file 2 "/usr/include/x86_64-linux-gnu/bits/string_fortified.h"
	.loc 2 71 10 view .LVU127
	xorl	%esi, %esi
.LVL46:
	.loc 2 71 10 view .LVU128
.LBE61:
.LBE60:
.LBE68:
.LBE71:
	.loc 1 125 89 view .LVU129
	movl	%ecx, 28(%rsp)
.LBB72:
.LBB69:
	.loc 1 39 10 view .LVU130
	movq	64(%rdi), %rcx
.LVL47:
	.loc 1 39 10 view .LVU131
.LBE69:
.LBE72:
	.loc 1 125 89 view .LVU132
	movb	%r8b, 27(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	.loc 1 126 5 is_stmt 1 view .LVU133
	.loc 1 128 5 view .LVU134
.LVL48:
	.loc 1 129 5 view .LVU135
.LBB73:
.LBI58:
	.loc 1 35 20 view .LVU136
.LBB70:
	.loc 1 36 5 view .LVU137
	.loc 1 37 5 view .LVU138
	.loc 1 38 5 view .LVU139
	.loc 1 39 5 view .LVU140
	.loc 1 40 5 view .LVU141
	.loc 1 42 5 view .LVU142
.LBB65:
.LBI60:
	.loc 2 59 1 view .LVU143
.LBB62:
	.loc 2 71 3 view .LVU144
.LBE62:
.LBE65:
	.loc 1 37 9 is_stmt 0 view .LVU145
	movq	16(%rdi), %rax
.LBB66:
.LBB63:
	.loc 2 71 10 view .LVU146
	movq	%rcx, %rdi
.LVL49:
	.loc 2 71 10 view .LVU147
.LBE63:
.LBE66:
	.loc 1 42 5 view .LVU148
	movslq	(%rax), %rdx
.LVL50:
	.loc 1 42 5 view .LVU149
	salq	$2, %rdx
.LBB67:
.LBB64:
	.loc 2 71 10 view .LVU150
	call	memset@PLT
.LVL51:
	.loc 2 71 10 view .LVU151
.LBE64:
.LBE67:
	.loc 1 43 5 is_stmt 1 view .LVU152
	.loc 1 44 5 view .LVU153
	.loc 1 44 18 view .LVU154
	.loc 1 44 5 is_stmt 0 view .LVU155
	testl	%r13d, %r13d
	jle	.L39
	leal	-1(%r13), %edx
	movq	%rax, %rcx
	movq	%rbp, %rax
	leaq	4(%rbp,%rdx,4), %rsi
.LVL52:
	.p2align 4,,10
	.p2align 3
.L38:
	.loc 1 45 2 is_stmt 1 view .LVU156
	.loc 1 45 24 is_stmt 0 view .LVU157
	movslq	(%rax), %rdx
	addq	$4, %rax
	.loc 1 45 30 view .LVU158
	addl	$1, (%rcx,%rdx,4)
	.loc 1 44 29 is_stmt 1 view .LVU159
	.loc 1 44 18 view .LVU160
	.loc 1 44 5 is_stmt 0 view .LVU161
	cmpq	%rax, %rsi
	jne	.L38
.L39:
.LVL53:
	.loc 1 44 5 view .LVU162
.LBE70:
.LBE73:
	.loc 1 130 5 is_stmt 1 view .LVU163
	.loc 1 131 5 view .LVU164
	cmpl	$1, %r12d
	je	.L67
	movl	$1, %r13d
	cmpl	$2, %r12d
	je	.L35
	testl	%r12d, %r12d
	je	.L68
	.loc 1 142 2 view .LVU165
	leaq	.LC1(%rip), %rdi
	xorl	%eax, %eax
	call	outmsg@PLT
.LVL54:
.L67:
	.loc 1 143 2 view .LVU166
	.loc 1 143 13 is_stmt 0 view .LVU167
	movl	80(%r15), %r13d
.LVL55:
	.loc 1 144 2 is_stmt 1 view .LVU168
.L35:
	.loc 1 144 2 is_stmt 0 view .LVU169
	leaq	32(%rsp), %rbp
	.loc 1 147 43 view .LVU170
	movl	28(%r15), %edx
	xorl	%ecx, %ecx
.LBB74:
	.loc 1 147 13 view .LVU171
	movq	%r15, 32(%rsp)
	movq	%rbp, %rsi
	leaq	simulate._omp_fn.0(%rip), %rdi
	call	GOMP_parallel@PLT
.LVL56:
.LBE74:
	.loc 1 153 5 is_stmt 1 view .LVU172
	.loc 1 153 8 is_stmt 0 view .LVU173
	testb	%bl, %bl
	jne	.L69
.L40:
.LVL57:
	.loc 1 155 17 is_stmt 1 discriminator 1 view .LVU174
	.loc 1 155 5 is_stmt 0 discriminator 1 view .LVU175
	movl	20(%rsp), %eax
	testl	%eax, %eax
	jle	.L49
	.loc 1 155 5 view .LVU176
	movl	$0, 16(%rsp)
	movl	%r13d, %r14d
.LVL58:
	.p2align 4,,10
	.p2align 3
.L48:
.LBB75:
.LBB76:
	.loc 1 119 17 is_stmt 1 view .LVU177
	.loc 1 119 22 is_stmt 0 view .LVU178
	movl	24(%r15), %eax
	movslq	%r14d, %rsi
	.loc 1 119 5 view .LVU179
	xorl	%r12d, %r12d
	.loc 1 119 12 view .LVU180
	xorl	%r13d, %r13d
	movq	%rsi, 8(%rsp)
	.loc 1 119 5 view .LVU181
	testl	%eax, %eax
	jle	.L43
.LVL59:
	.p2align 4,,10
	.p2align 3
.L42:
.LBB77:
	.loc 1 120 2 is_stmt 1 view .LVU182
	.loc 1 121 2 view .LVU183
	.loc 1 120 6 is_stmt 0 view .LVU184
	subl	%r13d, %eax
.LVL60:
.LBB78:
.LBB79:
	.loc 1 92 39 view .LVU185
	movl	28(%r15), %edx
	movq	%rbp, %rsi
.LBB80:
	.loc 1 92 13 view .LVU186
	movl	%r13d, 40(%rsp)
.LBE80:
.LBE79:
.LBE78:
	.loc 1 121 9 view .LVU187
	cmpl	%r14d, %eax
	leaq	process_batch._omp_fn.0(%rip), %rdi
.LBB86:
.LBB84:
.LBB81:
	.loc 1 92 13 view .LVU188
	movq	%r15, 32(%rsp)
.LBE81:
.LBE84:
.LBE86:
	.loc 1 121 9 view .LVU189
	cmovg	%r14d, %eax
.LVL61:
	.loc 1 121 9 view .LVU190
	xorl	%ecx, %ecx
	movl	%eax, %ebx
.LVL62:
	.loc 1 122 2 is_stmt 1 view .LVU191
.LBB87:
.LBI78:
	.loc 1 89 13 view .LVU192
.LBB85:
	.loc 1 90 5 view .LVU193
.LBB82:
	.loc 1 92 13 is_stmt 0 view .LVU194
	movl	%eax, 44(%rsp)
	call	GOMP_parallel@PLT
.LVL63:
	.loc 1 92 13 view .LVU195
.LBE82:
	.loc 1 108 5 is_stmt 1 view .LVU196
	.loc 1 108 24 view .LVU197
	.loc 1 108 36 is_stmt 0 view .LVU198
	leal	(%rbx,%r13), %eax
	.loc 1 108 5 view .LVU199
	cmpl	%r13d, %eax
	jle	.L45
.LBB83:
	.loc 1 109 21 view .LVU200
	movq	40(%r15), %r9
	.loc 1 110 21 view .LVU201
	movq	48(%r15), %r10
	.loc 1 111 10 view .LVU202
	movq	%r12, %rdx
	movq	64(%r15), %rcx
.LVL64:
	.p2align 4,,10
	.p2align 3
.L44:
	.loc 1 109 9 is_stmt 1 view .LVU203
	.loc 1 110 9 view .LVU204
	.loc 1 110 13 is_stmt 0 view .LVU205
	movl	(%r10,%rdx,4), %esi
.LVL65:
	.loc 1 111 9 is_stmt 1 view .LVU206
	.loc 1 111 21 is_stmt 0 view .LVU207
	movslq	(%r9,%rdx,4), %rdi
	.loc 1 111 27 view .LVU208
	subl	$1, (%rcx,%rdi,4)
.LVL66:
	.loc 1 112 9 is_stmt 1 view .LVU209
	.loc 1 112 21 is_stmt 0 view .LVU210
	movslq	%esi, %rdi
	.loc 1 112 27 view .LVU211
	addl	$1, (%rcx,%rdi,4)
	.loc 1 113 9 is_stmt 1 view .LVU212
	.loc 1 113 30 is_stmt 0 view .LVU213
	movl	%esi, (%r9,%rdx,4)
.LBE83:
	.loc 1 108 45 is_stmt 1 view .LVU214
.LVL67:
	.loc 1 108 24 view .LVU215
	addq	$1, %rdx
.LVL68:
	.loc 1 108 5 is_stmt 0 view .LVU216
	cmpl	%edx, %eax
	jg	.L44
.LVL69:
.L45:
	.loc 1 108 5 view .LVU217
.LBE85:
.LBE87:
.LBE77:
	.loc 1 119 30 is_stmt 1 view .LVU218
	.loc 1 119 22 is_stmt 0 view .LVU219
	movl	24(%r15), %eax
	.loc 1 119 32 view .LVU220
	addl	%r14d, %r13d
.LVL70:
	.loc 1 119 17 is_stmt 1 view .LVU221
	addq	8(%rsp), %r12
	.loc 1 119 5 is_stmt 0 view .LVU222
	cmpl	%r13d, %eax
	jg	.L42
.LVL71:
.L43:
	.loc 1 119 5 view .LVU223
.LBE76:
.LBE75:
	.loc 1 157 2 is_stmt 1 view .LVU224
	movl	16(%rsp), %edi
	.loc 1 157 5 is_stmt 0 view .LVU225
	cmpb	$0, 27(%rsp)
	leal	1(%rdi), %ebx
	je	.L46
	.loc 1 158 6 is_stmt 1 view .LVU226
	.loc 1 158 28 is_stmt 0 view .LVU227
	movl	%ebx, %eax
	.loc 1 158 47 view .LVU228
	movl	$1, %esi
	.loc 1 158 28 view .LVU229
	cltd
	idivl	28(%rsp)
	.loc 1 158 47 view .LVU230
	testl	%edx, %edx
	je	.L47
	.loc 1 158 61 discriminator 2 view .LVU231
	movl	20(%rsp), %eax
	.loc 1 158 47 discriminator 2 view .LVU232
	xorl	%esi, %esi
	.loc 1 158 61 discriminator 2 view .LVU233
	subl	$1, %eax
	.loc 1 158 47 discriminator 2 view .LVU234
	cmpl	%edi, %eax
	sete	%sil
.L47:
.LVL72:
	.loc 1 159 6 is_stmt 1 discriminator 6 view .LVU235
	movq	%r15, %rdi
	call	show@PLT
.LVL73:
.L46:
	.loc 1 155 28 discriminator 2 view .LVU236
	.loc 1 155 17 discriminator 2 view .LVU237
	.loc 1 155 5 is_stmt 0 discriminator 2 view .LVU238
	cmpl	%ebx, 20(%rsp)
	je	.L49
.LVL74:
	.loc 1 155 5 discriminator 2 view .LVU239
	movl	%ebx, 16(%rsp)
	jmp	.L48
.LVL75:
	.p2align 4,,10
	.p2align 3
.L49:
	.loc 1 162 5 is_stmt 1 view .LVU240
	xorl	%eax, %eax
	call	done@PLT
.LVL76:
	.loc 1 163 1 is_stmt 0 view .LVU241
	movq	56(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L70
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
.LVL77:
	.loc 1 163 1 view .LVU242
	ret
.LVL78:
.L69:
	.cfi_restore_state
	.loc 1 154 2 is_stmt 1 view .LVU243
	movl	$1, %esi
	movq	%r15, %rdi
	call	show@PLT
.LVL79:
	jmp	.L40
.LVL80:
.L68:
	.loc 1 133 2 view .LVU244
	.loc 1 133 13 is_stmt 0 view .LVU245
	movl	24(%r15), %r13d
.LVL81:
	.loc 1 134 2 is_stmt 1 view .LVU246
	jmp	.L35
.LVL82:
.L70:
	.loc 1 163 1 is_stmt 0 view .LVU247
	call	__stack_chk_fail@PLT
.LVL83:
	.cfi_endproc
.LFE59:
	.size	simulate, .-simulate
.Letext0:
	.file 3 "/usr/lib/gcc/x86_64-linux-gnu/9/include/stddef.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h"
	.file 6 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.file 7 "/usr/include/stdio.h"
	.file 8 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h"
	.file 9 "/usr/include/math.h"
	.file 10 "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h"
	.file 11 "rutil.h"
	.file 12 "crun.h"
	.file 13 "<built-in>"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xe94
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF121
	.byte	0xc
	.long	.LASF122
	.long	.LASF123
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF6
	.byte	0x3
	.byte	0xd1
	.byte	0x17
	.long	0x39
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF1
	.uleb128 0x4
	.byte	0x8
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF2
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF3
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.long	.LASF7
	.byte	0x4
	.byte	0x2a
	.byte	0x16
	.long	0x40
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF8
	.uleb128 0x2
	.long	.LASF9
	.byte	0x4
	.byte	0x98
	.byte	0x19
	.long	0x78
	.uleb128 0x2
	.long	.LASF10
	.byte	0x4
	.byte	0x99
	.byte	0x1b
	.long	0x78
	.uleb128 0x6
	.byte	0x8
	.long	0x9d
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF11
	.uleb128 0x7
	.long	0x9d
	.uleb128 0x8
	.long	.LASF124
	.byte	0xd8
	.byte	0x5
	.byte	0x31
	.byte	0x8
	.long	0x230
	.uleb128 0x9
	.long	.LASF12
	.byte	0x5
	.byte	0x33
	.byte	0x7
	.long	0x65
	.byte	0
	.uleb128 0x9
	.long	.LASF13
	.byte	0x5
	.byte	0x36
	.byte	0x9
	.long	0x97
	.byte	0x8
	.uleb128 0x9
	.long	.LASF14
	.byte	0x5
	.byte	0x37
	.byte	0x9
	.long	0x97
	.byte	0x10
	.uleb128 0x9
	.long	.LASF15
	.byte	0x5
	.byte	0x38
	.byte	0x9
	.long	0x97
	.byte	0x18
	.uleb128 0x9
	.long	.LASF16
	.byte	0x5
	.byte	0x39
	.byte	0x9
	.long	0x97
	.byte	0x20
	.uleb128 0x9
	.long	.LASF17
	.byte	0x5
	.byte	0x3a
	.byte	0x9
	.long	0x97
	.byte	0x28
	.uleb128 0x9
	.long	.LASF18
	.byte	0x5
	.byte	0x3b
	.byte	0x9
	.long	0x97
	.byte	0x30
	.uleb128 0x9
	.long	.LASF19
	.byte	0x5
	.byte	0x3c
	.byte	0x9
	.long	0x97
	.byte	0x38
	.uleb128 0x9
	.long	.LASF20
	.byte	0x5
	.byte	0x3d
	.byte	0x9
	.long	0x97
	.byte	0x40
	.uleb128 0x9
	.long	.LASF21
	.byte	0x5
	.byte	0x40
	.byte	0x9
	.long	0x97
	.byte	0x48
	.uleb128 0x9
	.long	.LASF22
	.byte	0x5
	.byte	0x41
	.byte	0x9
	.long	0x97
	.byte	0x50
	.uleb128 0x9
	.long	.LASF23
	.byte	0x5
	.byte	0x42
	.byte	0x9
	.long	0x97
	.byte	0x58
	.uleb128 0x9
	.long	.LASF24
	.byte	0x5
	.byte	0x44
	.byte	0x16
	.long	0x249
	.byte	0x60
	.uleb128 0x9
	.long	.LASF25
	.byte	0x5
	.byte	0x46
	.byte	0x14
	.long	0x24f
	.byte	0x68
	.uleb128 0x9
	.long	.LASF26
	.byte	0x5
	.byte	0x48
	.byte	0x7
	.long	0x65
	.byte	0x70
	.uleb128 0x9
	.long	.LASF27
	.byte	0x5
	.byte	0x49
	.byte	0x7
	.long	0x65
	.byte	0x74
	.uleb128 0x9
	.long	.LASF28
	.byte	0x5
	.byte	0x4a
	.byte	0xb
	.long	0x7f
	.byte	0x78
	.uleb128 0x9
	.long	.LASF29
	.byte	0x5
	.byte	0x4d
	.byte	0x12
	.long	0x50
	.byte	0x80
	.uleb128 0x9
	.long	.LASF30
	.byte	0x5
	.byte	0x4e
	.byte	0xf
	.long	0x57
	.byte	0x82
	.uleb128 0x9
	.long	.LASF31
	.byte	0x5
	.byte	0x4f
	.byte	0x8
	.long	0x255
	.byte	0x83
	.uleb128 0x9
	.long	.LASF32
	.byte	0x5
	.byte	0x51
	.byte	0xf
	.long	0x265
	.byte	0x88
	.uleb128 0x9
	.long	.LASF33
	.byte	0x5
	.byte	0x59
	.byte	0xd
	.long	0x8b
	.byte	0x90
	.uleb128 0x9
	.long	.LASF34
	.byte	0x5
	.byte	0x5b
	.byte	0x17
	.long	0x270
	.byte	0x98
	.uleb128 0x9
	.long	.LASF35
	.byte	0x5
	.byte	0x5c
	.byte	0x19
	.long	0x27b
	.byte	0xa0
	.uleb128 0x9
	.long	.LASF36
	.byte	0x5
	.byte	0x5d
	.byte	0x14
	.long	0x24f
	.byte	0xa8
	.uleb128 0x9
	.long	.LASF37
	.byte	0x5
	.byte	0x5e
	.byte	0x9
	.long	0x47
	.byte	0xb0
	.uleb128 0x9
	.long	.LASF38
	.byte	0x5
	.byte	0x5f
	.byte	0xa
	.long	0x2d
	.byte	0xb8
	.uleb128 0x9
	.long	.LASF39
	.byte	0x5
	.byte	0x60
	.byte	0x7
	.long	0x65
	.byte	0xc0
	.uleb128 0x9
	.long	.LASF40
	.byte	0x5
	.byte	0x62
	.byte	0x8
	.long	0x281
	.byte	0xc4
	.byte	0
	.uleb128 0x2
	.long	.LASF41
	.byte	0x6
	.byte	0x7
	.byte	0x19
	.long	0xa9
	.uleb128 0xa
	.long	.LASF125
	.byte	0x5
	.byte	0x2b
	.byte	0xe
	.uleb128 0xb
	.long	.LASF42
	.uleb128 0x6
	.byte	0x8
	.long	0x244
	.uleb128 0x6
	.byte	0x8
	.long	0xa9
	.uleb128 0xc
	.long	0x9d
	.long	0x265
	.uleb128 0xd
	.long	0x39
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x23c
	.uleb128 0xb
	.long	.LASF43
	.uleb128 0x6
	.byte	0x8
	.long	0x26b
	.uleb128 0xb
	.long	.LASF44
	.uleb128 0x6
	.byte	0x8
	.long	0x276
	.uleb128 0xc
	.long	0x9d
	.long	0x291
	.uleb128 0xd
	.long	0x39
	.byte	0x13
	.byte	0
	.uleb128 0xe
	.long	.LASF45
	.byte	0x7
	.byte	0x89
	.byte	0xe
	.long	0x29d
	.uleb128 0x6
	.byte	0x8
	.long	0x230
	.uleb128 0xe
	.long	.LASF46
	.byte	0x7
	.byte	0x8a
	.byte	0xe
	.long	0x29d
	.uleb128 0xe
	.long	.LASF47
	.byte	0x7
	.byte	0x8b
	.byte	0xe
	.long	0x29d
	.uleb128 0xe
	.long	.LASF48
	.byte	0x8
	.byte	0x1a
	.byte	0xc
	.long	0x65
	.uleb128 0xc
	.long	0x2dd
	.long	0x2d2
	.uleb128 0xf
	.byte	0
	.uleb128 0x7
	.long	0x2c7
	.uleb128 0x6
	.byte	0x8
	.long	0xa4
	.uleb128 0x7
	.long	0x2d7
	.uleb128 0xe
	.long	.LASF49
	.byte	0x8
	.byte	0x1b
	.byte	0x1a
	.long	0x2d2
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF50
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF51
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.long	.LASF52
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.long	.LASF53
	.uleb128 0x10
	.long	.LASF54
	.byte	0x9
	.value	0x305
	.byte	0xc
	.long	0x65
	.uleb128 0x2
	.long	.LASF55
	.byte	0xa
	.byte	0x1a
	.byte	0x14
	.long	0x6c
	.uleb128 0x2
	.long	.LASF56
	.byte	0xb
	.byte	0xf
	.byte	0x12
	.long	0x317
	.uleb128 0x11
	.byte	0x7
	.byte	0x4
	.long	0x40
	.byte	0xc
	.byte	0x32
	.byte	0xe
	.long	0x350
	.uleb128 0x12
	.long	.LASF57
	.byte	0
	.uleb128 0x12
	.long	.LASF58
	.byte	0x1
	.uleb128 0x12
	.long	.LASF59
	.byte	0x2
	.byte	0
	.uleb128 0x2
	.long	.LASF60
	.byte	0xc
	.byte	0x32
	.byte	0x3f
	.long	0x32f
	.uleb128 0x13
	.byte	0x18
	.byte	0xc
	.byte	0x41
	.byte	0x9
	.long	0x39a
	.uleb128 0x9
	.long	.LASF61
	.byte	0xc
	.byte	0x43
	.byte	0x9
	.long	0x65
	.byte	0
	.uleb128 0x9
	.long	.LASF62
	.byte	0xc
	.byte	0x44
	.byte	0x9
	.long	0x65
	.byte	0x4
	.uleb128 0x9
	.long	.LASF63
	.byte	0xc
	.byte	0x48
	.byte	0xa
	.long	0x39a
	.byte	0x8
	.uleb128 0x9
	.long	.LASF64
	.byte	0xc
	.byte	0x4a
	.byte	0xa
	.long	0x39a
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x65
	.uleb128 0x2
	.long	.LASF65
	.byte	0xc
	.byte	0x4c
	.byte	0x3
	.long	0x35c
	.uleb128 0x13
	.byte	0x58
	.byte	0xc
	.byte	0x4f
	.byte	0x9
	.long	0x450
	.uleb128 0x9
	.long	.LASF66
	.byte	0xc
	.byte	0x50
	.byte	0xb
	.long	0x450
	.byte	0
	.uleb128 0x9
	.long	.LASF67
	.byte	0xc
	.byte	0x51
	.byte	0xc
	.long	0x456
	.byte	0x8
	.uleb128 0x14
	.string	"g"
	.byte	0xc
	.byte	0x52
	.byte	0xe
	.long	0x45c
	.byte	0x10
	.uleb128 0x9
	.long	.LASF68
	.byte	0xc
	.byte	0x54
	.byte	0x9
	.long	0x65
	.byte	0x18
	.uleb128 0x9
	.long	.LASF69
	.byte	0xc
	.byte	0x56
	.byte	0x9
	.long	0x65
	.byte	0x1c
	.uleb128 0x9
	.long	.LASF70
	.byte	0xc
	.byte	0x59
	.byte	0xe
	.long	0x323
	.byte	0x20
	.uleb128 0x9
	.long	.LASF71
	.byte	0xc
	.byte	0x5d
	.byte	0xa
	.long	0x39a
	.byte	0x28
	.uleb128 0x9
	.long	.LASF72
	.byte	0xc
	.byte	0x5f
	.byte	0xa
	.long	0x39a
	.byte	0x30
	.uleb128 0x9
	.long	.LASF73
	.byte	0xc
	.byte	0x61
	.byte	0xf
	.long	0x462
	.byte	0x38
	.uleb128 0x9
	.long	.LASF74
	.byte	0xc
	.byte	0x65
	.byte	0xa
	.long	0x39a
	.byte	0x40
	.uleb128 0x9
	.long	.LASF75
	.byte	0xc
	.byte	0x67
	.byte	0xc
	.long	0x303
	.byte	0x48
	.uleb128 0x9
	.long	.LASF76
	.byte	0xc
	.byte	0x68
	.byte	0x9
	.long	0x65
	.byte	0x50
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x303
	.uleb128 0x6
	.byte	0x8
	.long	0x450
	.uleb128 0x6
	.byte	0x8
	.long	0x3a0
	.uleb128 0x6
	.byte	0x8
	.long	0x323
	.uleb128 0x2
	.long	.LASF77
	.byte	0xc
	.byte	0x6a
	.byte	0x3
	.long	0x3ac
	.uleb128 0x15
	.long	.LASF90
	.byte	0x1
	.byte	0x59
	.byte	0xd
	.byte	0x1
	.long	0x7a1
	.uleb128 0x16
	.string	"s"
	.byte	0x1
	.byte	0x59
	.byte	0x24
	.long	0x7a1
	.uleb128 0x17
	.long	.LASF78
	.byte	0x1
	.byte	0x59
	.byte	0x2b
	.long	0x65
	.uleb128 0x17
	.long	.LASF79
	.byte	0x1
	.byte	0x59
	.byte	0x37
	.long	0x65
	.uleb128 0x18
	.long	.LASF86
	.quad	.LFB61
	.quad	.LFE61-.LFB61
	.uleb128 0x1
	.byte	0x9c
	.long	0x77a
	.uleb128 0x19
	.long	0x7d9
	.long	.LLST3
	.long	.LVUS3
	.uleb128 0x1a
	.string	"s"
	.byte	0x1
	.byte	0x59
	.byte	0x24
	.long	0x7a1
	.long	.LLST4
	.long	.LVUS4
	.uleb128 0x1b
	.long	.LASF78
	.byte	0x1
	.byte	0x59
	.byte	0x2b
	.long	0x65
	.long	.LLST5
	.long	.LVUS5
	.uleb128 0x1b
	.long	.LASF79
	.byte	0x1
	.byte	0x59
	.byte	0x37
	.long	0x65
	.long	.LLST6
	.long	.LVUS6
	.uleb128 0x1c
	.long	.Ldebug_ranges0+0
	.long	0x5fa
	.uleb128 0x1a
	.string	"rid"
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.long	0x65
	.long	.LLST7
	.long	.LVUS7
	.uleb128 0x1d
	.long	0xbea
	.quad	.LBI25
	.byte	.LVU26
	.long	.Ldebug_ranges0+0x30
	.byte	0x1
	.byte	0x61
	.byte	0xd
	.uleb128 0x1e
	.long	0xc01
	.long	.LLST8
	.long	.LVUS8
	.uleb128 0x1e
	.long	0xbf7
	.long	.LLST9
	.long	.LVUS9
	.uleb128 0x1f
	.long	.Ldebug_ranges0+0x30
	.uleb128 0x20
	.long	0xc0d
	.long	.LLST10
	.long	.LVUS10
	.uleb128 0x21
	.long	0xc17
	.uleb128 0x20
	.long	0xc21
	.long	.LLST11
	.long	.LVUS11
	.uleb128 0x20
	.long	0xc2d
	.long	.LLST12
	.long	.LVUS12
	.uleb128 0x20
	.long	0xc39
	.long	.LLST13
	.long	.LVUS13
	.uleb128 0x21
	.long	0xc45
	.uleb128 0x20
	.long	0xc51
	.long	.LLST14
	.long	.LVUS14
	.uleb128 0x22
	.long	0xdb1
	.quad	.LBI27
	.byte	.LVU43
	.quad	.LBB27
	.quad	.LBE27-.LBB27
	.byte	0x1
	.byte	0x55
	.byte	0x10
	.uleb128 0x1e
	.long	0xdc2
	.long	.LLST15
	.long	.LVUS15
	.uleb128 0x1e
	.long	0xdc2
	.long	.LLST15
	.long	.LVUS15
	.uleb128 0x1e
	.long	0xdcc
	.long	.LLST17
	.long	.LVUS17
	.uleb128 0x20
	.long	0xdd8
	.long	.LLST18
	.long	.LVUS18
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1c
	.long	.Ldebug_ranges0+0x60
	.long	0x752
	.uleb128 0x1a
	.string	"rid"
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.long	0x65
	.long	.LLST19
	.long	.LVUS19
	.uleb128 0x1d
	.long	0xc5c
	.quad	.LBI32
	.byte	.LVU69
	.long	.Ldebug_ranges0+0x90
	.byte	0x1
	.byte	0x67
	.byte	0x29
	.uleb128 0x1e
	.long	0xc77
	.long	.LLST20
	.long	.LVUS20
	.uleb128 0x1e
	.long	0xc6d
	.long	.LLST21
	.long	.LVUS21
	.uleb128 0x1f
	.long	.Ldebug_ranges0+0x90
	.uleb128 0x20
	.long	0xc81
	.long	.LLST22
	.long	.LVUS22
	.uleb128 0x20
	.long	0xc8d
	.long	.LLST23
	.long	.LVUS23
	.uleb128 0x20
	.long	0xc99
	.long	.LLST24
	.long	.LVUS24
	.uleb128 0x20
	.long	0xca5
	.long	.LLST25
	.long	.LVUS25
	.uleb128 0x20
	.long	0xcaf
	.long	.LLST26
	.long	.LVUS26
	.uleb128 0x20
	.long	0xcb9
	.long	.LLST27
	.long	.LVUS27
	.uleb128 0x20
	.long	0xcc5
	.long	.LLST28
	.long	.LVUS28
	.uleb128 0x20
	.long	0xcd1
	.long	.LLST29
	.long	.LVUS29
	.uleb128 0x20
	.long	0xcdd
	.long	.LLST30
	.long	.LVUS30
	.uleb128 0x20
	.long	0xce9
	.long	.LLST31
	.long	.LVUS31
	.uleb128 0x20
	.long	0xcf3
	.long	.LLST32
	.long	.LVUS32
	.uleb128 0x20
	.long	0xcfd
	.long	.LLST33
	.long	.LVUS33
	.uleb128 0x23
	.long	0xd67
	.quad	.LBI34
	.byte	.LVU79
	.long	.Ldebug_ranges0+0xe0
	.byte	0x1
	.byte	0x3d
	.byte	0x13
	.long	0x742
	.uleb128 0x1e
	.long	0xd78
	.long	.LLST34
	.long	.LVUS34
	.uleb128 0x1e
	.long	0xd82
	.long	.LLST35
	.long	.LVUS35
	.uleb128 0x1e
	.long	0xda6
	.long	.LLST36
	.long	.LVUS36
	.uleb128 0x1e
	.long	0xd9a
	.long	.LLST37
	.long	.LVUS37
	.uleb128 0x1e
	.long	0xd8e
	.long	.LLST38
	.long	.LVUS38
	.byte	0
	.uleb128 0x24
	.quad	.LVL31
	.long	0xe1b
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x24
	.quad	.LVL12
	.long	0xe27
	.uleb128 0x24
	.quad	.LVL13
	.long	0xe32
	.uleb128 0x24
	.quad	.LVL24
	.long	0xe3d
	.byte	0
	.uleb128 0x25
	.string	"rid"
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.long	0x65
	.uleb128 0x26
	.uleb128 0x27
	.long	.LASF80
	.byte	0x1
	.byte	0x6d
	.byte	0xd
	.long	0x65
	.uleb128 0x27
	.long	.LASF81
	.byte	0x1
	.byte	0x6e
	.byte	0xd
	.long	0x65
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x468
	.uleb128 0x28
	.byte	0x10
	.long	0x7d3
	.uleb128 0x14
	.string	"s"
	.byte	0x1
	.byte	0x59
	.byte	0x24
	.long	0x7a1
	.byte	0
	.uleb128 0x9
	.long	.LASF78
	.byte	0x1
	.byte	0x59
	.byte	0x2b
	.long	0x65
	.byte	0x8
	.uleb128 0x9
	.long	.LASF79
	.byte	0x1
	.byte	0x59
	.byte	0x37
	.long	0x65
	.byte	0xc
	.byte	0
	.uleb128 0x29
	.byte	0x8
	.long	0x7a7
	.uleb128 0x2a
	.long	0x7d3
	.uleb128 0x2b
	.long	.LASF126
	.byte	0x1
	.byte	0x7d
	.byte	0x6
	.quad	.LFB59
	.quad	.LFE59-.LFB59
	.uleb128 0x1
	.byte	0x9c
	.long	0xb7e
	.uleb128 0x2c
	.string	"s"
	.byte	0x1
	.byte	0x7d
	.byte	0x18
	.long	0x7a1
	.long	.LLST39
	.long	.LVUS39
	.uleb128 0x2d
	.long	.LASF82
	.byte	0x1
	.byte	0x7d
	.byte	0x1f
	.long	0x65
	.long	.LLST40
	.long	.LVUS40
	.uleb128 0x2d
	.long	.LASF83
	.byte	0x1
	.byte	0x7d
	.byte	0x2f
	.long	0x350
	.long	.LLST41
	.long	.LVUS41
	.uleb128 0x2d
	.long	.LASF84
	.byte	0x1
	.byte	0x7d
	.byte	0x40
	.long	0x65
	.long	.LLST42
	.long	.LVUS42
	.uleb128 0x2d
	.long	.LASF85
	.byte	0x1
	.byte	0x7d
	.byte	0x50
	.long	0xb7e
	.long	.LLST43
	.long	.LVUS43
	.uleb128 0x18
	.long	.LASF87
	.quad	.LFB60
	.quad	.LFE60-.LFB60
	.uleb128 0x1
	.byte	0x9c
	.long	0x8d2
	.uleb128 0x19
	.long	0xb9d
	.long	.LLST0
	.long	.LVUS0
	.uleb128 0x1a
	.string	"s"
	.byte	0x1
	.byte	0x7d
	.byte	0x18
	.long	0x7a1
	.long	.LLST1
	.long	.LVUS1
	.uleb128 0x1a
	.string	"i"
	.byte	0x1
	.byte	0x7e
	.byte	0x9
	.long	0x65
	.long	.LLST2
	.long	.LVUS2
	.uleb128 0x24
	.quad	.LVL2
	.long	0xe27
	.uleb128 0x24
	.quad	.LVL3
	.long	0xe32
	.uleb128 0x24
	.quad	.LVL6
	.long	0xe48
	.byte	0
	.uleb128 0x1a
	.string	"i"
	.byte	0x1
	.byte	0x7e
	.byte	0x9
	.long	0x65
	.long	.LLST44
	.long	.LVUS44
	.uleb128 0x1b
	.long	.LASF88
	.byte	0x1
	.byte	0x80
	.byte	0xa
	.long	0xb7e
	.long	.LLST45
	.long	.LVUS45
	.uleb128 0x1b
	.long	.LASF76
	.byte	0x1
	.byte	0x82
	.byte	0x9
	.long	0x65
	.long	.LLST46
	.long	.LVUS46
	.uleb128 0x23
	.long	0xd0a
	.quad	.LBI58
	.byte	.LVU136
	.long	.Ldebug_ranges0+0x110
	.byte	0x1
	.byte	0x81
	.byte	0x5
	.long	0x9d7
	.uleb128 0x1e
	.long	0xd17
	.long	.LLST47
	.long	.LVUS47
	.uleb128 0x1f
	.long	.Ldebug_ranges0+0x110
	.uleb128 0x20
	.long	0xd21
	.long	.LLST48
	.long	.LVUS48
	.uleb128 0x20
	.long	0xd2b
	.long	.LLST49
	.long	.LVUS49
	.uleb128 0x20
	.long	0xd37
	.long	.LLST50
	.long	.LVUS50
	.uleb128 0x20
	.long	0xd43
	.long	.LLST51
	.long	.LVUS51
	.uleb128 0x20
	.long	0xd4f
	.long	.LLST52
	.long	.LVUS52
	.uleb128 0x20
	.long	0xd5b
	.long	.LLST53
	.long	.LVUS53
	.uleb128 0x1d
	.long	0xde5
	.quad	.LBI60
	.byte	.LVU143
	.long	.Ldebug_ranges0+0x160
	.byte	0x1
	.byte	0x2a
	.byte	0x5
	.uleb128 0x1e
	.long	0xe0e
	.long	.LLST54
	.long	.LVUS54
	.uleb128 0x1e
	.long	0xe02
	.long	.LLST55
	.long	.LVUS55
	.uleb128 0x1e
	.long	0xdf6
	.long	.LLST56
	.long	.LVUS56
	.uleb128 0x2e
	.quad	.LVL51
	.long	0xe54
	.uleb128 0x2f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x30
	.long	0xba2
	.quad	.LBB75
	.quad	.LBE75-.LBB75
	.byte	0x1
	.byte	0x9c
	.byte	0x2
	.long	0xabb
	.uleb128 0x31
	.long	0xbb9
	.uleb128 0x31
	.long	0xbaf
	.uleb128 0x20
	.long	0xbc5
	.long	.LLST57
	.long	.LVUS57
	.uleb128 0x20
	.long	0xbcf
	.long	.LLST58
	.long	.LVUS58
	.uleb128 0x32
	.long	0xbdb
	.quad	.LBB77
	.quad	.LBE77-.LBB77
	.uleb128 0x20
	.long	0xbdc
	.long	.LLST59
	.long	.LVUS59
	.uleb128 0x1d
	.long	0x474
	.quad	.LBI78
	.byte	.LVU192
	.long	.Ldebug_ranges0+0x1b0
	.byte	0x1
	.byte	0x7a
	.byte	0x2
	.uleb128 0x1e
	.long	0x497
	.long	.LLST60
	.long	.LVUS60
	.uleb128 0x1e
	.long	0x48b
	.long	.LLST61
	.long	.LVUS61
	.uleb128 0x1e
	.long	0x481
	.long	.LLST62
	.long	.LVUS62
	.uleb128 0x1f
	.long	.Ldebug_ranges0+0x1b0
	.uleb128 0x20
	.long	0x77a
	.long	.LLST63
	.long	.LVUS63
	.uleb128 0x32
	.long	0x786
	.quad	.LBB83
	.quad	.LBE83-.LBB83
	.uleb128 0x20
	.long	0x787
	.long	.LLST64
	.long	.LVUS64
	.uleb128 0x20
	.long	0x793
	.long	.LLST65
	.long	.LVUS65
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x33
	.quad	.LVL54
	.long	0xe5f
	.long	0xada
	.uleb128 0x2f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC1
	.byte	0
	.uleb128 0x33
	.quad	.LVL56
	.long	0xe6b
	.long	0xb04
	.uleb128 0x2f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	simulate._omp_fn.0
	.uleb128 0x2f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2f
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x33
	.quad	.LVL63
	.long	0xe6b
	.long	0xb2e
	.uleb128 0x2f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	process_batch._omp_fn.0
	.uleb128 0x2f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2f
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x33
	.quad	.LVL73
	.long	0xe76
	.long	0xb46
	.uleb128 0x2f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7f
	.sleb128 0
	.byte	0
	.uleb128 0x24
	.quad	.LVL76
	.long	0xe82
	.uleb128 0x33
	.quad	.LVL79
	.long	0xe76
	.long	0xb70
	.uleb128 0x2f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7f
	.sleb128 0
	.uleb128 0x2f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x24
	.quad	.LVL83
	.long	0xe8e
	.byte	0
	.uleb128 0x3
	.byte	0x1
	.byte	0x2
	.long	.LASF89
	.uleb128 0x28
	.byte	0x8
	.long	0xb97
	.uleb128 0x14
	.string	"s"
	.byte	0x1
	.byte	0x7d
	.byte	0x18
	.long	0x7a1
	.byte	0
	.byte	0
	.uleb128 0x29
	.byte	0x8
	.long	0xb85
	.uleb128 0x2a
	.long	0xb97
	.uleb128 0x15
	.long	.LASF91
	.byte	0x1
	.byte	0x75
	.byte	0xd
	.byte	0x1
	.long	0xbea
	.uleb128 0x16
	.string	"s"
	.byte	0x1
	.byte	0x75
	.byte	0x1f
	.long	0x7a1
	.uleb128 0x17
	.long	.LASF76
	.byte	0x1
	.byte	0x75
	.byte	0x26
	.long	0x65
	.uleb128 0x25
	.string	"b"
	.byte	0x1
	.byte	0x76
	.byte	0x9
	.long	0x65
	.uleb128 0x27
	.long	.LASF79
	.byte	0x1
	.byte	0x76
	.byte	0xc
	.long	0x65
	.uleb128 0x26
	.uleb128 0x27
	.long	.LASF92
	.byte	0x1
	.byte	0x78
	.byte	0x6
	.long	0x65
	.byte	0
	.byte	0
	.uleb128 0x15
	.long	.LASF93
	.byte	0x1
	.byte	0x4c
	.byte	0x14
	.byte	0x3
	.long	0xc5c
	.uleb128 0x16
	.string	"s"
	.byte	0x1
	.byte	0x4c
	.byte	0x25
	.long	0x7a1
	.uleb128 0x16
	.string	"nid"
	.byte	0x1
	.byte	0x4c
	.byte	0x2c
	.long	0x65
	.uleb128 0x25
	.string	"t"
	.byte	0x1
	.byte	0x4d
	.byte	0xd
	.long	0x450
	.uleb128 0x25
	.string	"g"
	.byte	0x1
	.byte	0x4e
	.byte	0xe
	.long	0x45c
	.uleb128 0x27
	.long	.LASF94
	.byte	0x1
	.byte	0x4f
	.byte	0x9
	.long	0x65
	.uleb128 0x27
	.long	.LASF95
	.byte	0x1
	.byte	0x4f
	.byte	0x2d
	.long	0x65
	.uleb128 0x25
	.string	"eid"
	.byte	0x1
	.byte	0x50
	.byte	0x9
	.long	0x65
	.uleb128 0x27
	.long	.LASF96
	.byte	0x1
	.byte	0x51
	.byte	0xa
	.long	0x39a
	.uleb128 0x25
	.string	"i"
	.byte	0x1
	.byte	0x53
	.byte	0x9
	.long	0x65
	.byte	0
	.uleb128 0x34
	.long	.LASF97
	.byte	0x1
	.byte	0x36
	.byte	0x13
	.long	0x65
	.byte	0x3
	.long	0xd0a
	.uleb128 0x16
	.string	"s"
	.byte	0x1
	.byte	0x36
	.byte	0x2d
	.long	0x7a1
	.uleb128 0x16
	.string	"r"
	.byte	0x1
	.byte	0x36
	.byte	0x34
	.long	0x65
	.uleb128 0x25
	.string	"nid"
	.byte	0x1
	.byte	0x37
	.byte	0x9
	.long	0x65
	.uleb128 0x27
	.long	.LASF81
	.byte	0x1
	.byte	0x38
	.byte	0x9
	.long	0x65
	.uleb128 0x27
	.long	.LASF98
	.byte	0x1
	.byte	0x39
	.byte	0xf
	.long	0x462
	.uleb128 0x25
	.string	"t"
	.byte	0x1
	.byte	0x3a
	.byte	0xd
	.long	0x450
	.uleb128 0x25
	.string	"g"
	.byte	0x1
	.byte	0x3b
	.byte	0xe
	.long	0x45c
	.uleb128 0x27
	.long	.LASF94
	.byte	0x1
	.byte	0x3c
	.byte	0x9
	.long	0x65
	.uleb128 0x27
	.long	.LASF95
	.byte	0x1
	.byte	0x3c
	.byte	0x2d
	.long	0x65
	.uleb128 0x27
	.long	.LASF99
	.byte	0x1
	.byte	0x3d
	.byte	0xc
	.long	0x303
	.uleb128 0x25
	.string	"val"
	.byte	0x1
	.byte	0x3e
	.byte	0xc
	.long	0x303
	.uleb128 0x25
	.string	"a"
	.byte	0x1
	.byte	0x3f
	.byte	0x9
	.long	0x65
	.uleb128 0x25
	.string	"b"
	.byte	0x1
	.byte	0x3f
	.byte	0x18
	.long	0x65
	.uleb128 0x25
	.string	"mid"
	.byte	0x1
	.byte	0x3f
	.byte	0x29
	.long	0x65
	.byte	0
	.uleb128 0x15
	.long	.LASF100
	.byte	0x1
	.byte	0x23
	.byte	0x14
	.byte	0x3
	.long	0xd67
	.uleb128 0x16
	.string	"s"
	.byte	0x1
	.byte	0x23
	.byte	0x29
	.long	0x7a1
	.uleb128 0x25
	.string	"g"
	.byte	0x1
	.byte	0x24
	.byte	0xe
	.long	0x45c
	.uleb128 0x27
	.long	.LASF61
	.byte	0x1
	.byte	0x25
	.byte	0x9
	.long	0x65
	.uleb128 0x27
	.long	.LASF71
	.byte	0x1
	.byte	0x26
	.byte	0xa
	.long	0x39a
	.uleb128 0x27
	.long	.LASF74
	.byte	0x1
	.byte	0x27
	.byte	0xa
	.long	0x39a
	.uleb128 0x27
	.long	.LASF68
	.byte	0x1
	.byte	0x28
	.byte	0x9
	.long	0x65
	.uleb128 0x25
	.string	"ri"
	.byte	0x1
	.byte	0x2b
	.byte	0x9
	.long	0x65
	.byte	0
	.uleb128 0x34
	.long	.LASF101
	.byte	0x1
	.byte	0xa
	.byte	0x16
	.long	0x303
	.byte	0x3
	.long	0xdb1
	.uleb128 0x16
	.string	"s"
	.byte	0x1
	.byte	0xa
	.byte	0x32
	.long	0x7a1
	.uleb128 0x16
	.string	"nid"
	.byte	0x1
	.byte	0xa
	.byte	0x39
	.long	0x65
	.uleb128 0x17
	.long	.LASF94
	.byte	0x1
	.byte	0xa
	.byte	0x42
	.long	0x65
	.uleb128 0x17
	.long	.LASF95
	.byte	0x1
	.byte	0xa
	.byte	0x51
	.long	0x65
	.uleb128 0x16
	.string	"t"
	.byte	0x1
	.byte	0xa
	.byte	0x62
	.long	0x450
	.byte	0
	.uleb128 0x34
	.long	.LASF102
	.byte	0x1
	.byte	0x4
	.byte	0x16
	.long	0x303
	.byte	0x3
	.long	0xde5
	.uleb128 0x16
	.string	"s"
	.byte	0x1
	.byte	0x4
	.byte	0x2e
	.long	0x7a1
	.uleb128 0x16
	.string	"nid"
	.byte	0x1
	.byte	0x4
	.byte	0x35
	.long	0x65
	.uleb128 0x27
	.long	.LASF82
	.byte	0x1
	.byte	0x5
	.byte	0x9
	.long	0x65
	.byte	0
	.uleb128 0x35
	.long	.LASF114
	.byte	0x2
	.byte	0x3b
	.byte	0x1
	.long	0x47
	.byte	0x3
	.long	0xe1b
	.uleb128 0x17
	.long	.LASF103
	.byte	0x2
	.byte	0x3b
	.byte	0x1
	.long	0x47
	.uleb128 0x17
	.long	.LASF104
	.byte	0x2
	.byte	0x3b
	.byte	0x1
	.long	0x65
	.uleb128 0x17
	.long	.LASF105
	.byte	0x2
	.byte	0x3b
	.byte	0x1
	.long	0x2d
	.byte	0
	.uleb128 0x36
	.long	.LASF112
	.long	.LASF112
	.byte	0xb
	.byte	0x19
	.byte	0x8
	.uleb128 0x37
	.long	.LASF106
	.long	.LASF108
	.byte	0xd
	.byte	0
	.uleb128 0x37
	.long	.LASF107
	.long	.LASF109
	.byte	0xd
	.byte	0
	.uleb128 0x37
	.long	.LASF110
	.long	.LASF111
	.byte	0xd
	.byte	0
	.uleb128 0x36
	.long	.LASF113
	.long	.LASF113
	.byte	0xb
	.byte	0x1c
	.byte	0x8
	.uleb128 0x37
	.long	.LASF114
	.long	.LASF115
	.byte	0xd
	.byte	0
	.uleb128 0x36
	.long	.LASF116
	.long	.LASF116
	.byte	0xc
	.byte	0x7b
	.byte	0x6
	.uleb128 0x37
	.long	.LASF117
	.long	.LASF118
	.byte	0xd
	.byte	0
	.uleb128 0x36
	.long	.LASF119
	.long	.LASF119
	.byte	0xc
	.byte	0x8b
	.byte	0x6
	.uleb128 0x36
	.long	.LASF120
	.long	.LASF120
	.byte	0xc
	.byte	0x87
	.byte	0x6
	.uleb128 0x38
	.long	.LASF127
	.long	.LASF127
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x2138
	.uleb128 0xb
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x57
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x2138
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x57
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x2138
	.uleb128 0xb
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x57
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0xb
	.byte	0x1
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x10
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2e
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2f
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x30
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x57
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x31
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x32
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x33
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x34
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x35
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x36
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x37
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x38
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LVUS3:
	.uleb128 0
	.uleb128 .LVU20
	.uleb128 .LVU20
	.uleb128 0
.LLST3:
	.quad	.LVL10-.Ltext0
	.quad	.LVL12-1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL12-1-.Ltext0
	.quad	.LFE61-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS4:
	.uleb128 .LVU19
	.uleb128 .LVU116
	.uleb128 .LVU117
	.uleb128 0
.LLST4:
	.quad	.LVL11-.Ltext0
	.quad	.LVL41-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL42-.Ltext0
	.quad	.LFE61-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LVUS5:
	.uleb128 .LVU19
	.uleb128 .LVU57
	.uleb128 .LVU120
	.uleb128 0
.LLST5:
	.quad	.LVL11-.Ltext0
	.quad	.LVL26-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL44-.Ltext0
	.quad	.LFE61-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LVUS6:
	.uleb128 .LVU19
	.uleb128 .LVU20
	.uleb128 .LVU20
	.uleb128 .LVU57
	.uleb128 .LVU120
	.uleb128 0
.LLST6:
	.quad	.LVL11-.Ltext0
	.quad	.LVL12-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL12-1-.Ltext0
	.quad	.LVL26-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -72
	.quad	.LVL44-.Ltext0
	.quad	.LFE61-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -72
	.quad	0
	.quad	0
.LVUS7:
	.uleb128 .LVU24
	.uleb128 .LVU53
	.uleb128 .LVU53
	.uleb128 .LVU54
.LLST7:
	.quad	.LVL14-.Ltext0
	.quad	.LVL22-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL22-.Ltext0
	.quad	.LVL23-.Ltext0
	.value	0x3
	.byte	0x72
	.sleb128 1
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS8:
	.uleb128 .LVU26
	.uleb128 .LVU53
.LLST8:
	.quad	.LVL14-.Ltext0
	.quad	.LVL22-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	0
	.quad	0
.LVUS9:
	.uleb128 .LVU26
	.uleb128 .LVU53
.LLST9:
	.quad	.LVL14-.Ltext0
	.quad	.LVL22-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LVUS10:
	.uleb128 .LVU29
	.uleb128 .LVU42
	.uleb128 .LVU42
	.uleb128 .LVU53
.LLST10:
	.quad	.LVL15-.Ltext0
	.quad	.LVL19-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL19-.Ltext0
	.quad	.LVL22-.Ltext0
	.value	0x7
	.byte	0x72
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x7e
	.sleb128 0
	.byte	0x22
	.quad	0
	.quad	0
.LVUS11:
	.uleb128 .LVU32
	.uleb128 .LVU53
.LLST11:
	.quad	.LVL16-.Ltext0
	.quad	.LVL22-.Ltext0
	.value	0x7
	.byte	0x72
	.sleb128 0
	.byte	0x32
	.byte	0x24
	.byte	0x78
	.sleb128 0
	.byte	0x22
	.quad	0
	.quad	0
.LVUS12:
	.uleb128 .LVU33
	.uleb128 .LVU53
.LLST12:
	.quad	.LVL17-.Ltext0
	.quad	.LVL22-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0
	.quad	0
.LVUS13:
	.uleb128 .LVU39
	.uleb128 .LVU42
	.uleb128 .LVU42
	.uleb128 .LVU51
	.uleb128 .LVU51
	.uleb128 .LVU52
.LLST13:
	.quad	.LVL18-.Ltext0
	.quad	.LVL19-.Ltext0
	.value	0x7
	.byte	0x72
	.sleb128 0
	.byte	0x32
	.byte	0x24
	.byte	0x78
	.sleb128 0
	.byte	0x22
	.quad	.LVL19-.Ltext0
	.quad	.LVL20-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL20-.Ltext0
	.quad	.LVL21-.Ltext0
	.value	0x3
	.byte	0x71
	.sleb128 1
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS14:
	.uleb128 .LVU38
	.uleb128 .LVU42
	.uleb128 .LVU42
	.uleb128 .LVU51
	.uleb128 .LVU51
	.uleb128 .LVU52
.LLST14:
	.quad	.LVL18-.Ltext0
	.quad	.LVL19-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL19-.Ltext0
	.quad	.LVL20-.Ltext0
	.value	0xf
	.byte	0x71
	.sleb128 0
	.byte	0x72
	.sleb128 0
	.byte	0x32
	.byte	0x24
	.byte	0x78
	.sleb128 0
	.byte	0x22
	.byte	0x94
	.byte	0x4
	.byte	0x1c
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.quad	.LVL20-.Ltext0
	.quad	.LVL21-.Ltext0
	.value	0xf
	.byte	0x71
	.sleb128 0
	.byte	0x72
	.sleb128 0
	.byte	0x32
	.byte	0x24
	.byte	0x78
	.sleb128 0
	.byte	0x22
	.byte	0x94
	.byte	0x4
	.byte	0x1c
	.byte	0x23
	.uleb128 0x2
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS15:
	.uleb128 .LVU44
	.uleb128 .LVU53
.LLST15:
	.quad	.LVL19-.Ltext0
	.quad	.LVL22-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LVUS17:
	.uleb128 .LVU43
	.uleb128 .LVU46
.LLST17:
	.quad	.LVL19-.Ltext0
	.quad	.LVL19-.Ltext0
	.value	0x7
	.byte	0x71
	.sleb128 0
	.byte	0x32
	.byte	0x24
	.byte	0x7b
	.sleb128 0
	.byte	0x22
	.quad	0
	.quad	0
.LVUS18:
	.uleb128 .LVU45
	.uleb128 .LVU46
.LLST18:
	.quad	.LVL19-.Ltext0
	.quad	.LVL19-.Ltext0
	.value	0x14
	.byte	0x71
	.sleb128 0
	.byte	0x32
	.byte	0x24
	.byte	0x7b
	.sleb128 0
	.byte	0x22
	.byte	0x94
	.byte	0x4
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x32
	.byte	0x24
	.byte	0x79
	.sleb128 0
	.byte	0x22
	.quad	0
	.quad	0
.LVUS19:
	.uleb128 .LVU56
	.uleb128 .LVU109
	.uleb128 .LVU109
	.uleb128 .LVU112
	.uleb128 .LVU112
	.uleb128 .LVU114
	.uleb128 .LVU117
	.uleb128 .LVU120
.LLST19:
	.quad	.LVL25-.Ltext0
	.quad	.LVL38-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL38-.Ltext0
	.quad	.LVL39-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL39-.Ltext0
	.quad	.LVL40-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL42-.Ltext0
	.quad	.LVL44-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LVUS20:
	.uleb128 .LVU69
	.uleb128 .LVU109
	.uleb128 .LVU109
	.uleb128 .LVU112
	.uleb128 .LVU117
	.uleb128 .LVU120
.LLST20:
	.quad	.LVL27-.Ltext0
	.quad	.LVL38-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL38-.Ltext0
	.quad	.LVL39-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL42-.Ltext0
	.quad	.LVL44-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LVUS21:
	.uleb128 .LVU69
	.uleb128 .LVU112
	.uleb128 .LVU117
	.uleb128 .LVU120
.LLST21:
	.quad	.LVL27-.Ltext0
	.quad	.LVL39-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL42-.Ltext0
	.quad	.LVL44-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LVUS22:
	.uleb128 .LVU71
	.uleb128 .LVU88
.LLST22:
	.quad	.LVL27-.Ltext0
	.quad	.LVL31-1-.Ltext0
	.value	0x6
	.byte	0x73
	.sleb128 40
	.byte	0x6
	.byte	0x7c
	.sleb128 0
	.byte	0x22
	.quad	0
	.quad	0
.LVUS23:
	.uleb128 .LVU72
	.uleb128 .LVU111
	.uleb128 .LVU111
	.uleb128 .LVU112
	.uleb128 .LVU117
	.uleb128 .LVU120
.LLST23:
	.quad	.LVL27-.Ltext0
	.quad	.LVL39-.Ltext0
	.value	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.quad	.LVL39-.Ltext0
	.quad	.LVL39-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL42-.Ltext0
	.quad	.LVL44-.Ltext0
	.value	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS24:
	.uleb128 .LVU73
	.uleb128 .LVU88
.LLST24:
	.quad	.LVL27-.Ltext0
	.quad	.LVL31-1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0
	.quad	0
.LVUS25:
	.uleb128 .LVU74
	.uleb128 .LVU88
	.uleb128 .LVU88
	.uleb128 .LVU112
	.uleb128 .LVU117
	.uleb128 .LVU120
.LLST25:
	.quad	.LVL27-.Ltext0
	.quad	.LVL31-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL31-1-.Ltext0
	.quad	.LVL39-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 0
	.quad	.LVL42-.Ltext0
	.quad	.LVL44-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 0
	.quad	0
	.quad	0
.LVUS26:
	.uleb128 .LVU75
	.uleb128 .LVU112
	.uleb128 .LVU117
	.uleb128 .LVU120
.LLST26:
	.quad	.LVL27-.Ltext0
	.quad	.LVL39-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL42-.Ltext0
	.quad	.LVL44-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0
	.quad	0
.LVUS27:
	.uleb128 .LVU77
	.uleb128 .LVU112
	.uleb128 .LVU117
	.uleb128 .LVU120
.LLST27:
	.quad	.LVL28-.Ltext0
	.quad	.LVL39-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL42-.Ltext0
	.quad	.LVL44-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0
	.quad	0
.LVUS28:
	.uleb128 .LVU78
	.uleb128 .LVU88
	.uleb128 .LVU88
	.uleb128 .LVU112
	.uleb128 .LVU117
	.uleb128 .LVU120
.LLST28:
	.quad	.LVL29-.Ltext0
	.quad	.LVL31-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL31-1-.Ltext0
	.quad	.LVL39-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -72
	.quad	.LVL42-.Ltext0
	.quad	.LVL44-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -72
	.quad	0
	.quad	0
.LVUS29:
	.uleb128 .LVU81
	.uleb128 .LVU85
	.uleb128 .LVU85
	.uleb128 .LVU88
.LLST29:
	.quad	.LVL29-.Ltext0
	.quad	.LVL30-.Ltext0
	.value	0x10
	.byte	0x70
	.sleb128 0
	.byte	0x7e
	.sleb128 0
	.byte	0x1c
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x33
	.byte	0x24
	.byte	0x74
	.sleb128 0
	.byte	0x22
	.quad	.LVL30-.Ltext0
	.quad	.LVL31-1-.Ltext0
	.value	0xd
	.byte	0x71
	.sleb128 0
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x33
	.byte	0x24
	.byte	0x74
	.sleb128 0
	.byte	0x22
	.quad	0
	.quad	0
.LVUS30:
	.uleb128 .LVU88
	.uleb128 .LVU112
	.uleb128 .LVU117
	.uleb128 .LVU120
.LLST30:
	.quad	.LVL31-.Ltext0
	.quad	.LVL39-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL42-.Ltext0
	.quad	.LVL44-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	0
	.quad	0
.LVUS31:
	.uleb128 .LVU89
	.uleb128 .LVU95
	.uleb128 .LVU95
	.uleb128 .LVU112
	.uleb128 .LVU117
	.uleb128 .LVU120
.LLST31:
	.quad	.LVL31-.Ltext0
	.quad	.LVL33-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL33-.Ltext0
	.quad	.LVL39-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL42-.Ltext0
	.quad	.LVL44-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	0
	.quad	0
.LVUS32:
	.uleb128 .LVU92
	.uleb128 .LVU108
	.uleb128 .LVU117
	.uleb128 .LVU120
.LLST32:
	.quad	.LVL32-.Ltext0
	.quad	.LVL37-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL42-.Ltext0
	.quad	.LVL44-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LVUS33:
	.uleb128 .LVU98
	.uleb128 .LVU105
	.uleb128 .LVU117
	.uleb128 .LVU120
.LLST33:
	.quad	.LVL34-.Ltext0
	.quad	.LVL36-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL42-.Ltext0
	.quad	.LVL44-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	0
	.quad	0
.LVUS34:
	.uleb128 .LVU80
	.uleb128 .LVU114
	.uleb128 .LVU117
	.uleb128 .LVU120
.LLST34:
	.quad	.LVL29-.Ltext0
	.quad	.LVL40-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL42-.Ltext0
	.quad	.LVL44-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LVUS35:
	.uleb128 .LVU80
	.uleb128 .LVU88
.LLST35:
	.quad	.LVL29-.Ltext0
	.quad	.LVL31-1-.Ltext0
	.value	0x6
	.byte	0x73
	.sleb128 40
	.byte	0x6
	.byte	0x7c
	.sleb128 0
	.byte	0x22
	.quad	0
	.quad	0
.LVUS36:
	.uleb128 .LVU79
	.uleb128 .LVU81
.LLST36:
	.quad	.LVL29-.Ltext0
	.quad	.LVL29-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	0
	.quad	0
.LVUS37:
	.uleb128 .LVU79
	.uleb128 .LVU81
.LLST37:
	.quad	.LVL29-.Ltext0
	.quad	.LVL29-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LVUS38:
	.uleb128 .LVU79
	.uleb128 .LVU81
.LLST38:
	.quad	.LVL29-.Ltext0
	.quad	.LVL29-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0
	.quad	0
.LVUS39:
	.uleb128 0
	.uleb128 .LVU147
	.uleb128 .LVU147
	.uleb128 .LVU242
	.uleb128 .LVU242
	.uleb128 .LVU243
	.uleb128 .LVU243
	.uleb128 0
.LLST39:
	.quad	.LVL45-.Ltext0
	.quad	.LVL49-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL49-.Ltext0
	.quad	.LVL77-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL77-.Ltext0
	.quad	.LVL78-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL78-.Ltext0
	.quad	.LFE59-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0
	.quad	0
.LVUS40:
	.uleb128 0
	.uleb128 .LVU128
	.uleb128 .LVU128
	.uleb128 0
.LLST40:
	.quad	.LVL45-.Ltext0
	.quad	.LVL46-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL46-.Ltext0
	.quad	.LFE59-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -108
	.quad	0
	.quad	0
.LVUS41:
	.uleb128 0
	.uleb128 .LVU149
	.uleb128 .LVU149
	.uleb128 .LVU177
	.uleb128 .LVU177
	.uleb128 .LVU243
	.uleb128 .LVU243
	.uleb128 .LVU247
	.uleb128 .LVU247
	.uleb128 0
.LLST41:
	.quad	.LVL45-.Ltext0
	.quad	.LVL50-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL50-.Ltext0
	.quad	.LVL58-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL58-.Ltext0
	.quad	.LVL78-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.quad	.LVL78-.Ltext0
	.quad	.LVL82-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL82-.Ltext0
	.quad	.LFE59-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS42:
	.uleb128 0
	.uleb128 .LVU131
	.uleb128 .LVU131
	.uleb128 0
.LLST42:
	.quad	.LVL45-.Ltext0
	.quad	.LVL47-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL47-.Ltext0
	.quad	.LFE59-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -100
	.quad	0
	.quad	0
.LVUS43:
	.uleb128 0
	.uleb128 .LVU151
	.uleb128 .LVU151
	.uleb128 0
.LLST43:
	.quad	.LVL45-.Ltext0
	.quad	.LVL51-1-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL51-1-.Ltext0
	.quad	.LFE59-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -101
	.quad	0
	.quad	0
.LVUS0:
	.uleb128 0
	.uleb128 .LVU3
	.uleb128 .LVU3
	.uleb128 0
.LLST0:
	.quad	.LVL0-.Ltext0
	.quad	.LVL2-1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL2-1-.Ltext0
	.quad	.LFE60-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS1:
	.uleb128 .LVU2
	.uleb128 .LVU13
	.uleb128 .LVU14
	.uleb128 0
.LLST1:
	.quad	.LVL1-.Ltext0
	.quad	.LVL8-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL9-.Ltext0
	.quad	.LFE60-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LVUS2:
	.uleb128 .LVU5
	.uleb128 .LVU8
	.uleb128 .LVU8
	.uleb128 .LVU9
	.uleb128 .LVU9
	.uleb128 .LVU11
.LLST2:
	.quad	.LVL4-.Ltext0
	.quad	.LVL5-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL5-.Ltext0
	.quad	.LVL6-.Ltext0
	.value	0x3
	.byte	0x73
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL6-.Ltext0
	.quad	.LVL7-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LVUS44:
	.uleb128 .LVU174
	.uleb128 .LVU177
	.uleb128 .LVU239
	.uleb128 .LVU240
.LLST44:
	.quad	.LVL57-.Ltext0
	.quad	.LVL58-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL74-.Ltext0
	.quad	.LVL75-.Ltext0
	.value	0x3
	.byte	0x73
	.sleb128 1
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS45:
	.uleb128 .LVU135
	.uleb128 .LVU177
	.uleb128 .LVU235
	.uleb128 .LVU236
	.uleb128 .LVU243
	.uleb128 .LVU247
.LLST45:
	.quad	.LVL48-.Ltext0
	.quad	.LVL58-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL72-.Ltext0
	.quad	.LVL73-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL78-.Ltext0
	.quad	.LVL82-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS46:
	.uleb128 .LVU168
	.uleb128 .LVU177
	.uleb128 .LVU177
	.uleb128 .LVU240
	.uleb128 .LVU243
	.uleb128 .LVU244
	.uleb128 .LVU246
	.uleb128 .LVU247
.LLST46:
	.quad	.LVL55-.Ltext0
	.quad	.LVL58-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL58-.Ltext0
	.quad	.LVL75-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL78-.Ltext0
	.quad	.LVL80-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL81-.Ltext0
	.quad	.LVL82-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LVUS47:
	.uleb128 .LVU136
	.uleb128 .LVU147
	.uleb128 .LVU147
	.uleb128 .LVU162
.LLST47:
	.quad	.LVL48-.Ltext0
	.quad	.LVL49-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL49-.Ltext0
	.quad	.LVL53-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0
	.quad	0
.LVUS48:
	.uleb128 .LVU138
	.uleb128 .LVU147
	.uleb128 .LVU147
	.uleb128 .LVU151
.LLST48:
	.quad	.LVL48-.Ltext0
	.quad	.LVL49-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 16
	.quad	.LVL49-.Ltext0
	.quad	.LVL51-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LVUS49:
	.uleb128 .LVU139
	.uleb128 .LVU147
	.uleb128 .LVU147
	.uleb128 .LVU151
.LLST49:
	.quad	.LVL48-.Ltext0
	.quad	.LVL49-.Ltext0
	.value	0x3
	.byte	0x75
	.sleb128 16
	.byte	0x6
	.quad	.LVL49-.Ltext0
	.quad	.LVL51-1-.Ltext0
	.value	0x2
	.byte	0x70
	.sleb128 0
	.quad	0
	.quad	0
.LVUS50:
	.uleb128 .LVU140
	.uleb128 .LVU162
.LLST50:
	.quad	.LVL48-.Ltext0
	.quad	.LVL53-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LVUS51:
	.uleb128 .LVU141
	.uleb128 .LVU151
.LLST51:
	.quad	.LVL48-.Ltext0
	.quad	.LVL51-1-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	0
	.quad	0
.LVUS52:
	.uleb128 .LVU142
	.uleb128 .LVU162
.LLST52:
	.quad	.LVL48-.Ltext0
	.quad	.LVL53-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LVUS53:
	.uleb128 .LVU154
	.uleb128 .LVU156
.LLST53:
	.quad	.LVL51-.Ltext0
	.quad	.LVL52-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS54:
	.uleb128 .LVU143
	.uleb128 .LVU147
	.uleb128 .LVU147
	.uleb128 .LVU151
.LLST54:
	.quad	.LVL48-.Ltext0
	.quad	.LVL49-.Ltext0
	.value	0xe
	.byte	0x75
	.sleb128 16
	.byte	0x6
	.byte	0x94
	.byte	0x4
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x32
	.byte	0x24
	.byte	0x9f
	.quad	.LVL49-.Ltext0
	.quad	.LVL51-1-.Ltext0
	.value	0xe
	.byte	0x7f
	.sleb128 16
	.byte	0x6
	.byte	0x94
	.byte	0x4
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x32
	.byte	0x24
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS55:
	.uleb128 .LVU143
	.uleb128 .LVU151
.LLST55:
	.quad	.LVL48-.Ltext0
	.quad	.LVL51-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS56:
	.uleb128 .LVU143
	.uleb128 .LVU151
.LLST56:
	.quad	.LVL48-.Ltext0
	.quad	.LVL51-1-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	0
	.quad	0
.LVUS57:
	.uleb128 .LVU177
	.uleb128 .LVU182
	.uleb128 .LVU182
	.uleb128 .LVU223
.LLST57:
	.quad	.LVL58-.Ltext0
	.quad	.LVL59-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL59-.Ltext0
	.quad	.LVL71-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LVUS58:
	.uleb128 .LVU191
	.uleb128 .LVU195
	.uleb128 .LVU195
	.uleb128 .LVU223
.LLST58:
	.quad	.LVL62-.Ltext0
	.quad	.LVL63-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL63-1-.Ltext0
	.quad	.LVL71-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LVUS59:
	.uleb128 .LVU183
	.uleb128 .LVU185
	.uleb128 .LVU185
	.uleb128 .LVU190
.LLST59:
	.quad	.LVL59-.Ltext0
	.quad	.LVL60-.Ltext0
	.value	0x6
	.byte	0x70
	.sleb128 0
	.byte	0x7d
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL60-.Ltext0
	.quad	.LVL61-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LVUS60:
	.uleb128 .LVU192
	.uleb128 .LVU195
	.uleb128 .LVU195
	.uleb128 .LVU217
.LLST60:
	.quad	.LVL62-.Ltext0
	.quad	.LVL63-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL63-1-.Ltext0
	.quad	.LVL69-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LVUS61:
	.uleb128 .LVU192
	.uleb128 .LVU217
.LLST61:
	.quad	.LVL62-.Ltext0
	.quad	.LVL69-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LVUS62:
	.uleb128 .LVU192
	.uleb128 .LVU195
	.uleb128 .LVU195
	.uleb128 .LVU217
.LLST62:
	.quad	.LVL62-.Ltext0
	.quad	.LVL63-1-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 0
	.quad	.LVL63-1-.Ltext0
	.quad	.LVL69-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0
	.quad	0
.LVUS63:
	.uleb128 .LVU197
	.uleb128 .LVU203
	.uleb128 .LVU203
	.uleb128 .LVU215
	.uleb128 .LVU215
	.uleb128 .LVU216
.LLST63:
	.quad	.LVL63-.Ltext0
	.quad	.LVL64-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL64-.Ltext0
	.quad	.LVL67-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL67-.Ltext0
	.quad	.LVL68-.Ltext0
	.value	0x3
	.byte	0x71
	.sleb128 1
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS64:
	.uleb128 .LVU204
	.uleb128 .LVU209
.LLST64:
	.quad	.LVL64-.Ltext0
	.quad	.LVL66-.Ltext0
	.value	0x7
	.byte	0x71
	.sleb128 0
	.byte	0x32
	.byte	0x24
	.byte	0x79
	.sleb128 0
	.byte	0x22
	.quad	0
	.quad	0
.LVUS65:
	.uleb128 .LVU206
	.uleb128 .LVU217
.LLST65:
	.quad	.LVL65-.Ltext0
	.quad	.LVL69-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	0
	.quad	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LBB24-.Ltext0
	.quad	.LBE24-.Ltext0
	.quad	.LBB45-.Ltext0
	.quad	.LBE45-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB25-.Ltext0
	.quad	.LBE25-.Ltext0
	.quad	.LBB30-.Ltext0
	.quad	.LBE30-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB31-.Ltext0
	.quad	.LBE31-.Ltext0
	.quad	.LBB44-.Ltext0
	.quad	.LBE44-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB32-.Ltext0
	.quad	.LBE32-.Ltext0
	.quad	.LBB41-.Ltext0
	.quad	.LBE41-.Ltext0
	.quad	.LBB42-.Ltext0
	.quad	.LBE42-.Ltext0
	.quad	.LBB43-.Ltext0
	.quad	.LBE43-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB34-.Ltext0
	.quad	.LBE34-.Ltext0
	.quad	.LBB37-.Ltext0
	.quad	.LBE37-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB58-.Ltext0
	.quad	.LBE58-.Ltext0
	.quad	.LBB71-.Ltext0
	.quad	.LBE71-.Ltext0
	.quad	.LBB72-.Ltext0
	.quad	.LBE72-.Ltext0
	.quad	.LBB73-.Ltext0
	.quad	.LBE73-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB60-.Ltext0
	.quad	.LBE60-.Ltext0
	.quad	.LBB65-.Ltext0
	.quad	.LBE65-.Ltext0
	.quad	.LBB66-.Ltext0
	.quad	.LBE66-.Ltext0
	.quad	.LBB67-.Ltext0
	.quad	.LBE67-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB78-.Ltext0
	.quad	.LBE78-.Ltext0
	.quad	.LBB86-.Ltext0
	.quad	.LBE86-.Ltext0
	.quad	.LBB87-.Ltext0
	.quad	.LBE87-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF109:
	.string	"__builtin_omp_get_thread_num"
.LASF75:
	.string	"load_factor"
.LASF31:
	.string	"_shortbuf"
.LASF125:
	.string	"_IO_lock_t"
.LASF117:
	.string	"GOMP_parallel"
.LASF112:
	.string	"next_random_float"
.LASF47:
	.string	"stderr"
.LASF20:
	.string	"_IO_buf_end"
.LASF57:
	.string	"UPDATE_SYNCHRONOUS"
.LASF79:
	.string	"bcount"
.LASF54:
	.string	"signgam"
.LASF18:
	.string	"_IO_write_end"
.LASF1:
	.string	"unsigned int"
.LASF36:
	.string	"_freeres_list"
.LASF12:
	.string	"_flags"
.LASF105:
	.string	"__len"
.LASF69:
	.string	"nthread"
.LASF24:
	.string	"_markers"
.LASF108:
	.string	"__builtin_omp_get_num_threads"
.LASF121:
	.string	"GNU C17 9.4.0 -mtune=generic -march=x86-64 -g -O3 -fopenmp -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF102:
	.string	"compute_weight"
.LASF96:
	.string	"neightbor"
.LASF55:
	.string	"uint32_t"
.LASF46:
	.string	"stdout"
.LASF23:
	.string	"_IO_save_end"
.LASF111:
	.string	"__builtin_GOMP_barrier"
.LASF52:
	.string	"float"
.LASF43:
	.string	"_IO_codecvt"
.LASF80:
	.string	"onid"
.LASF82:
	.string	"count"
.LASF73:
	.string	"rat_seed"
.LASF51:
	.string	"long long unsigned int"
.LASF56:
	.string	"random_t"
.LASF93:
	.string	"pre_cal"
.LASF49:
	.string	"sys_errlist"
.LASF22:
	.string	"_IO_backup_base"
.LASF33:
	.string	"_offset"
.LASF48:
	.string	"sys_nerr"
.LASF103:
	.string	"__dest"
.LASF26:
	.string	"_fileno"
.LASF123:
	.string	"/home/guest/Documents/cty_home_dir/cmu15418-s18/asst3-s18/code"
.LASF6:
	.string	"size_t"
.LASF94:
	.string	"eid_start"
.LASF15:
	.string	"_IO_read_base"
.LASF89:
	.string	"_Bool"
.LASF83:
	.string	"update_mode"
.LASF45:
	.string	"stdin"
.LASF65:
	.string	"graph_t"
.LASF62:
	.string	"nedge"
.LASF11:
	.string	"char"
.LASF77:
	.string	"state_t"
.LASF39:
	.string	"_mode"
.LASF64:
	.string	"neighbor_start"
.LASF42:
	.string	"_IO_marker"
.LASF60:
	.string	"update_t"
.LASF13:
	.string	"_IO_read_ptr"
.LASF74:
	.string	"rat_count"
.LASF126:
	.string	"simulate"
.LASF119:
	.string	"show"
.LASF113:
	.string	"mweight"
.LASF16:
	.string	"_IO_write_base"
.LASF50:
	.string	"long long int"
.LASF101:
	.string	"compute_sum_weight"
.LASF21:
	.string	"_IO_save_base"
.LASF97:
	.string	"next_random_move"
.LASF66:
	.string	"memo"
.LASF114:
	.string	"memset"
.LASF87:
	.string	"simulate._omp_fn.0"
.LASF37:
	.string	"_freeres_buf"
.LASF70:
	.string	"global_seed"
.LASF38:
	.string	"__pad5"
.LASF30:
	.string	"_vtable_offset"
.LASF120:
	.string	"done"
.LASF100:
	.string	"take_census"
.LASF84:
	.string	"dinterval"
.LASF76:
	.string	"batch_size"
.LASF63:
	.string	"neighbor"
.LASF81:
	.string	"nnid"
.LASF118:
	.string	"__builtin_GOMP_parallel"
.LASF91:
	.string	"run_step"
.LASF104:
	.string	"__ch"
.LASF14:
	.string	"_IO_read_end"
.LASF5:
	.string	"short int"
.LASF85:
	.string	"display"
.LASF8:
	.string	"long int"
.LASF122:
	.string	"sim.c"
.LASF88:
	.string	"show_counts"
.LASF127:
	.string	"__stack_chk_fail"
.LASF116:
	.string	"outmsg"
.LASF78:
	.string	"bstart"
.LASF72:
	.string	"next_rat_position"
.LASF44:
	.string	"_IO_wide_data"
.LASF71:
	.string	"rat_position"
.LASF95:
	.string	"eid_end"
.LASF68:
	.string	"nrat"
.LASF90:
	.string	"process_batch"
.LASF58:
	.string	"UPDATE_BATCH"
.LASF61:
	.string	"nnode"
.LASF98:
	.string	"seedp"
.LASF115:
	.string	"__builtin_memset"
.LASF35:
	.string	"_wide_data"
.LASF32:
	.string	"_lock"
.LASF99:
	.string	"tsum"
.LASF0:
	.string	"long unsigned int"
.LASF28:
	.string	"_old_offset"
.LASF124:
	.string	"_IO_FILE"
.LASF67:
	.string	"binfo"
.LASF2:
	.string	"unsigned char"
.LASF7:
	.string	"__uint32_t"
.LASF17:
	.string	"_IO_write_ptr"
.LASF86:
	.string	"process_batch._omp_fn.0"
.LASF59:
	.string	"UPDATE_RAT"
.LASF34:
	.string	"_codecvt"
.LASF110:
	.string	"GOMP_barrier"
.LASF9:
	.string	"__off_t"
.LASF4:
	.string	"signed char"
.LASF3:
	.string	"short unsigned int"
.LASF53:
	.string	"double"
.LASF106:
	.string	"omp_get_num_threads"
.LASF107:
	.string	"omp_get_thread_num"
.LASF92:
	.string	"rest"
.LASF25:
	.string	"_chain"
.LASF41:
	.string	"FILE"
.LASF27:
	.string	"_flags2"
.LASF29:
	.string	"_cur_column"
.LASF10:
	.string	"__off64_t"
.LASF40:
	.string	"_unused2"
.LASF19:
	.string	"_IO_buf_base"
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
