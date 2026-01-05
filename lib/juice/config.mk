JUICE_DIR:=$(BUILD_DIR)/lib/juice

juice:
	@echo "===== Building Juice ====="
	$(call git-clone,https://github.com/paullouisageneau/libjuice.git,$(JUICE_DIR))
# Fix macos illegal option f on ar (crf -> cr)
	@sed -i.bak 's/ crf / cr /g' $(JUICE_DIR)/Makefile
	@$(MAKE) -C $(JUICE_DIR)
	@cp $(JUICE_DIR)/libjuice.a $(BUILD_DIR)/lib/libjuice.a
