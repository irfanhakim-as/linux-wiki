# Zram

## Description

zram, formerly called compcache, is a Linux kernel module for creating a compressed block device in RAM, i.e. a RAM disk with on-the-fly disk compression. The block device created with zram can then be used for swap or as general-purpose RAM disk.

## Directory

- [Zram](#zram)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Setup](#setup)
    - [Description](#description-1)
    - [References](#references-1)
    - [Steps](#steps)

## References

- [Zram](https://wiki.archlinux.org/title/Zram)

---

## Setup

> [!IMPORTANT]  
> Parts of this guide assumes that you are using the BTRFS filesystem and GRUB.

### Description

This details how to setup Zram to be used as a swap alternative on Linux.

### References

- [Using zram-generator](https://wiki.archlinux.org/title/Zram#Using_zram-generator)
- [Enabling ZRAM in EndeavourOS](https://forum.endeavouros.com/t/enabling-zram-in-endeavouros/37746)
- [zram-generator.conf](https://github.com/systemd/zram-generator/blob/main/man/zram-generator.conf.md)

### Steps

1. First and foremost, ensure that swap is currently disabled:

    ```sh
    inxi -j
    ```

   If swap is enabled, [disable it](btrfs.md#disable-swap) first.

2. [Install](yay.md#install) the `zram-generator` package using `yay`.

3. Prepare a `zram-generator` config:

    Create the config file:

    ```sh
    sudo nano /etc/systemd/zram-generator.conf
    ```

    Sample content of the config:

    ```conf
    [zram0]
    zram-size = ram / 2
    compression-algorithm = zstd
    swap-priority=60
    ```

    > [!TIP]  
    > This sets the `zram-size` to half of your total system memory. To set it to full, set the value to `ram`.

    > [!TIP]  
    > The `swap-priority` variable is optional and can be set from `-1` (lowest priority) to `32767` (highest priority). This variable defaults to `100` if not set.

4. Reload and start the relevant services:

   - Reload the systemd manager configuration:

        ```sh
        sudo systemctl daemon-reload
        ```

   - [Start](autostart.md#start-and-enable-service) the Zram service we had configured (i.e. `/dev/zram0`).

5. Disable Zswap for maximum efficiency with using Zram:

   - Update the GRUB file:

        ```sh
        sudo nano /etc/default/grub
        ```

   - Locate the `GRUB_CMDLINE_LINUX_DEFAULT` variable in the file.

        Sample content:

        ```sh
        GRUB_CMDLINE_LINUX_DEFAULT='nowatchdog nvme_load=YES loglevel=3'
        ```

   - Add the `zswap.enabled=0` parameter to the end of the value of the `GRUB_CMDLINE_LINUX_DEFAULT` variable.

        Sample content:

        ```sh
        GRUB_CMDLINE_LINUX_DEFAULT='nowatchdog nvme_load=YES loglevel=3 zswap.enabled=0'
        ```

   - Save the file.

6. [Regenerate a new GRUB config](grub.md#generate-grub-config) so our changes to GRUB apply in the next boot.

7. Restart the system.

8. Verify our changes:

   - Verify Zram has been enabled:

        ```sh
        inxi -j
        sudo dmesg | grep zram
        ```

        Sample output:

        ```sh
        Swap:
        ID-1: swap-1 type: zram size: 7.66 GiB used: 2.44 GiB (31.9%)
            dev: /dev/zram0
        ```

        ```sh
        [    3.471553] zram: Added device: zram0
        [    3.753380] systemd[1]: Created slice Slice /system/systemd-zram-setup.
        [    3.760467] systemd[1]: Expecting device /dev/zram0...
        [    4.857465] zram0: detected capacity change from 0 to 16072704
        [    5.057472] Adding 8036348k swap on /dev/zram0.  Priority:60 extents:1 across:8036348k SSDsc
        ```

   - Verify Zswap has been disabled:

        ```sh
        sudo dmesg | grep zswap
        ```

        Sample output:

        ```sh
        [    0.000000] Command line: BOOT_IMAGE=/@/boot/vmlinuz-linux-lts root=UUID=bzxd1bo8-9nnb-ddet-qykk-qjdgr9yytybg rw rootflags=subvol=@ nowatchdog nvme_load=YES loglevel=3 zswap.enabled=0
        [    0.046053] Kernel command line: BOOT_IMAGE=/@/boot/vmlinuz-linux-lts root=UUID=bzxd1bo8-9nnb-ddet-qykk-qjdgr9yytybg rw rootflags=subvol=@ nowatchdog nvme_load=YES loglevel=3 zswap.enabled=0
        ```
