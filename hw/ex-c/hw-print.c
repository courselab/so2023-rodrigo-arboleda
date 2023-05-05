void __attribute__((fastcall, naked)) print_char(const char c)
{
    __asm__("push %ax"); /* salva o registrador ax */
	__asm__("push %bx"); /* salva o registrador bx */

    __asm__("movw %cx, %ax");    /* carrega o endereco do char */
	__asm__("movb $0xe, %ah");  /* carrega 0xe em ah (modo de escrita na tela) */
	__asm__("int $0x10");   /* realiza uma interrupcao a BIOS */
    
    __asm__("pop %bx"); /* recupera o registrador bx */
	__asm__("pop %ax"); /* recupera o registrador ax */

	__asm__("ret"); /* retorna funcao */
}

int __attribute__((fastcall, naked)) printhw(const char* s)
{
    int count_s = 0;
    char char_p = s[count_s];

    while (char_p != 0)
    {
        print_char(char_p);
        count_s++;
        char_p = s[count_s];
    }

    return count_s;

}