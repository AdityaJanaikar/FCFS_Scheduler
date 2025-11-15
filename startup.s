    .syntax unified
    .cpu cortex-m3
    .thumb

    .global Reset_Handler

    /* Vector table */
    .section .isr_vector, "a", %progbits
    .align 2
    .global __isr_vector
    __isr_vector:
        .word 0x20010000        /* Initial SP (64K SRAM top) */
        .word Reset_Handler     /* Reset handler */

    /* Reset Handler */
    .text
    .thumb_func
Reset_Handler:
    /* Copy .data section from flash (LMA) to RAM (VMA) */
    ldr   r0, =_sdata      /* dest */
    ldr   r1, =_edata
    ldr   r2, =_sidata     /* src in flash */

copy_data:
    cmp   r0, r1
    bcs   init_bss         /* if dest >= end, skip copy */
    ldr   r3, [r2], #4
    str   r3, [r0], #4
    b     copy_data

init_bss:
    /* Zero .bss */
    ldr   r0, =_sbss
    ldr   r1, =_ebss
    movs  r2, #0

zero_bss:
    cmp   r0, r1
    bcs   call_main        /* if start >= end, done */
    str   r2, [r0], #4
    b     zero_bss

call_main:
    bl    main
hang:
    b    hang
