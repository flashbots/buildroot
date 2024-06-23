#!/bin/sh

set -e

# Fix disk image timestamp
# debugfs -w -R "set_inode_field / ctime 1234567890" "$BINARIES_DIR/rootfs.ext2"
# debugfs -w -R "set_inode_field / mtime 1234567890" "$BINARIES_DIR/rootfs.ext2"

# UUID=$(dumpe2fs "$BINARIES_DIR/rootfs.ext2" 2>/dev/null | sed -n 's/^Filesystem UUID: *\(.*\)/\1/p')
# sed -i "s/UUID_TMP/$UUID/g" "$BINARIES_DIR/efi-part/EFI/BOOT/grub.cfg"
# sed "s/UUID_TMP/$UUID/g" board/pc/genimage-efi.cfg > "$BINARIES_DIR/genimage-efi.cfg"
# support/scripts/genimage.sh -c "$BINARIES_DIR/genimage-efi.cfg"
