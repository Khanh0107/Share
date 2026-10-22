/*
 * startup.S - code khoi dong toi thieu cho Cortex-R5F (ARMv7-R) tren ZynqMP.
 *
 * Trinh tu:
 *   1. Bang vector o dia chi 0
 *   2. _reset: tat ngat, tat MPU/cache, chon low vectors
 *   3. Bat VFP (FPU)
 *   4. Xoa toan bo BTCM (tranh loi ECC khi doc o nho chua ghi)
 *   5. Dat stack cho tung mode CPU
 *   6. Copy .data tu ATCM sang BTCM (.bss da = 0 o buoc 4)
 *   7. Goi main()
 */

    .syntax unified
    .cpu    cortex-r5
    .fpu    vfpv3-d16
    .arm

/* Gia tri CPSR mode (kem bit I|F = 0xC0 de tat IRQ/FIQ) */
    .equ MODE_FIQ, 0x11
    .equ MODE_IRQ, 0x12
    .equ MODE_SVC, 0x13
    .equ MODE_ABT, 0x17
    .equ MODE_UND, 0x1B
    .equ MODE_SYS, 0x1F
    .equ IRQ_FIQ_DISABLE, 0xC0

/* SCTLR bits */
    .equ SCTLR_M, (1 << 0)      /* MPU enable */
    .equ SCTLR_C, (1 << 2)      /* D-cache enable */
    .equ SCTLR_I, (1 << 12)     /* I-cache enable */
    .equ SCTLR_V, (1 << 13)     /* high vectors (0xFFFF0000) */

/* ------------------------------------------------------------------ */
    .section .vectors, "ax"
    .global _vectors
_vectors:
    b   _reset              /* 0x00 Reset */
    b   undef_handler       /* 0x04 Undefined instruction */
    b   svc_handler         /* 0x08 Supervisor call */
    b   pabort_handler      /* 0x0C Prefetch abort */
    b   dabort_handler      /* 0x10 Data abort */
    nop                     /* 0x14 Reserved */
    b   irq_handler         /* 0x18 IRQ */
    b   fiq_handler         /* 0x1C FIQ */

/* ------------------------------------------------------------------ */
    .text
    .global _reset
    .type   _reset, %function
_reset:
    cpsid   if                      /* tat IRQ va FIQ */

    /* 2. Tat MPU, D-cache, I-cache; dung bang vector o dia chi 0 */
    mrc     p15, 0, r0, c1, c0, 0   /* doc SCTLR */
    bic     r0, r0, #(SCTLR_M | SCTLR_C)
    bic     r0, r0, #(SCTLR_I | SCTLR_V)
    dsb
    mcr     p15, 0, r0, c1, c0, 0   /* ghi SCTLR */
    isb
    mov     r0, #0
    mcr     p15, 0, r0, c15, c5, 0  /* invalidate toan bo D-cache (lenh rieng cua R5) */
    mcr     p15, 0, r0, c7, c5, 0   /* invalidate toan bo I-cache */
    dsb
    isb

    /* 3. Bat VFP: cho phep truy cap CP10/CP11 roi set FPEXC.EN */
    mrc     p15, 0, r0, c1, c0, 2   /* CPACR */
    orr     r0, r0, #(0xF << 20)
    mcr     p15, 0, r0, c1, c0, 2
    isb
    mov     r0, #0x40000000
    vmsr    fpexc, r0

    /* 4. Xoa BTCM bang lenh ghi 64-bit (TCM co ECC: phai ghi truoc khi doc) */
    ldr     r0, =__btcm_start
    ldr     r1, =__btcm_end
    mov     r2, #0
    mov     r3, #0
1:  strd    r2, r3, [r0], #8
    cmp     r0, r1
    blo     1b

    /* 5. Stack cho tung mode; cuoi cung o mode SYS de chay main() */
    cps     #MODE_FIQ
    ldr     sp, =__fiq_stack_top
    cps     #MODE_IRQ
    ldr     sp, =__irq_stack_top
    cps     #MODE_ABT
    ldr     sp, =__abt_stack_top
    cps     #MODE_UND
    ldr     sp, =__und_stack_top
    cps     #MODE_SVC
    ldr     sp, =__svc_stack_top
    cps     #MODE_SYS
    ldr     sp, =__sys_stack_top

    /* 6. Copy .data: ATCM (LMA) -> BTCM (VMA) */
    ldr     r0, =__data_load
    ldr     r1, =__data_start
    ldr     r2, =__data_end
2:  cmp     r1, r2
    ldrlo   r3, [r0], #4
    strlo   r3, [r1], #4
    blo     2b

    /* 7. Vao C */
    bl      main
3:  wfi                             /* main() khong nen return; neu co thi ngu */
    b       3b
    .size   _reset, . - _reset

/* ------------------------------------------------------------------ */
/* Handler mac dinh: dung tai cho de debugger thay (bt / rrd pc).
   Khai bao weak de co the viet lai trong C. */
    .weak undef_handler, svc_handler, pabort_handler, dabort_handler
    .weak irq_handler, fiq_handler
    .set  undef_handler,  default_handler
    .set  svc_handler,    default_handler
    .set  pabort_handler, default_handler
    .set  dabort_handler, default_handler
    .set  irq_handler,    default_handler
    .set  fiq_handler,    default_handler

    .type default_handler, %function
default_handler:
    b       default_handler
    .size   default_handler, . - default_handler
