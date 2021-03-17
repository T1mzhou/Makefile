.PYTHONY : all first second third

all : first second third
	@echo "\$$@ => $@"
	@echo "$$^ => $^"
	@echo "$$< => $<"
first :
second :
third :
