all: hw-s.bin

hw-s.bin : hw.S
	as --32 $< -o hw.o
	ld -melf_i386 --oformat=binary -Ttext=0x7c00 hw.o -o $@

run : hw-s.bin
	qemu-system-x86_64 -drive format=raw,file=$<

.PHONY: clean

clean:
	rm -rf *.bin *.o *.s hex2bin