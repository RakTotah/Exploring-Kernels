section .multiboot2_header

header_start:
    dd 0xE85250D6 # Magic number specific to multiboot2

    dd 0 # Protected mode i386 to make the CPU use actual memory

    dd header_start - header_end # Header length (not sure why we need this yet)

    dd 0x100000000 - (0xE85250D6 + 0 + (header_start - header_end)) # Maybe to check valid memory size?

    # Conventional end tag
    dw 0
    dw 0
    dd 8
header_end:
