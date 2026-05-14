# Custom Linker Scripts for Embedded Systems

## Overview
This repository contains a collection of custom linker scripts (`.ld`) written from scratch. Each script is designed to map application code and data into memory based on specific hardware datasheets and board Specifications. 

## Projects Included

| Project | Flash Size | RAM Size | Description |
| :--- | :--- | :--- | :--- |
| **Basic ARM Cortex-M** | 256 KB | 64 KB | Standard layout moving `.data` to RAM and placing `.isr_vector` at the start of Flash. |

## Key Concepts Demonstrated
* **Memory Regions:** Defining exact physical memory boundaries using the `MEMORY` command.
* **Section Placement:** Mapping specific compiled sections (`.isr_vector`, `.text`, `.data`, `.bss`) to their correct hardware locations.
* **Runtime Initialization:** Using `> RAM AT > FLASH` to store initialized variables in non-volatile memory while ensuring they execute in faster RAM.
* **Stack Configuration:** Dynamically calculating the top of the stack (`_estack`) based on RAM size parameters.

## How to Use
To use any of these linker scripts in your build process with GCC, pass the script to the linker using the `-T` flag:

\`\`\`bash
arm-none-eabi-gcc -T Linker.ld main.c -o output.elf
\`\`\`
