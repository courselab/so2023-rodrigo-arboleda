void __attribute__((naked)) _start()
{
    __asm__("mov  $__END_STACK__ , %sp");
    __asm__("call main");
    __asm__("halt:");
    __asm__("hlt");
    __asm__("jmp halt");
}