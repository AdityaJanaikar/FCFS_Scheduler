#include "scheduler.h"

void task1() {
    scheduler::uart_print("Task 1 running\n");
}

void task2() {
    scheduler::uart_print("Task 2 running\n");
}

void task3() {
    scheduler::uart_print("Task 3 running\n");
}

extern "C" int main() {
    scheduler::init();
    scheduler::enqueue(task1);
    scheduler::enqueue(task3);
    scheduler::enqueue(task2);
    scheduler::run();
    while (1);
}
