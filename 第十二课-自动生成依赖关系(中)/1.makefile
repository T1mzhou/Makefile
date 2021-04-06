.PHONY : all

include test.txt

all :
	@echo "this is $@"

test.txt :
	@echo "test.txt"
	@echo "test.txt"
