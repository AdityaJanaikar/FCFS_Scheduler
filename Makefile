CC      = arm-none-eabi-g++
AS      = arm-none-eabi-as
LD      = arm-none-eabi-g++

CFLAGS  = -mcpu=cortex-m3 -mthumb -Os -ffreestanding -nostdlib \
          -fno-exceptions -fno-rtti -fno-unwind-tables -fno-asynchronous-unwind-tables \
          -fomit-frame-pointer

LDFLAGS = -mcpu=cortex-m3 -mthumb -nostdlib -Wl,--gc-sections \
          -T linker.ld

OBJS = startup.o \
       main.o \
       scheduler.o \
       uart.o \
       process.o \
       delay.o \
       unwind_stubs.o

all: hello.elf

hello.elf: $(OBJS)
	$(LD) $(OBJS) $(LDFLAGS) -o $@

# Compilation rules
main.o: main.cpp
	$(CC) $(CFLAGS) -c main.cpp -o $@

scheduler.o: scheduler.cpp
	$(CC) $(CFLAGS) -c scheduler.cpp -o $@

uart.o: uart.cpp
	$(CC) $(CFLAGS) -c uart.cpp -o $@

process.o: process.cpp
	$(CC) $(CFLAGS) -c process.cpp -o $@

delay.o: delay.cpp
	$(CC) $(CFLAGS) -c delay.cpp -o $@

unwind_stubs.o: unwind_stubs.cpp
	$(CC) $(CFLAGS) -c unwind_stubs.cpp -o $@

startup.o: startup.s
	$(AS) -mcpu=cortex-m3 -mthumb startup.s -o $@

clean:
	rm -f *.o *.elf
