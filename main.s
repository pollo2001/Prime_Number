@main function to call roll_dice, and print, then call count_run and print

.cpu cortex-a72
.fpu neon-fp-armv8

.data	@array in stack not static

.text
.align 2
.global main
.type main, %function


main:	@allocate stack memory for array

push {fp,lr}
add fp,sp,#4
		@seed srand
mov r0,#0
bl time		@sets r0 to current time, occurs once
bl srand	@seeds srand with r0 value 

		@allocate memory for 100 int array, so 100x4bytes= 400 bytes
mov r0,#100	@immediate should be under 255
mov r1,#4
mul r0,r0,r1		@100x4bytes = 400 bytes
sub sp,sp,r0		@stack pointer allocates 400 byte block of stack

str sp,[fp,#-8]		@*fp(fp-8)=sp, offset fp address, to point at array block

ldr r0,[fp,#-8]		@generate the roll_dice function , where r0 holds array[100]
bl roll_dice


@@@@print array

			@generate the count_run function, takes in roll_dices returned array[100] 
ldr r0,[fp,#-8]		@ r0 = *(fp-8), runs off r0 holding the altered array[100]
bl count_run

sub sp,fp,#4
pop {fp,pc}
bx lr
