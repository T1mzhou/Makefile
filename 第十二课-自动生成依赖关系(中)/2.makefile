.PHONY : all

include test.txt

all:
	@echo "this is all"

test.txt :
	@echo "this is test.txt"
	@touch test.txt
