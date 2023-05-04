all: hw-c.bin


hw-c.bin : hw.o hw-rt0.o hw-print.o 
	ld -melf_i386 -T hw.ld --orphan-handling=discard $< -o $@

hw-rt0.o : hw-rt0.s
	as --32 $< -o $@

hw-rt0.s : hw-rt0.c
	gcc -m16 -O0 -I. -Wall -fno-pic -fcf-protection=none  --freestanding -S $< -o $@

hw-print.o : hw-print.s
	as --32 $< -o $@

hw-print.s : hw-print.c
	gcc -m16 -O0 -I. -Wall -fno-pic -fcf-protection=none  --freestanding -S $< -o $@

hw.o : hw.s
	as --32 $< -o $@

hw.s : hw.c
	gcc -m16 -O0 -I. -Wall -fno-pic -fcf-protection=none  --freestanding -S $< -o $@

run: hw-c.bin
	qemu-system-x86_64 -drive format=raw,file=$<

.PHONY: clean

clean:
	rm -rf *.bin *.o *.s hex2bin