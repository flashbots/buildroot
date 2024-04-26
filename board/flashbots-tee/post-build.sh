#!/bin/sh

set -e

BOARD_DIR=$(dirname "$0")

# Detect boot strategy, EFI or BIOS
#if [ -d "$BINARIES_DIR/efi-part/" ]; then
#    cp -f "$BOARD_DIR/grub-efi.cfg" "$BINARIES_DIR/efi-part/EFI/BOOT/grub.cfg"
#else
#    echo
#    cp -f "$BOARD_DIR/grub-bios.cfg" "$TARGET_DIR/boot/grub/grub.cfg"
#
#    # Copy grub 1st stage to binaries, required for genimage
#    cp -f "$TARGET_DIR/lib/grub/i386-pc/boot.img" "$BINARIES_DIR"
#fi

# Add a console on tty1
if [ -e ${TARGET_DIR}/etc/inittab ]; then
    grep -qE '^tty1::' ${TARGET_DIR}/etc/inittab || \
        sed -i '/GENERIC_SERIAL/a\
tty1::respawn:/sbin/getty -L  tty1 0 vt100 # QEMU graphical window' ${TARGET_DIR}/etc/inittab
fi

# Set root password
ROOT_PASSWD=$(openssl passwd -6 -salt sy4v3 root)
sed -i -E "s|^root:[^:]+:|root:${ROOT_PASSWD}:|" "${TARGET_DIR}/etc/shadow"
