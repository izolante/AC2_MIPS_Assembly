#Izolante
#Fiz o programa na IDE Mars 4.5 porq o PCSim e o QTSpim estavam dando alguns erros, falando que alguns comandos não estavam corretos.
#Opção B do trabalho final de AC2
#10/12/2020 13:00
.data
titulo: .asciiz "Trabalho de AC2, opcao B\n"
insira: .asciiz "insira um valor: "
espaco: .asciiz "|"
linha: 	.asciiz "\n"
antes: 	.asciiz "\nAntes\n"
depois: .asciiz "\nDepois\n"
.align 2
vetor: .space 80
.text

main:

    la $t3 vetor
    la $a0, titulo #mostra o titulo
    la $v0, 4
    syscall
    loop:
	beq  $t1,20,zeracontador #faz o loop pra receber os inputs, 20 inputs, quando chegar em 20 pula para o zerador

        la $a0, insira #mostra mensagem 1
        li $v0, 4
        syscall
        li $v0, 5 #le o input
        syscall
        move $t0, $v0

        

        addi $t1, $t1,1 #contador
        sw $t0,($t3)
        addi $t3,$t3,4

        j loop #recomeca o loop ate completar os 20 inputs

    zeracontador:
    	addi $t0, $zero, 0
    	#printa o "antes"
    	li $v0, 4
    	la $a0, antes
    	syscall
    	#printa a barra
    	li $v0, 4
    	la $a0, espaco
    	syscall
    	j printloop
   
    printloop:
   	beq $t0, 80, zeracontadortrocado
    	
    	lw $t6, vetor($t0)
    	
    	addi $t0,$t0, 4
    	
    	#printa o numero
    	li $v0, 1
    	move $a0, $t6
    	syscall
    	
    	#printa a barra
    	li $v0, 4
    	la $a0, espaco
    	syscall
    	j printloop
    
    zeracontadortrocado:
    	addi $t0, $zero, 0
    	addi $t0,$t0, 4
    	#printa nova linha
    	li $v0, 4
    	la $a0, linha
    	syscall
    	#printa o "depois"
    	li $v0, 4
    	la $a0, depois
    	syscall
    	#printa a barra
    	li $v0, 4
    	la $a0, espaco
    	syscall
    	j printlooptrocado
    	
    printlooptrocado:
    	beq $t0, 80, zeranovamente
    	
    	lw $t6, vetor($t0)
    	
    	addi $t0,$t0, 4
    	
    	#printa o numero
    	li $v0, 1
    	move $a0, $t6
    	syscall
    	
    	#printa a barra
    	li $v0, 4
    	la $a0, espaco
    	syscall
    	j printlooptrocado
    
    zeranovamente:
    	addi $t0, $zero, 0
    	lw $t6, vetor($t0)
    	#printa o numero
    	li $v0, 1
    	move $a0, $t6
    	syscall
    	#printa a barra
    	li $v0, 4
    	la $a0, espaco
    	syscall
    	j exit
    exit:
    	##j printlooptrocado
    	li $v0, 10
    	syscall
