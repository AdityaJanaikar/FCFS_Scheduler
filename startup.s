.syntax unified
.cpu cortex-m3
.thumb

.section .isr_vector, "a", %progbits
.word _estack
.word Reset_Handler

.text
.thumb_func
.global Reset_Handler
Reset_Handler:
    ldr r0, =_sidata
    ldr r1, =_sdata
    ldr r2, =_edata
1:
    cmp r1, r2
    ittt lt
    ldrlt r3, [r0], #4
    strlt r3, [r1], #4
    blt 1b

    ldr r0, =_sbss
    ldr r1, =_ebss
    movs r2, #0
2:
    cmp r0, r1
    itt lt
    strlt r2, [r0], #4
    addlt r0, r0, #4
    blt 2b

    bl main
    b .