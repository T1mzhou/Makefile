.PHONY : test

define func1
	@echo "My name is $(0)"
endef

define func2
	@echo "My name is $(0)"
	@echo "Param 1 => $(1)"
	@echo "Param 2 => $(2)"
endef

var := $(call func1)
new := $(func1)

test :
	@echo "new => $(new)"
	@echo "var => $(var)"
	$(call  func1)	
	$(call func2, T1mzhou, makefile)
