COOPNET_DIR ?= $(BUILD_DIR)/lib/coopnet
OSX_ARM :=
ifeq ($(OSX_BUILD),1)
  ifeq ($(shell uname -m),arm64)
  	OSX_ARM := 1
  endif
endif

coopnet: juice
	@echo "===== Building Coopnet ====="
	$(call git-clone,https://github.com/coop-deluxe/coopnet.git,$(COOPNET_DIR))
# Fix macos deprecated function sprintf (added -Wno-deprecated-declarations flag)
	$(call replace-all,CXXFLAGS =,CXXFLAGS = -Wno-deprecated-declarations,$(COOPNET_DIR)/Makefile)
	@$(MAKE) -C $(COOPNET_DIR) \
	  OSX_BUILD="$(OSX_BUILD)" \
	  OSX_ARM="$(OSX_ARM)"
ifeq ($(MAKE_SHARED_LIBS),1)
	@cp $(COOPNET_DIR)/bin/libcoopnet$(SH_EXT) $(BUILD_DIR)/$(LIB_PREFIX)coopnet$(SH_EXT)
else
	@cp $(COOPNET_DIR)/bin/libcoopnet.a $(BUILD_DIR)/lib/$(LIB_PREFIX)coopnet$(ST_EXT)
endif
