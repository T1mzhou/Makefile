
CC := gcc
TARGET := hello.out
OBJS := func.o main.o const.o 

$(TARGET) : $(OBJS)
	$(CC) -o $@ $^

$(OBJS): %.o : %.c
	$(CC) -o $@ -c $^

.PHONY : rebuild clean all

rebuild : clean all

all : $(TARGET)

clean : 
	rm *.o $(TARGET)
