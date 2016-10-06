			.data
menuno:		.asciiz "Suma de numeros pares: "
salto:		.asciiz "\n"
mendos:		.asciiz "Cantidad de letras mayusculas: "
cadena:		.asciiz "a2bc 5def g4AB 6CD3"
sumap:		.space 2
letrasm:	.space 2

			.text
main:		add $s0,$0,$0	#suma
			add $s1,$0,$0	#letras minusculas
			add $s2,$0,$0	# i
			addi $s3, $0, 0x41	#A
			addi $s4, $0, 0x5a	#Z
			addi $s5, $0, 0x61	#a
			addi $s6, $0, 0x7a	#z
			addi $s7, $0, 0x20	#espacio
			addi $t1, $0, 48	#0
			addi $t2, $0, 57	#9
			addi $t3, $0, 2
			li $t0,1		#auxiliar para cargar los elementos e cadena
mientras: 	blez $t0,fin	
			lb $t0,cadena($s2)	#cargamos elemento de la cadena
			blt $t0,$t1, else 
			bgt $t0,$t2, else
			div $t0, $t3
			mfhi $t4
			bne $t4, $0, else
			sub $t5, $t0,$t1
			add $s0,$s0,$t5
			j fuera
else:		blt $t0,$s3, fuera
			bgt $t0,$s4, fuera
			addi $s1,$s1,1
fuera:		addi $s2,$s2,1
			j mientras
fin:		sb $s0,sumap($0)
			sb $s1,letrasm($0)
			la $a0,menuno	# Mostramos mensaje mas valor suma de pares
			li $v0,4
			syscall
			add $a0,$s0,$0
			li $v0,1
			syscall
			la $a0,salto	# Mostramos mensaje mas valor suma de pares
			li $v0,4
			syscall
			la $a0,mendos		# Mostramos mensaje numero de mayusculas
			li $v0,4
			syscall
			add $a0,$s1,$0
			li $v0,1
			syscall
			jr $ra