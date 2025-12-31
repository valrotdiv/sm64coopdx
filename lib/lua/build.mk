# Makefile seems to have problems with paths when compiling .c files for Lua
# this file changes the *.c parameter to a pattern rule.

# Root file has been set to lua source code directory
include makefile

%.o: %.c
	@$(CC) $(CFLAGS) -c $< -o $@
