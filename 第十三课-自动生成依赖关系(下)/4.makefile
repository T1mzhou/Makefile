.PHONY : all

-include test.txt

all : 
	@echo "this is all"
	
test.txt : b.txt
	@echo "creating $@ ..."
	
