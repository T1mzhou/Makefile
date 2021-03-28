MAKEFILE_HOME := makefile home
export var := Software
new := T1mzhou
test :
	@echo "MAKEFILE_HOME => $(MAKEFILE_HOME)"
	@echo "make anohter file. .."
	@$(MAKE) -f makefile.2
	@$(MAKE) -f makefile.2 new:=$(new)
