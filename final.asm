#Check assembly instruction
#Final Project: Assembly Language and Computer Architecture Lab
#Class	: 139365
#Student: Kha Minh Bao
#ID	: 20210098

.data
	#Instruction, include opcode and maximum 3 operand
	input: 	.space 100
	opcode: .space 10
	opr1:	.space	32
	opr2:	.space	32
	opr3:	.space	32
	
	#Instruction Pattern
	#r=register, i=immediate, f=float register, l=label, s=special address, x: nothing
	type: .asciiz "x", "r", "i", "f", "l", "s"
    	register: .asciiz 
    		"$zero", "$at", "$v0", "$v1", 
    		"$a0", "$a1", "$a2", "$a3", 
    		"$t0", "$t1", "$t2", "$t3", "$t4", "$t5", "$t6", "$t7", 
    		"$s0", "$s1", "$s2", "$s3", "$s4", "$s5", "$s6", "$s7", 
    		"$t8", "$t9", "$k0", "$k1", "$gp", "$sp", "$fp", "$ra",
    		"$0", "$1", "$2", "$3", "$4", "$5", "$6", "$7", "$8", 
    		"$9", "$10", "$11", "$12", "$13", "$14", "$15", "$16", 
    		"$17", "$18", "$19", "$20", "$21", "$22", "$23", "$24", 
    		"$25", "$26", "$27", "$28", "$29", "$30", "$31", "$32" 
    	float: .asciiz 
    		"$f0", "$f1", "$f2", "$f3", "$f4", "$f5", "$f6", "$f7", 
    		"$f8", "$f9", "$f10", "$f11", "$f12", "$f13", "$f14", "$f15", 
    		"$f16", "$f17", "$f18", "$f19", "$f20", "$f21", "$f22", "$f23", 
    		"$f24", "$f25", "$f26", "$f27", "$f28", "$f29", "$f30", "$f31"
	#"opcode","operand type","number of clock cycles"
    	instructions: .asciiz 
    		"abs.d","ffx","1",
    		"abs.s","ffx","1",
    		"add","rrr","1",
    		"add.d","rrr","1",
    		"add.s","rrr","1",
    		"addi","rri","1",
  	  	"addiu","rri","1",
    		"addu","rrr","1",
    		"and","rrr","1",
    		"andi","rri","1",    
    		"bc1f","lxx","2",
    		"bc1t","lxx","2",
    		"beq","rrl","2",
    		"bgez","rlx","2",
    		"bgezal","rlx","2",
    		"bgtz","rlx","2",
    		"blez","rlx","2",
    		"bltz","rlx","2",
    		"bltzal","rlx","2",
    		"bne","rrl","2",
    		"break","xxx","2",
    		"c.eq.d","ffx","2",
    		"c.eq.s","ffx","2",
    		"c.le.d","ffx","2",
    		"c.le.s","ffx","2",
    		"c.lt.d","ffx","2",
    		"c.lt.s","ffx","2",
    		"ceil.w.d","ffx","1",
    		"ceil.w.s","ffx","1",
    		"clo","rrx","1",
    		"clz","rrx","1",
    		"cvt.d.s","ffx","1",
    		"cvt.d.w","ffx","1",
    		"cvt.s.d","ffx","1",
    		"cvt.s.w","ffx","1",
    		"cvt.w.d","ffx","1",
    		"cvt.w.s","ffx","1",
    		"div","rrx","1",
    		"div.d","fff","1",
    		"div.s","fff","1",
    		"divu","rrx","1",
    		"eret","xxx","2",
    		"floor.w.d","ffx","1",
    		"floor.w.s","ffx","1",
    		"j","lxx","2",
    		"jal","lxx","2",
    		"jalr","rrx","2",
    		"jr","rrx","2",
    		"lb","rsx","2",
    		"lbu","rsx","2",
    		"ldc1","rsx","2",
    		"lh","rsx","2",
    		"lhu","rsx","2",
   	 	"ll","rsx","2",
    		"lui","rix","2",
    		"lw","rsx","2",
    		"lwc1","rsx","2",
    		"lwl","rsx","2",
    		"lwr","rsx","2",
    		"madd","rrx","1",
    		"maddu","rrx","1",
    		"mfc0","rrx","1",
    		"mfc1","rfx","1",
    		"mfhi","rxx","1",
    		"mflo","rxx","1",
    		"mov.d","ffx","1",
    		"mov.s","ffx","1",
    		"movf","rrx","1",
    		"movf.d","ffx","1",
    		"movf.s","ffx","1",
    		"movn","rrx","1",
    		"movn.d","ffx","1",
    		"movn.s","ffx","1",
    		"movt","rrx","1",
    		"movt.d","ffx","1",
    		"movt.s","ffx","1",
    		"movz","rrx","1",
    		"movz.d","ffx","1",
    		"movz.s","ffx","1",
    		"msub","rrx","1",
    		"msubu","rrx","1",
    		"mtc0","rrx","1",
    		"mtc1","rfx","1",
    		"mthi","rxx","1",
    		"mtlo","rxx","1",
    		"mul","rrr","1",
    		"mul.d","fff","1",
    		"mul.s","fff","1",
    		"mult","rrx","1",
    		"multu","rrx","1",
    		"neg.d","ffx","1",
    		"neg.s","ffx","1",
    		"nop","xxx","1",
    		"nor","rrr","1",
    		"or","rrr","1",
    		"ori","rri","1",
    		"round.w.d","ffx","1",
    		"round.w.s","ffx","1",
    		"sb","rsx","2",
    		"sc","rsx","2",
    		"sdc1","rsx","2",
    		"sh","rsx","2",
    		"sll","rrx","1",
    		"sllv","rrx","1",
    		"slt","rrr","1",
    		"slti","rri","1",
    		"sltiu","rri","1",
    		"sltu","rrr","1",
    		"sra","rrx","1",
    		"srav","rrx","1",
    		"srl","rrx","1",
    		"srlv","rrx","1",
    		"sub","rrr","1",
    		"sub.d","rrr","1",
    		"sub.s","rrr","1",
    		"subu","rrr","1",
    		"sw","rsx","2",
    		"swc1","rsx","2",
    		"swl","rsx","2",
    		"swr","rsx","2",
    		"syscall","xxx","2",
    		"teq","rrx","1",
    		"teqi","rri","1",
    		"tge","rrx","1",
    		"tgei","rri","1",
    		"tgeiu","rri","1",
    		"tgeu","rrx","1",
    		"tlbp","xxx","2",
    		"tlbr","xxx","2",
    		"tlbwi","xxx","2",
   		"tlbwr","xxx","2",
    		"tlt","rrx","1",
    		"tlti","rri","1",
    		"tltiu","rri","1",
    		"tltu","rrx","1",
    		"tne","rrx","1",
    		"tnei","rri","1",
    		"trunc.w.d","ffx","1",
    		"trunc.w.s","ffx","1",
    		"xor","rrr","1",
    		"xori","rri","1"
    		
    	#character
    	tab	: "\t" 
    	null	: "\0"
    	enter	: "\n"
    	space	: " "
    	comma	: ","
    	mark	: "'"
    	colon	: ":"
    	
    	#say sth
    	ask: 		.asciiz "Enter an Assembly command: "
    	valid: 		.asciiz "valid"
    	invalid:	.asciiz "invalid"
    	say_opcode:	.asciiz "Opcode "
    	say_operand:	.asciiz "Operand "
.text

read:
	#Prompt user to enter an instruction
    	li 	$v0, 4
    	la 	$a0, ask
    	syscall
    	#Read the instruction, store at "input" address
    	li 	$v0, 8
    	la 	$a0, input
    	li 	$a1, 100
    	syscall
    	#__init__
    	la	$s0, input
    	addi	$s0, $s0, -1
    	la	$t6, tab
    	la	$t7, enter
    	la	$t8, space
    	la	$t9, comma
    	
opcode_pre:
	#remove space or tab before opcode
	addi	$s0, $s0, 1
    	lb	$t0, 00($s0)			#load character
    	lb	$t1, 0($t8)
	beq	$t0, $t1, opcode_pre
	lb	$t1, 0($t6)
	beq	$t0, $t1, opcode_pre
	#__init__
	la	$s1, opcode
	lb	$t0, 0($s0)			#load character
    	
opcode_find:
	#add char to opcode
	sb	$t0, 0($s1)
	#next char
	addi	$s0, $s0, 1
	addi	$s1, $s1, 1
	lb	$t0, 0($s0)			#load character
	#if space or tab: goto operand
	lb	$t1, 0($t8)
	beq	$t0, $t1, opr1_pre
	lb	$t1, 0($t6)
	beq	$t0, $t1, opr1_pre
	#if \n or null: goto progcess
    	beqz	$t0, progcess
    	lb	$t1, 0($t7)
    	beq	$t0, $t1, progcess
	j	opcode_find
	
opr1_pre:
	#remove all space or tab left between opcode and opr1
    	addi	$s0, $s0, 1
    	lb	$t0, 0($s0)			#load character
    	lb	$t1, 0($t8)
	beq	$t0, $t1, opr1_pre
	lb	$t1, 0($t6)
	beq	$t0, $t1, opr1_pre
	#__init__
	la	$s2, opr1
	lb	$t0, 0($s0)			#load character
	
opr1_find:
	#add char to operand1
	sb	$t0, 0($s2)
	#next char
	addi	$s0, $s0, 1
	addi	$s2, $s2, 1
	lb	$t0, 0($s0)			#load character
	#if space or tab, or comma: goto operand2
	lb	$t1, 0($t8)
	beq	$t0, $t1, opr2_pre
	lb	$t1, 0($t9)
	beq	$t0, $t1, opr2_pre
	lb	$t1, 0($t6)
	beq	$t0, $t1, opr2_pre
	#if \n or null: goto progcess
	lb	$t1, 0($t6)
    	beqz	$t0, progcess
    	lb	$t1, 0($t7)
    	beq	$t0, $t1, progcess
	j	opr1_find
	
opr2_pre:
	#remove all space or tab left between opr1 and opr2
    	addi	$s0, $s0, 1
    	lb	$t0, 0($s0)			#load character
    	lb	$t1, 0($t8)
	beq	$t0, $t1, opr2_pre
	lb	$t1, 0($t6)
	beq	$t0, $t1, opr2_pre
	#__init__
	la	$s3, opr2
	lb	$t0, 0($s0)			#load character
	
opr2_find:
	#add char to operand2
	sb	$t0, 0($s3)
	#next char
	addi	$s0, $s0, 1
	addi	$s3, $s3, 1
	lb	$t0, 0($s0)			#load character
	#if space or tab, or comma: goto operand2
	lb	$t1, 0($t8)
	beq	$t0, $t1, opr3_pre
	lb	$t1, 0($t9)
	beq	$t0, $t1, opr3_pre
	lb	$t1, 0($t6)
	beq	$t0, $t1, opr3_pre
	#if \n or null: goto progcess
	lb	$t1, 0($t6)
    	beqz	$t0, progcess
    	lb	$t1, 0($t7)
    	beq	$t0, $t1, progcess
	j	opr2_find

opr3_pre:
	#remove all space or tab left between opr2 and opr3
    	addi	$s0, $s0, 1
    	lb	$t0, 0($s0)			#load character
    	lb	$t1, 0($t8)
	beq	$t0, $t1, opr3_pre
	lb	$t1, 0($t6)
	beq	$t0, $t1, opr3_pre
	#__init__
	la	$s4, opr3
	lb	$t0, 0($s0)			#load character
	
opr3_find:
	#add char to operand2
	sb	$t0, 0($s4)
	#next char
	addi	$s0, $s0, 1
	addi	$s4, $s4, 1
	lb	$t0, 0($s0)			#load character
	#if \n or null: goto progcess
	lb	$t1, 0($t6)
    	beqz	$t0, progcess
    	lb	$t1, 0($t7)
    	beq	$t0, $t1, progcess
	j	opr3_find

#should add xu li hau to opr3 la nhung dau space / cach

progcess: 	nop
opcode_init:
	la	$s0, opcode
	la	$s1, instructions
	
opcode_print:	#Opcode '...': 
	li 	$v0, 4
	la 	$a0, say_opcode
	syscall
	li 	$v0, 4
	la 	$a0, mark
	syscall
	li 	$v0, 4
	la 	$a0, opcode
	syscall
	li 	$v0, 4
	la 	$a0, mark
	syscall
	li 	$v0, 4
	la 	$a0, colon
	syscall
	li 	$v0, 4
	la 	$a0, space
	syscall

opcode_check:
	lb 	$t0, 0($s0)
	lb 	$t1, 0($s1)
	#If one character is different, jump to next opcode
	bne 	$t0, $t1, next_opcode
	addi 	$s0, $s0, 1
	addi 	$s1, $s1, 1
	#If reach the end of input opcode part, jump to check-end-opcode
	lb 	$t0, 0($s0)
	beqz 	$t0, opcode_endcheck
	#If okay with current character, jump to opcode_check
	j 	opcode_check

next_opcode:
	#Skip current opcode
	addi 	$s1, $s1, 1
	lb 	$t1, 0($s1)
	bne 	$t1, $zero, next_opcode
	addi 	$s1, $s1, 7
	lb 	$t1, 0($s1)
	beq 	$t1, $zero, return_invalid
	la 	$s0, opcode
	j 	opcode_check 

opcode_endcheck:
	lb 	$t1, 0($s1)
	beqz 	$t1, valid_opcode

valid_opcode:
	li 	$v0, 4
	la 	$a0, valid
	syscall
	li 	$v0, 4
	la 	$a0, enter
	syscall
	
#$s0	: Operand
#$s1	: Instruction Format
opr1_type:
	la 	$s0, opr1
        addi 	$s1, $s1, 1
        lb 	$t1, 0($s1)
        li 	$s3, 1
        jal 	type_check
        
opr2_type:
	la 	$s0, opr2
        addi 	$s1, $s1, 1
        lb 	$t1, 0($s1)
        li 	$s3, 2
        jal 	type_check
        nop

opr3_type:
	la 	$s0, operand3
        addi 	$s1, $s1, 1
        lb 	$t1, 0($s1)
        li 	$s3, 3
        jal 	type_check
        nop
        j 	number_of_cycles

clock_cycles:

exit:
	li	$v0, 10
	syscall

type_check:
        la 	$s2, type 
        lb 	$t2, 0($s2)
        beq 	$t1, $t2, x_check
        addi 	$s2, $s2, 2
        
        #if not type x, manually print prompt
        li 	$v0, 4
	la 	$a0, say_operand
	syscall
	li 	$v0, 4
	la 	$a0, mark
	syscall
	li 	$v0, 4
	la 	$a0, opcode
	syscall
	li 	$v0, 4
	la 	$a0, mark
	syscall
	li 	$v0, 4
	la 	$a0, colon
	syscall
	li 	$v0, 4
	la 	$a0, space
	syscall
	
        lb 	$t2, 0($s2)
        beq 	$t1, $t2, r_check
        addi 	$s2, $s2, 2
        lb 	$t2, 0($s2)
        beq 	$t1, $t2, i_check
        addi 	$s2, $s2, 2
        lb 	$t2, 0($s2)
        beq 	$t1, $t2, f_check
        addi 	$s2, $s2, 2
        lb 	$t2, 0($s2)
        beq 	$t1, $t2, l_check
        addi 	$s2, $s2, 2
        lb 	$t2, 0($s2)
        beq 	$t1, $t2, s_check
        
x_check:
        addi 	$s2, $s0, 0
        lb 	$t0, 0($s2)
        bnez 	$t0, x_invalid
        j	clock_cycles
        
r_check:
        #__init__
	addi 	$s2, $s0, 0
	la 	$s4, register
	j	rf_loop
	
f_check:
	#__init__
	addi 	$s2, $s0, 0
	la 	$s4, float
	
rf_loop:
	lb	$t0, 0($s2)
	lb	$t1, 0($s4)
	#If not, jump to check next registers
	bne 	$t0, $t1, rf_next
	addi 	$s2, $s2, 1
	addi 	$s4, $s4, 1
	#If reach the end of input operand, jump to endcheck to make sure that same
	lb 	$t1, 0($s4)
	beqz 	$t1, rf_endcheck
	j	rf_loop
            
rf_next:
	addi 	$s4, $s4, 1
	lb	$t1, 0($s4)
	bne  	$t1, $zero, rf_next
	addi 	$s4, $s4, 1
	lb 	$t1, 0($s4)
	beq  	$t1, $zero, return_invalid
	addi 	$s2, $s0, 0
	j 	rf_loop
            
rf_endcheck:
	lb 	$t0, 0($s2)
	beqz 	$t0, valid_opr
	j 	rf_next
            
i_check:
	#__init__
	addi 	$s2, $s0, 0
        #Check first character, could be '-' or digit
	lb 	$t0, 0($s2)
	bne 	$t0, '-', i_loop
        #If '-', point to next character
	addi 	$s2, $s2, 1
        i_loop:
            lb 	 $t0, 0($s2)
            blt  $t0, '0', return_invalid
            bgt  $t0, '9', return_invalid
            #If valid, point to next character
            addi $s2, $s2, 1
            #If reach the end of input operand, jump to check_end_r
            lb	 $t0, 0($s2)
            beqz $t0, valid_opr
            j	 i_loop
            
l_check:
	#__init__
	addi 	$s2, $s0, 0
	lb 	$t0, 0($s2)
	addi 	$s2, $s2, 1
        #First character must be letter
	blt 	$t0, 'A', return_invalid
	ble 	$t0, 'Z', l_loop
	blt 	$t0, 'a', return_invalid
	bgt 	$t0, 'z', return_invalid
	
        l_loop:
            #Check the rest of the characters
            #Label can only contains letters, numbers, and underscores
            lb 	$t0, ($s2)
            #underscores
            beq $t0, '_', l_next
            #number
            blt $t0, '0', return_invalid
            ble $t0, '9', l_next
            #letter
            blt $t0, 'A', return_invalid
            ble $t0, 'Z', l_next
	    blt $t0, 'a', return_invalid
	    bgt $t0, 'z', return_invalid
            
            l_next:
            #If valid, point to next character
            addi $s2, $s2, 1
            lb 	 $t0, 0($s2)
            beqz $t0, valid_operand
            j	 l_loop
	
s_check:

valid_opr:
	li 	$v0, 4
	la 	$a0, valid
	syscall
	li 	$v0, 4
	la 	$a0, enter
	syscall
	jr	$ra

x_invalid:	#Openrand '...': invalid
	li 	$v0, 4
	la 	$a0, say_operand
	syscall
	li 	$v0, 4
	la 	$a0, mark
	syscall
	li 	$v0, 4
	la 	$a0, opcode
	syscall
	li 	$v0, 4
	la 	$a0, mark
	syscall
	li 	$v0, 4
	la 	$a0, colon
	syscall
	li 	$v0, 4
	la 	$a0, space
	syscall
	
return_invalid:
    	li 	$v0, 4
    	la 	$a0, invalid
    	syscall
    	

