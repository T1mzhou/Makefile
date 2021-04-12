.PHONY : all

-include test.txt

all : 
	@echo "$@ : $^"
	
test.txt : b.txt
	@echo "creating $@ ..."
	@echo "all : c.txt" > test.txt
