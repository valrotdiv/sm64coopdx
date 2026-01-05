# Exported vars:
# BUILD_DIR
# OSX_BUILD
# WINDOWS_BUILD
# TARGET_N64
# TARGET_RPI
# TARGET_RK3588
# TARGET_ARCH
# TARGET_BITS
# CC
# CXX
# CFLAGS
# CPPFLAGS
# LDFLAGS

# Fix build dir directory
BUILD_DIR := ../$(BUILD_DIR)

.PHONY: $(MAKE_LIBS)

all: $(MAKE_LIBS)

define git-clone
	@if [ -d "$(2)" ]; then cd "$(2)" && git pull; else git clone $(1) "$(2)"; fi
endef
define replace-all
	@sed -i.bak 's/$(1)/$(2)/g' $(3)
endef

ST_EXT := .a
LIB_CFLAGS := -fPIC
ST_LDFLAGS :=
SH_LDFLAGS := -shared

ifeq ($(OSX_BUILD),1)
  LIB_PREFIX := lib
  SH_EXT := .dylib
else ifeq ($(WINDOWS_BUILD),1)
  LIB_PREFIX :=
  SH_EXT := .dll
else
  LIB_PREFIX := lib
  SH_EXT := .so
endif

include $(foreach lib, $(MAKE_LIBS), $(lib)/config.mk)
