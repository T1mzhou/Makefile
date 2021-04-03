OBJS := func.o main.o

hello.out : $(OBJS)
	@gcc -o $@ $^
	@echo "Target File ==> $@"

$(OBJS) : %.o : %.c func.h
	@gcc -o $@ -c $<
