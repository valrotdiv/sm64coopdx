LUA_DIR:=$(BUILD_DIR)/lib/lua

lua:
	@echo "===== Building Lua ====="
	@git clone https://github.com/lua/lua.git $(LUA_DIR) || true
	@$(MAKE) -f  $(shell pwd)/lua/build.mk -C $(LUA_DIR)
	@cp $(LUA_DIR)/liblua.a $(BUILD_DIR)/lib/liblua.a
