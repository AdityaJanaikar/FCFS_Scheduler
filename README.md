# **FCFS Task Scheduler on ARM Cortex-M3 (LM3S6965EVB)**

A minimal bare-metal firmware project for the **ARM Cortex-M3**
(Stellaris LM3S6965EVB) running on **QEMU**, featuring:

-   A simple **First-Come, First-Serve (FCFS)** task scheduler in C++
-   Fully custom **startup code**, **vector table**, and **linker
    script**
-   Minimal **UART driver** for printing over QEMU's virtual UART
-   Zero dependencies on CMSIS or vendor libraries
-   A lightweight build system using **Make**

This project is for learning bare-metal development: how booting works,
how memory is laid out, and how basic multitasking can be implemented.

------------------------------------------------------------------------

## **Features**

-   ✔ Bare-metal C++ (no standard library)
-   ✔ Custom startup code (Reset handler, BSS clearing)
-   ✔ Completely manual memory layout with linker script
-   ✔ UART print and println utilities
-   ✔ Simple delay loop
-   ✔ FCFS Scheduler with 3 example tasks
-   ✔ Runs on **QEMU** (no hardware needed)
-   ✔ Produces a raw `.bin` file executed at address `0x00000000`

------------------------------------------------------------------------

## **Directory Structure**

    .
    ├── startup.s         # Reset handler + vector table
    ├── linker.ld         # Memory layout for LM3S6965EVB
    ├── main.cpp          # Firmware entrypoint
    ├── uart.cpp/.h       # UART driver
    ├── scheduler.cpp/.h  # FCFS scheduler
    ├── process.cpp/.h    # Example tasks
    ├── delay.cpp/.h      # Crude delay loop
    ├── unwind_stubs.cpp  # Avoids missing C++ runtime symbols
    ├── Makefile          # Build system
    └── README.md

------------------------------------------------------------------------

## **Build Instructions**

### **1. Install ARM GCC Toolchain**

``` sh
sudo apt install gcc-arm-none-eabi
```

------------------------------------------------------------------------

### **2. Build the firmware**

``` sh
make
```

Outputs:

-   **hello.elf** --- ELF file
-   **hello.bin** --- Binary image

------------------------------------------------------------------------

## **Running on QEMU**

``` sh
qemu-system-arm \
    -M lm3s6965evb \
    -kernel hello.bin \
    -serial mon:stdio \
    -nographic
```

Expected output:

    UART initialized
    Task 1 running
    Task 2 running
    Task 3 running

------------------------------------------------------------------------

## **How It Works**

### **1. Boot Process**

-   Vector table loads at 0x00000000
-   Reset handler clears `.bss`
-   Calls `main()`

### **2. main.cpp**

Initializes hardware and runs FCFS scheduler.

### **3. Scheduler**

Simple non‑preemptive FCFS:\
Runs tasks in the order they were added.

------------------------------------------------------------------------

## **Known Limitations**

-   No interrupts\
-   No real context switching\
-   UART is blocking\
-   Purely educational

------------------------------------------------------------------------

## **Planned Improvements**

-   Add SysTick + preemption\
-   Per‑task stack\
-   Priority scheduling

------------------------------------------------------------------------