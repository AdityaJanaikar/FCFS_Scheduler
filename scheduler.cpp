#include "scheduler.h"

#define MAX_TASKS 8
static Task taskQueue[MAX_TASKS];
static int head = 0, tail = 0;

void scheduler::init() {
    head = 0;
    tail = 0;
}

void scheduler::enqueue(Task task) {
    if (tail < MAX_TASKS) {
        taskQueue[tail++] = task;
    }
}

void scheduler::run() {
    while (head < tail) {
        Task t = taskQueue[head++];
        if (t) t();
    }
}

// UART output to QEMU terminal
void scheduler::uart_print(const char* msg) {
    volatile unsigned int* UART0DR = (unsigned int*)0x4000C000;
    while (*msg) {
        *UART0DR = (unsigned int)(*msg);
        msg++;
    }
}
