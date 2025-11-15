#include "delay.h"

void delay_ms(uint32_t ms)
{
    // Very crude busy-wait loop (QEMU-friendly)
    volatile uint32_t count = ms * 4000;  
    while (count--)
        __asm__ volatile ("nop");
}
