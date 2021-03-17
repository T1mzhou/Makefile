.PYTHONY : test1 test2

T1mzhou := tim zhou

test1:
	@echo "$(MAKE_VERSION)"
	@echo "$(CURDIR)"
	@echo "$(.VARIABLES)"
test2: 
	@echo "$(RM)"
