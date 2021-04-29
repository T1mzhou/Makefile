.PHONY : all

all :
	@echo "command-1"

all : 
	@echo "command-2"

VAR := test

all :
	@echo "all : $(VAR)"

include 1.mk
