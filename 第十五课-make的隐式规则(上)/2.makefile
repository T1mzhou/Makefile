SRCS := $(wildcard *.c)
OBJS := $(SRCS:.c=.o)


app.out : $(OBJS)
	$(CC) -o $@ $^
	$(RM) $^
	@echo "Target ==> $@"

