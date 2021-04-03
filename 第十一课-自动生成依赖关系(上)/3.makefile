.PHONY : test a b c

test : a b 

test : b c

test :
	@echo "$^"
