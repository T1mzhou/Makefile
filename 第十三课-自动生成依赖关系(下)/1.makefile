
.PHONY : all clean

MKDIR := mkdir
RM := rm -fr
CC := gcc

DIR_DEPS := deps

SRCS := $(wildcard *.c)
DEPS := $(SRCS:.c=.dep)
DEPS := $(addprefix $(DIR_DEPS)/, $(DEPS))

include $(DEPS)

all : 
	@echo "all"

$(DIR_DEPS) :
	$(MKDIR) $@

$(DIR_DEPS)/%.dep : $(DIR_DEPS) %.c
	@echo "Creating $@ ..."
	@set -e; \
	$(CC) -MM -E $(filter %.c, $^) | sed 's,\(.*\)\.o[ :]*,objs/\1.o : ,g' > $@
	
clean :
	$(RM) $(DIR_DEPS)
	