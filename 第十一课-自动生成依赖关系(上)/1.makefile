OBJS := func.o main.o

hello.out : $(OBJS)
	@gcc -o $@ $^
	@echo "Target File ==> $@"

$(OBJS) : %.o : %.c 
	@gcc -o $@ -c $^
