################################################################################
#
# netavark
#
################################################################################

NETAVARK_VERSION = v1.11.0
NETAVARK_SITE = $(call github,containers,netavark,$(NETAVARK_VERSION))
NETAVARK_LICENSE = Apache Licene 2.0
NETAVARK_LICENSE_FILES = LICENSE

ifeq ($(BR2_PACKAGE_PODMAN),y)
define NETAVARK_INSTALL_TARGET_CMDS
	$(INSTALL) -Dm755 $(@D)/target/$(RUSTC_TARGET_NAME)/release/netavark $(TARGET_DIR)/usr/local/libexec/podman/netavark
	$(INSTALL) -Dm755 $(@D)/target/$(RUSTC_TARGET_NAME)/release/netavark-dhcp-proxy-client $(TARGET_DIR)/usr/local/libexec/podman/netavark-dhcp-proxy-client
endef
endif

$(eval $(cargo-package))
