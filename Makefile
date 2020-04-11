#
# Copyright (C) 2019-2020 GitHub 
#
# This is free software, licensed under the GNU General Public License v3.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=default-xpc-settings
PKG_VERSION:=1.0
PKG_RELEASE:=1
PKG_LICENSE:=GPLv3
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/default-xpc-settings
  SECTION:=luci
  CATEGORY:=LuCI
  TITLE:=LuCI support for Default Xpc0938's Settings
  PKGARCH:=all
  DEPENDS:=+luci-base +@LUCI_LANG_zh-cn +default-settings
endef

define Package/default-xpc-settings/description
	Language Support Packages.
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/default-xpc-settings/install
	./files/build_xpc_settings
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/xpc-default-settings $(1)/etc/uci-defaults/99-xpc-default-settings
endef

$(eval $(call BuildPackage,default-xpc-settings))
