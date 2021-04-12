.PHONY : all

-include test.txt

all :
	@echo "this is all"

test.txt :
	@echo "creating $@...."
	@echo "other : ; @echo "this is other" " > test.txt
