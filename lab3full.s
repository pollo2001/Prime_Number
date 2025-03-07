
.cpu cortex-a72
.fpu neon-fp-armv8

                    @define data section
.data
prompt: .asciz "Enter two positive integers in format: (int1,int2) \n"  @prompt user for int a
input: .asciz "%d,%d"         @prompt for two int inputs
output1: .asciz "Prime numbers between %d and "
output2: .asciz "%d are:\n"
outputnums: .asciz " %d \n"

                @define text section
.text
.align 2
.global main
.type main,%function

                @main
main:

push {fp,lr}

ldr r0,=prompt        @ask for inputs
bl printf

ldr r0,=input        @arrange pointer for first int, then second int
sub sp,sp,#4           @ points to first %d address
mov r1,sp               @ r1 = first %d

sub sp,sp,#4
mov r2,sp               @r2 = second %d
bl scanf

ldr r5,[sp,#4]        @user integer: n1 is in r5
ldr r6,[sp]        @user integer : n2 is r6

ldr r0,=output1        @print output1
mov r1,r5
bl printf

ldr r0,=output2        @print output2
mov r1,r6
bl printf

add r10,r5,#1        @set loop initial i at, i=n1+1

forloop:
cmp r10,r6        @check if i<n2
bge end_forloop        @if greater than or equal, end loop

checkprime:             @ i = n
mov r4,#1         @defaul flag = 1
mov r9,#2          @ int j=2
udiv r7,r10,r9    @ n/2
cmp r9,r7        @compare j to n/2
bgt end_checkprime    @if j <= n/2 , break

primeloop:            @create modulo function for remainder algorithm
udiv r5,r10,r9    @division for quotient, r8=n/j
mul r8,r5,r9           @to compute remainder
sub r5,r10,r8        @this is remainder, in r8

cmp r5,#0            @if n%j == 0
beq end_primeloop  @end and jump to end_primeloop
mov r4,#1
b primeloop

end_primeloop:
mov r4,#0
add r9,r9,#1
b end_checkprime

end_checkprime:
cmp r4,#1
beq printer     @jump to printer
add r10,r10,#1
b forloop

printer:
ldr r0,=outputnums
mov r1,r10
bl printf

add r10,r10,#1
b forloop
end_forloop:

pop {fp,pc}

bx lr
