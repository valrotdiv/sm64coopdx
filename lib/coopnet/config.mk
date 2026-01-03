COOPNET_DIR:=$(BUILD_DIR)/lib/coopnet

coopnet: juice
	@echo "===== Building Coopnet ====="
	$(call git-clone,https://github.com/coop-deluxe/coopnet.git,$(COOPNET_DIR))
	@$(MAKE) -C $(COOPNET_DIR)
ifeq ($(MAKE_SHARED_LIBS),1)
	@cp $(COOPNET_DIR)/bin/libcoopnet.so $(BUILD_DIR)/$(LIB_PREFIX)coopnet$(SH_EXT)
else
	@cp $(COOPNET_DIR)/bin/libcoopnet.a $(BUILD_DIR)/lib/$(LIB_PREFIX)coopnet$(ST_EXT)
endif
