################################################################################
#
# podman
#
################################################################################

PODMAN_VERSION = 5.0.3
PODMAN_SITE = $(call github,containers,podman,v$(PODMAN_VERSION))
PODMAN_LICENSE = Apache-2.0
PODMAN_LICENSE_FILES = LICENSE
PODMAN_CPE_ID_VENDOR = linuxfoundation

PODMAN_GOMOD = github.com/containers/podman/v5
PODMAN_LDFLAGS = -X main.version=$(PODMAN_VERSION)
PODMAN_TAGS = exclude_graphdriver_devicemapper exclude_graphdriver_btrfs
# buildroot does not have the pgpme project
PODMAN_TAGS += containers_image_openpgp
PODMAN_BUILD_TARGETS = \
	cmd/podman \
	cmd/rootlessport

ifeq ($(BR2_PACKAGE_LIBAPPARMOR),y)
PODMAN_DEPENDENCIES += libapparmor
PODMAN_TAGS += apparmor
endif

ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
PODMAN_DEPENDENCIES += libseccomp host-pkgconf
PODMAN_TAGS += seccomp
endif

PODMAN_INSTALL_BINS = $(notdir $(PODMAN_BUILD_TARGETS))

define PODMAN_INSTALL_INIT_OPENRC
	$(INSTALL) -Dm755 $(PODMAN_PKGDIR)/podman.initd $(TARGET_DIR)/etc/init.d/podman
	$(INSTALL) -Dm644 $(PODMAN_PKGDIR)/podman.confd $(TARGET_DIR)/etc/conf.d/podman
endef

$(eval $(golang-package))
