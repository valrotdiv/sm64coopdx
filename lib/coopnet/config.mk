COOPNET_DIR:=$(BUILD_DIR)/lib/coopnet
ifeq ($(shell uname -m),arm64)
OSX_ARM := 1
else
OSX_ARM :=
endif

coopnet: juice
	@echo "===== Building Coopnet ====="
	$(call git-clone,https://github.com/coop-deluxe/coopnet.git,$(COOPNET_DIR))
	@$(MAKE) -C $(COOPNET_DIR) \
	  OSX_BUILD="$(OSX_BUILD)" \
	  OSX_ARM="$(OSX_ARM)" \
	  CXXFLAGS="-Wall -Werror -Wno-unused-function -Wno-deprecated-declarations -std=c++11 -fPIC -DJUICE_STATIC -g"
ifeq ($(MAKE_SHARED_LIBS),1)
	@cp $(COOPNET_DIR)/bin/libcoopnet.so $(BUILD_DIR)/$(LIB_PREFIX)coopnet$(SH_EXT)
else
	@cp $(COOPNET_DIR)/bin/libcoopnet.a $(BUILD_DIR)/lib/$(LIB_PREFIX)coopnet$(ST_EXT)
endif
