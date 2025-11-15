// process.h
#pragma once

struct Process {
    const char* name;
    int burst_time; // Simulated execution time in ms
    void (*run)();  // Function pointer
};