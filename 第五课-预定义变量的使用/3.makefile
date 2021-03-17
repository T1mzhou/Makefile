.PYTHONY : all first second third test

all out : first second third
	@echo "$(MAKE)"
	@echo "$(MAKECMDGOALS)"
	@echo "$(MAKEFILE_LIST)"
first :
	@echo "first"
second :
	@echo "second"
third :
	@echo "third"

test :
	@$(MAKE) first
	@$(MAKE) second
	@$(MAKE) third
