JUICE_DIR:=$(BUILD_DIR)/lib/juice

juice:
	@echo "===== Building Juice (required by coopnet) ====="
	@git clone https://github.com/paullouisageneau/libjuice.git $(JUICE_DIR) || true
	@$(MAKE) -C $(JUICE_DIR)
	@cp $(JUICE_DIR)/libjuice.a $(BUILD_DIR)/lib/libjuice.a
