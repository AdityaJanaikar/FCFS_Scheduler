// process.cpp
#include "process.h"
#include "uart.h"
#include "delay.h"

void dummy_task1() {
    uart_println("Task1 running...");
    delay_ms(500); // Simulate work
}

void dummy_task2() {
    uart_println("Task2 running...");
    delay_ms(300);
}