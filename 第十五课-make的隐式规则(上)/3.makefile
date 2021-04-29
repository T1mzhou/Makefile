SRCS := $(wildcard *.c)
OBJS := $(SRCS:.c=.o)

CC := gcc

#all :
#	@echo "$(.VARIABLES)"

app.out : $(OBJS)
	$(CC) -o $@ $^
	$(RM) $^
	@echo "Target ==> $@"

#%.o : %.c
#	@echo "my rule"
#	$(cc) -c -o $@ $^
