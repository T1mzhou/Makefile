
CC := gcc
TARGET := hello.out

$(TARGET) : main.o func.o
	$(CC) -o $(TARGET) main.o func.o

main.o: main.c
	$(CC) -o main.o -c main.c
func.o: func.c
	$(CC) -o func.o -c func.c

.PHONY : rebuild clean all

rebuild : clean all
all : $(TARGET)
clean : 
	rm *.o $(TARGET)
