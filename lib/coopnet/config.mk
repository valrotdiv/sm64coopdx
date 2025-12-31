COOPNET_DIR:=$(BUILD_DIR)/lib/coopnet

coopnet: juice
	@echo "===== Building Coopnet ====="
	@git clone https://github.com/coop-deluxe/coopnet.git $(COOPNET_DIR) || true
	@$(MAKE) -C $(COOPNET_DIR)
	@cp $(COOPNET_DIR)/bin/libcoopnet.a $(BUILD_DIR)/lib/libcoopnet.a
