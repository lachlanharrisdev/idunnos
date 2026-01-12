# How does a computer start?

1. BIOS is copied from a ROM chip into RAM
2. BIOS starts executing code
  - initializes hardware
  - runs some tests (POST = power-on self test)
3. BIOS searches for an operating system to start*
4. BIOS loads and starts the operating system
5. Operating system runs

## How does the BIOS find an OS?

### Legacy boot

- BIOS loads first sector of each bootable device into memory (at location 0x7c00)
- BIOS checks for 0xAA55 signature
- If found, it starts executing code

### EFI

- BIOS looks into special EFI (extensible firmware interface) partitions
- Operating system must be compiled as an EFI program
