@count_run(int arr[100]), takes input array and counts the number of runs in the array
@ a run is when there exists a sequence of dice rolls with the same value, ie: 3,3,3,5,6,1
@in that case above, 3 was the value of the run, the run length was 3 long, and the total number of runs is 1 because it only occurred once
@@@@@@@@@@@@@@@@@@

.cpu cortex-a72
.fpu neon-fp-armv8

.data
runout: .asciz "Run %d: "
outputint: .asciz "%d \n\n"
totalout: .asciz "Total Runs: %d \n"


.text
.align 2
.global count_run
.type count_run, %function

count_run:

push {fp,lr}
add fp,sp,#4	@r0 contains current array[100] address

mov r10,#1	@i=1 for loop count
mov r4,#1	@l = 1 by default
mov r6,#0	@occurences =0, counts number of runs

start_countloop:
cmp r10,#100		@begin loop 
bge end_countloop	@end if i>=100

mov r5,#1	@set intial flag value to 1, flag=1

@get x[i] ,element @address is in r0,

ldr r0,[sp]		@r0 = address of first element
mov r1,r10,LSL#2	@calculate byte offset corresponding to r10, first loop(r1 =address x)
ldr r1,[sp,r1]				@r1 = x[i]
					
@get x[i-1]
sub r10,r10,#1		@i=i-1
mov r3,r10,LSL#2	@r3 = x[i-1]
ldr r3,[sp,r3]
add r10,r10,#1		@back to i


cmp r1,r3		@if x[i]=x[i-1] branch to second condition
beq start_check1

add r10,r10,#1		@if above condition not true, i++
b start_countloop


start_check1:
add r4,r4,#1		@increment l++

@r1 is x[i], so get x[i+1]

add r10,r10,#1		@i=i+1
mov r3,r10,LSL#2	@r3 = x[i+1]
ldr r3,[sp,r3]
sub r10,r10,#1		@back to i

cmp r3,r1		@check if x[i+1] = x[i]
bne start_check2	@if they are not equal set flag to 0 and continue
b start_check3		@jump to check3

start_check2:
mov r5,#0	@flag =0

start_check3:	@this is a compound check, so check length and then flag
cmp r4,#1
bgt start_check4	@if l is greater than 1, jump to next check
add r10,r10,#1		@else i++
b start_countloop	@reloop


start_check4:
cmp r5,#0		@if flag = 0, increment total occurrences and print run info
beq start_printrun	@jump to printrun
add r10,r10,#1		@i++
b start_countloop	@reloop

start_printrun:		@count occurrence and print current run info
add r6,r6,#1

ldr r0,=runout
mov r1, r6		@print current run num
bl printf

ldr r0,=outputint	@print current run length
mov r1,r4
bl printf
mov r4,#1	@reset l to 1

mov r5,#1		@return flag to 1

add r10,r10,#1		@i++
b start_countloop	
end_countloop:		@end loop

ldr r0,=totalout	@print total runs
mov r1,r6
bl printf

sub sp,fp,#4
pop {fp,pc}

