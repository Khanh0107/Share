/*
 * Linker script cho Cortex-R5F #0 tren ZynqMP (KV260), chay hoan toan trong TCM.
 *
 * Ban do bo nho nhin tu R5 #0 (dia chi local cua core):
 *   ATCM 0x0000_0000 - 64KB : vector + code + rodata + ban goc cua .data (LMA)
 *   BTCM 0x0002_0000 - 64KB : .data (VMA) + .bss + stack
 * (Dia chi global tuong ung: ATCM 0xFFE0_0000, BTCM 0xFFE2_0000.)
 */

ENTRY(_vectors)

FIQ_STACK_SIZE = 0x400;
IRQ_STACK_SIZE = 0x400;
ABT_STACK_SIZE = 0x400;
UND_STACK_SIZE = 0x400;
SVC_STACK_SIZE = 0x400;
SYS_STACK_SIZE = 0x2000;    /* stack chinh: main() chay o mode SYS */

MEMORY
{
    ATCM (rx)  : ORIGIN = 0x00000000, LENGTH = 64K
    BTCM (rwx) : ORIGIN = 0x00020000, LENGTH = 64K
}

SECTIONS
{
    /* Bang vector phai nam o dia chi 0 (SCTLR.V = 0 -> low vectors) */
    /* Moi section deu ALIGN(8) o cuoi: TCM co ECC 64-bit, ghi thieu 8 byte
       vao o nho chua khoi tao se loi (dow bao "Memory write error"). */
    .vectors : {
        KEEP(*(.vectors))
        . = ALIGN(8);
    } > ATCM

    .text : ALIGN(8) {
        *(.text .text.*)
        . = ALIGN(8);
    } > ATCM

    .rodata : ALIGN(8) {
        *(.rodata .rodata.*)
        . = ALIGN(8);
    } > ATCM

    /* .data: chay o BTCM (VMA) nhung duoc nap vao ATCM (LMA);
       startup.S copy tu __data_load sang __data_start. */
    .data : ALIGN(8) {
        __data_start = .;
        *(.data .data.*)
        . = ALIGN(8);
        __data_end = .;
    } > BTCM AT > ATCM
    __data_load = LOADADDR(.data);

    .bss (NOLOAD) : ALIGN(8) {
        __bss_start = .;
        *(.bss .bss.*)
        *(COMMON)
        . = ALIGN(8);
        __bss_end = .;
    } > BTCM

    /* Moi mode cua CPU co stack rieng; stack tang xuong nen lay dia chi dinh */
    .stack (NOLOAD) : ALIGN(8) {
        . += FIQ_STACK_SIZE; __fiq_stack_top = .;
        . += IRQ_STACK_SIZE; __irq_stack_top = .;
        . += ABT_STACK_SIZE; __abt_stack_top = .;
        . += UND_STACK_SIZE; __und_stack_top = .;
        . += SVC_STACK_SIZE; __svc_stack_top = .;
        . += SYS_STACK_SIZE; __sys_stack_top = .;
    } > BTCM

    __btcm_start = ORIGIN(BTCM);
    __btcm_end   = ORIGIN(BTCM) + LENGTH(BTCM);

    /DISCARD/ : {
        *(.ARM.exidx*)
        *(.ARM.extab*)
        *(.comment)
        *(.note.gnu.build-id)
    }
}
