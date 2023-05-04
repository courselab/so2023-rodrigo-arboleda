all: hw-hex.bin

hw-hex.bin : hw.hex hex2bin
	hex2bin $< $@

hex2bin : hex2bin.c
	gcc $< -o $@

run : hw-hex.bin
	qemu-system-x86_64 -drive format=raw,file=$<

.PHONY: clean

clean:
	rm -rf *.bin *.o *.s hex2bin