
CC := gcc
TARGET := hello.out

$(TARGET) : main.o func.o
	$(CC) -o $@ $^

main.o: main.c
	$(CC) -o $@ -c $^
func.o: func.c
	$(CC) -o $@ -c $^

.PHONY : rebuild clean all

rebuild : clean all

all : $(TARGET)

clean : 
	$(RM) *.o $(TARGET)
