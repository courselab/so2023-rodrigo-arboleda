OUTPUT_FORMAT(binary)
SECTIONS
{
    . = __boot_address;
    .boot :
        {
            *(.text)
            *(.rodata)
        }

    . = __boot_address + 510;
    .signature :  
        {
            BYTE(0x55)
            BYTE(0xAA)
        }
    
    __END_STACK__ = 0x8200;
    __boot_address = 0x7c00;
}
STARTUP(hw-rt0.o);
ENTRY(_start);
INPUT(hw-print.o);