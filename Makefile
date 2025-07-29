CC=arm-none-eabi-g++
AS=arm-none-eabi-as
LD=arm-none-eabi-ld
CFLAGS=-mcpu=cortex-m3 -mthumb -nostdlib -Os -ffreestanding

all: hello.elf

hello.elf: main.o startup.o
	$(LD) -T linker.ld $^ -o $@

main.o: main.cpp
	$(CC) $(CFLAGS) -c $< -o $@

startup.o: startup.s
	$(AS) -mcpu=cortex-m3 -mthumb $< -o $@

clean:
	rm -f *.o *.elf

run: hello.elf
	qemu-system-arm -M lm3s6965evb -nographic -kernel hello.elf