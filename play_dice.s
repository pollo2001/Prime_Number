@makefile to run program

mymod: main.o count_run.o roll_dice.o mod.o
	gcc -o mymod main.o count_run.o roll_dice.o

main.o: main.s
	gcc -c main.s

count_run.o: count_run.s
	gcc -c count_run.s

roll_dice.o: roll_dice.s
	gcc -c roll_dice.s

mod.o: mod.s
	gcc -c mod.s

clean:
	rm *.o
