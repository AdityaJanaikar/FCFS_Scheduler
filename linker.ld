ENTRY(Reset_Handler)

MEMORY
{
    FLASH (rx)  : ORIGIN = 0x00000000, LENGTH = 256K
    SRAM  (rwx) : ORIGIN = 0x20000000, LENGTH = 64K
}

SECTIONS
{
    /* VECTOR TABLE FIRST */
    .isr_vector :
    {
        KEEP(*(.isr_vector))
    } > FLASH

    /* Program code */
    .text :
    {
        *(.text*)
        *(.rodata*)
    } > FLASH

    /* Initialized data */
    .data : AT(ADDR(.text) + SIZEOF(.text))
    {
        _sidata = LOADADDR(.data);   /* <-- IMPORTANT */
        _sdata = .;
        *(.data*)
        _edata = .;
    } > SRAM

    /* Uninitialized data */
    .bss :
    {
        _sbss = .;
        *(.bss*)
        *(COMMON)
        _ebss = .;
    } > SRAM
}
