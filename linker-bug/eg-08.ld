OUTPUT_FORMAT(binary)  /* Output flat binary (no structure) */
SECTIONS
{
  .boot : AT(__boot_start)
        {
            *(.text)
            *(.rodata)
        }

    .signature : AT(__boot_start + 510)    
        {
            BYTE(0x55)
            BYTE(0xAA)
        }
 __END_STACK__ = 0x8200;
 __boot_start = 0x7c00;
}
STARTUP(eg-08_rt0.o);
INPUT(eg-08_utils.o)