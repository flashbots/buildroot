################################################################################
#
# passt
#
################################################################################

PASST_VERSION = 2024_06_24.1ee2eca
PASST_SITE = https://passt.top/passt/snapshot

PASST_LICENSE = GPL-2.0+
PASST_LICENSE_FILES = LICENSES/GPL-2.0-or-later.txt

define PASST_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) static
endef

define PASST_INSTALL_TARGET_CMDS
	$(INSTALL) -Dm 0755 $(@D)/pasta $(TARGET_DIR)/usr/bin
	$(INSTALL) -Dm 0755 $(@D)/pasta.avx2 $(TARGET_DIR)/usr/bin
endef

$(eval $(generic-package))
