x := foo
y := $(x)b
x := new

.PHONY : test

test:
	@echo "x => $(x)"
	@echo "y => $(y)"
