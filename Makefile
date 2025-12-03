$(x86_64_asm_source_files) := $(shell find src/x86_64/boot -name *.asm)
$(x86_64_asm_object_files) := $(patsubst src/x86_64/%.asm, build/x86_64/%.o, $(x86_64_asm_source_files))

$(x86_64_asm_object_files) : build/x86_64/%.o : src/x86_64/%.asm
	mkdir $(dir $@) && \
	nasm -f elf64 $(patsubst build/x86_64/%.o, src/x86_64/%.asm, $@) -o $@

.PHONY build-x86_64
build-x86_64: $(x86_64_asm_source_files)
	mkdir -p dist/x86_64 && \
	x86_64-elf-ld -n -o dist/x86_64/kernel.bin -T targets/x86_64/linker.ld $(x86_64_asm_object_files)
	cp dist/x86_64/kernel.bin targets/x86_64/iso/boot/kernel.bin && \
	grub-mkrescue /usr/lib/grub/i386-pc -o dist/x86_64/kernel.iso targets/x86_64/iso

run:
	make build && docker run --rm -it -v $pwd:/root/env container
build: 
	docker build build-env -t container