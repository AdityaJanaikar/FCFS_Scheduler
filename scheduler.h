#pragma once

typedef void (*Task)();

namespace scheduler {
    void init();
    void enqueue(Task task);
    void run();
    void uart_print(const char* msg);
}
