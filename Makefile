CC=arm-none-eabi-g++
AS=arm-none-eabi-as
LD=arm-none-eabi-ld
CFLAGS=-mcpu=cortex-m3 -mthumb -nostdlib -Os -ffreestanding

OBJS = main.o scheduler.o startup.o

all: hello.elf

hello.elf: $(OBJS)
	arm-none-eabi-ld -T linker.ld $(OBJS) -o hello.elf

main.o: main.cpp
	arm-none-eabi-g++ -mcpu=cortex-m3 -mthumb -nostdlib -Os -ffreestanding -c main.cpp -o main.o

scheduler.o: scheduler.cpp
	arm-none-eabi-g++ -mcpu=cortex-m3 -mthumb -nostdlib -Os -ffreestanding -c scheduler.cpp -o scheduler.o

startup.o: startup.s
	arm-none-eabi-as -mcpu=cortex-m3 -mthumb startup.s -o startup.o

clean:
	rm -f *.o *.elf