.cpu cortex-a72
.fpu neon-fp-armv8

					@define data section
.data
				@define text section
.text
.align 2
.global check_prime
.type check_prime,%function

			
check_prime:

push {fp,lr}

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

end_checkprime:
pop {fp,pc}
