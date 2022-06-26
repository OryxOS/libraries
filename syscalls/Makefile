.PHONY: clean

SOURCEDIR := ./

# Software
DC   = ldc2
LD   = ld.lld

# Flags
DFLAGS  := -mtriple=amd64-unknown-elf -relocation-model=static \
           -code-model=kernel -mattr=-sse,-sse2,-sse3,-ssse3 -disable-red-zone \
           -betterC -op -O

# Source to compile.
DSOURCE   := $(shell find $(SOURCEDIR) -type f -name '*.d')
OBJ       := $(DSOURCE:.d=.o)

all: $(OBJ)

%.o: %.d
	@$(DC) $(DFLAGS) -I=$(SOURCEDIR) -c $< -of=$@

clean:
	rm -rf $(OBJ) $(OUTPUT)