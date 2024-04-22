# TEE config
A config for building a TEE-enabled image.

## Build

  $ make flashbots_tee_x86_64_efi_defconfig
  $ make

## Run in qemu (UEFI)

Run the emulation with:

qemu-system-x86_64 \
	-M pc \
	-bios </path/to/OVMF_CODE.fd> \
	-drive file=output/images/disk.img,if=virtio,format=raw \
	-net nic,model=virtio \
	-net user
  -snapshot

Note that </path/to/OVMF.fd> needs to point to a valid x86_64 UEFI firmware image for qemu. It may be provided by your distribution as a edk2 or OVMF package, in path such as /usr/share/edk2/ovmf/OVMF_CODE.fd.

Checkout the file `/etc/overlayed_file.txt`. It is an example of how to overlay a filesystem to a resulting image.
