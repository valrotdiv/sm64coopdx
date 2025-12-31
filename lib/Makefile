# Fix build dir directory
BUILD_DIR := ../$(BUILD_DIR)

.PHONY: $(MAKE_LIBS)

all: $(MAKE_LIBS)

include $(foreach lib, $(MAKE_LIBS), $(lib)/config.mk)
