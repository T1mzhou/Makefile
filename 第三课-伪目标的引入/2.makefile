hello.out all : main.o func.o
	gcc -o hello.out main.o func.o
main.o: main.c
	gcc -o main.o -c main.c
func.o: func.c
	gcc -o func.o -c func.c

.PHONY: rebuild clean all

rebuild : clean all

all : hello.out
clean:
	rm *.o hello.out
