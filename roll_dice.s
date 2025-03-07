@function to generate 100 dice rolls and store values 1-6 in the array
@roll_dice(array) return array(init)


.cpu cortex-a72
.fpu neon-fp-armv8

.data
output: .asciz "%d\n"

.text
.align 2
.global roll_dice
.type roll_dice, %function


roll_dice:

push {fp, lr}
add fp, sp, #4

mov r4,r0	@save address of 100 num array

mov r10,#0 	@for loop from 0 to 99, r10=i
mov r5,#100	@r5=100, so that loop stops when r10 =100

start_roll:	@loop conditions:
cmp r10,r5	@check if r10 >= r5
bge end_roll	@end when i(r10) reaches 100 increments
bl rand		@random big num into r0

mov r1,#6	@r1 = 6 
bl mod		@call mod function to see if random int in r1 is between 1 and 6
		
add r0,r0,#1		@random int is now in r0
			@array[r10] = r0
mov r1,r10,LSL#2	
str r0,[r4,r1]	
mov r9,r0	@arbitrary register to print r0

ldr r0,=output
mov r1,r9
bl printf

add r10,r10,#1		@increment r10 by 1, i++

b start_roll
end_roll:

sub sp,fp, #4
pop {fp,pc}
