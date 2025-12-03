# The actual entrypoint of the OS
global start

start:
    mov dword [0xb8000], 0x2F4B2F4F # Prints "OK"
    hlt # Tells the CPU to calm down and take a breather