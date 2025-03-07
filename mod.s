.cpu cortex-a72
.fpu neon-fp-armv8


.data


.text
.align 2
.global mod
.type mod, %function


mod:
    @ save lr and fp
    push {fp, lr}
    add fp, sp, #4

    @ r0 = a, r1 = b
    @ mod(a, b)

    udiv r2, r0, r1   @ r2 = floor(r0/r1)

    mul r2, r2, r1    @ r2 = r2 * r1

    sub r2, r0, r2    @ r2 = r0 - r2

    mov r0, r2        @ putting the result into r0 for return

    @ restore fp and lr

    sub sp, fp, #4
    pop {fp, lr}
    bx lr
