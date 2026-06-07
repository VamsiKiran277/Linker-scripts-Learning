#Top of the ram space is 0x20000000 and size if 64k which is 0x10000 so end of the RAM space is 0x20010000
_estack = ORIGIN(RAM) + LENGTH(RAM)

MEMORY
{
    #Defining Memory and Ram length and their base adderss   
    FLASH (rw) : ORIGIN = 0x08000000 , LENGTH = 256K  
    RAM (xrw) : ORIGIN = 0x20000000, LENGTH = 64K
}

SECTIONS 
{
    #we are bascially telling put this isr vector in to the FLASH region
    .isr_vector:
    {
        *(.isr_vector)
    } > FLASH

    #placing the .txt in the Flash
    .txt:
    {
        *(.txt)
    } > FLASH
    #initialized variables are stored in flash but in MCU we may have to change their values quickly during startup thats why we move it to RAM
    #>RAM AT> FLASH tells the linker about this dual location for the .data section.
    .data:
    {
        *(.data)
    } > RAM AT > FLASH

    #unitialized data is stored in the RAM
    .bss:
    {
        *(.bss)
    } > RAM
}
