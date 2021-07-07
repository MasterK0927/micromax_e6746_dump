#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:33554432:9746858e4ff2992f51a25b0821cea417b4577f90; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:33554432:cd79e09b1f4035fca3c1f5fc68db0f88c72583c4 \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:33554432:9746858e4ff2992f51a25b0821cea417b4577f90 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
