LUA_DIR:=$(BUILD_DIR)/lib/lua
LUA_CFLAGS := -std=c99 -DLUA_USE_LINUX $(LIB_CFLAGS)
LUA_LDFLAGS :=
LUA_LIB_S := $(LIB_PREFIX)lua$(SH_EXT)
ifeq ($(OSX_BUILD),1)
  LUA_LDFLAGS += -Wl,-export_dynamic
#else ifeq ($(WINDOWS_BUILD),1)
else
  LUA_LDFLAGS += -Wl,-E
endif

lua:
	@echo "===== Building Lua ====="
	$(call git-clone,https://github.com/lua/lua.git,$(LUA_DIR))
ifeq ($(MAKE_SHARED_LIBS),1)
	$(MAKE) -f $(shell pwd)/lua/build.mk -C $(LUA_DIR) $(LUA_LIB_S) \
	  MYCFLAGS="$(LUA_CFLAGS)" \
	  MYLDFLAGS="$(SH_LDFLAGS) $(LUA_LDFLAGS)" \
	  CORE_LIB="$(LUA_LIB_S)"
	@cp $(LUA_DIR)/$(LUA_LIB_S) $(BUILD_DIR)/$(LUA_LIB_S)
else
	@$(MAKE) -f  $(shell pwd)/lua/build.mk -C $(LUA_DIR) liblua.a \
	  MYCFLAGS="$(LUA_CFLAGS)" \
	  MYLDFLAGS="$(ST_LDFLAGS) $(LUA_LDFLAGS)"
	@cp $(LUA_DIR)/liblua.a $(BUILD_DIR)/lib/$(LIB_PREFIX)lua$(ST_EXT)
endif
