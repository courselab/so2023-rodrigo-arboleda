# Rodrigo Cesar Arboleda - 2023
# NUSP - 10416722

        ## Boot, say hello, and halt (AT&T assembly)

        .code16                                 # Set 16-bit code
        
        .globl _start                           # Set inicio

_start:	

        jmp main                                # chama a funcao principal
        hlt                                     # para o programa

#===============================================================================================
#					        print char
#===============================================================================================
printChar:
	push %ax				# salva o registrador ax na pilha
        
	movb $0xe, %ah			        # carrega 0xe em ah (modo de escrita na tela)
	int $0x10				# realiza uma interrupcao a BIOS

	pop %ax					# recupera o registrador ax

	ret                                     # retorna funcao

#===============================================================================================
#						Print String
#===============================================================================================
print:
	
	push %ax				# salva o registrador ax na pilha
	push %bx			        # salva o registrador bx na pilha

	movw %ax, %bx				# salva ax em bx

	movb (%bx), %al                         # carrega a primeira letra em al
	call printChar			        # chama a rotina para mostrar um caracter

loop_ini:

        inc %bx                                 # incrementa bx para pegar proxima letra
        movb (%bx), %al                         # carrega a primeira letra em al
        
        cmp $0x0, %al                           # compara letra com 0 para saber se acabou
        je loop_fim                             # sai do loop se for 0
	
        call printChar			        # chama a rotina para mostrar um caracter
        jmp loop_ini                            # reinicia o loop

loop_fim:

        pop %ax                                 # restaura registrador ax
        pop %bx                                 # restaura registrador bx

        ret                                     # retorna funcao


#===============================================================================================
#						    Main
#===============================================================================================
main:

        movw $hello_s, %ax                      # carrega endereco da string em ax
        call print                              # chama a funcao de print
        ret                                     # encerra a funcao principal

stop:
        jmp stop                                # forca parada


hello_s:
        .string "Hello World"                   # String a ser escrita
        
#===============================================================================================
#					completa com 0 o binario
#===============================================================================================
        .fill 510 - (. - _start), 1, 0          # completa com 0 o binario


#===============================================================================================
#					   assinatura do boot
#===============================================================================================

        .word 0xaa55	                        # assinatura de boot
