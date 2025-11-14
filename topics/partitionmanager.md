# Partition Manager

## Description

KDE Partition Manager is an application to help you manage the disk devices, partitions and file systems on your computer. It allows you to easily create, copy, move, delete, resize without losing data, backup and restore partitions.

## Directory

- [Partition Manager](#partition-manager)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Cloning a Disk](#cloning-a-disk)
    - [Description](#description-1)
    - [References](#references-1)
    - [Steps](#steps)
  - [Mounting a Secondary Internal Disk](#mounting-a-secondary-internal-disk)
    - [Description](#description-2)
    - [Steps](#steps-1)

## References

- [KDE Partition Manager](https://github.com/KDE/partitionmanager)

---

## Cloning a Disk

### Description

This guide details on how we could clone a disk using KDE Partition Manager.

### References

- [How-To: Copying a Partition](https://docs.kde.org/trunk5/en/partitionmanager/partitionmanager/howto-copypartition.html)
- [How to change filesystem UUID (2 same UUID)?](https://unix.stackexchange.com/a/12859)

### Steps

> [!NOTE]  
> To copy a source partition to a target partition of another drive, the two partitions will need to not be mounted - this makes it almost (if not entirely) impossible to do right from your host system. Hence, the rest of this guide will be done from a (Full) Manjaro KDE Plasma Live USB, which has KDE Partition Manager installed by default.

1. Download the [Manjaro KDE Plasma ISO](https://download.manjaro.org/kde/22.1.3/manjaro-kde-22.1.3-230529-linux61.iso) file.

2. [Install BalenaEtcher](etcher.md#installation) if you haven't already. Launch the **BalenaEtcher** app.

3. [Flash](etcher.md#flashing-an-iso) the downloaded ISO file using **BalenaEtcher** to a USB drive.

4. After flashing the ISO, attach the USB stick to the PC that has both the **Source** and **Target** drives attached.

5. While the PC is shut down, turn on the PC, and get into the motherboard's UEFI/BIOS (usually by pressing the <kbd>F2</kbd> or <kbd>DEL</kbd> key).

6. In the **Boot** section of the UEFI, locate the **Boot Override** option and select the USB drive to boot into the Manjaro KDE Plasma Live USB.

> [!IMPORTANT]  
> The target drive should be of the same capcaity or bigger than the source drive.

> [!CAUTION]  
> The following steps will wipe the target drive clean, so make sure that you have backed up all the data you need from the target drive before proceeding.

7. Copy partitions from the **Source** drive to the **Target** drive:

   - In the Manjaro KDE Plasma Live desktop, launch the **KDE Partition Manager** app. You should find both the drives available there. It's important that you identify which of the two is the **Source** drive and the **Target** drive. In this guide, we'll assume that the **Source** drive is `nvme1n1`, while the **Target** drive is `nvme0n1`.

   - Delete all existing partitions found in the **Target** drive.

   - While referring to the partitions found in the **Source** drive, `nvme1n1`, create new partitions in the **Target** drive, `nvme0n1` that replicates the source drive. Make sure to also get the partition flags and names right if available. Most importantly, the size allocation of each new partition on the **Target** drive should be the same, or bigger.

   - Right click a partition in the **Source** drive, select the **Copy** option, then right click the corresponding partition in the **Target** drive, and select the **Paste** option. Repeat this for each partition found in the **Source** drive.

   - Ensure that each copy has completed sucessfully with no error messages.

   - Once done, right click each of the partition in the newly cloned **Target** drive, and select the **Properties** option and locate the partition's `UUID`. Take note of each of their `UUID` values as we will need them later.

8. Update the system `fstab` file:

   - Locate the exact partition in the **Target** drive which is the `root` partition. You could do this by checking it from KDE Partition Manager, or by using the following command:

      ```sh
      sudo lsblk
      ```

   - In this example, the `root` partition of the **Target** drive is `/dev/nvme0n1p2`, and uses the `btrfs` filesystem.

      Mount the `root` partition to the mounting point:

      ```sh
      sudo mount /dev/nvme0n1p2 /mnt
      ```

      **Alternatively**, if the `root` partition is a [Btrfs](btrfs.md) partition, mount the corresponding `root` subvolume (i.e. `@`) to the mounting point instead:

      ```sh
      sudo mount -o subvol=@ /dev/nvme0n1p2 /mnt
      ```

   - Make a backup of the system's existing `fstab` file in the `root` partition:

      ```sh
      sudo cp /mnt/etc/fstab /mnt/etc/fstab.bak
      ```

   - Update the `fstab` file in the `root` partition:

      ```sh
      sudo nano /mnt/etc/fstab
      ```

   - Replace all the old `UUID` values found in the `fstab` file with the `UUID` values of your new partitions in the **Target** drive. For example:

      ```diff
      - UUID=a7f3c2e5-4b8d-4a19-9f6e-2d1c8e4f7a3b   /                   btrfs   subvol=/@,noatime,compress=zstd                                                                                                          0 0
      - UUID=a7f3c2e5-4b8d-4a19-9f6e-2d1c8e4f7a3b   /home               btrfs   subvol=/@home,noatime,compress=zstd                                                                                                      0 0
      - UUID=a7f3c2e5-4b8d-4a19-9f6e-2d1c8e4f7a3b   /var/cache          btrfs   subvol=/@cache,noatime,compress=zstd                                                                                                     0 0
      - UUID=a7f3c2e5-4b8d-4a19-9f6e-2d1c8e4f7a3b   /var/log            btrfs   subvol=/@log,noatime,compress=zstd                                                                                                       0 0
      - UUID=a7f3c2e5-4b8d-4a19-9f6e-2d1c8e4f7a3b   /swap               btrfs   subvol=/@swap,noatime
      + UUID=bzxd1bo8-9nnb-ddet-qykk-qjdgr9yytybg   /                   btrfs   subvol=/@,noatime,compress=zstd                                                                                                          0 0
      + UUID=bzxd1bo8-9nnb-ddet-qykk-qjdgr9yytybg   /home               btrfs   subvol=/@home,noatime,compress=zstd                                                                                                      0 0
      + UUID=bzxd1bo8-9nnb-ddet-qykk-qjdgr9yytybg   /var/cache          btrfs   subvol=/@cache,noatime,compress=zstd                                                                                                     0 0
      + UUID=bzxd1bo8-9nnb-ddet-qykk-qjdgr9yytybg   /var/log            btrfs   subvol=/@log,noatime,compress=zstd                                                                                                       0 0
      + UUID=bzxd1bo8-9nnb-ddet-qykk-qjdgr9yytybg   /swap               btrfs   subvol=/@swap,noatime
      ```

      Do note that if a `btrfs` partition from the **Target** drive shares the same `UUID` with its corresponding partition from the **Source** drive, generate a new `UUID` for said partition (i.e. `/dev/nvme0n1p2`):

      ```sh
      btrfstune -U $(uuidgen) /dev/nvme0n1p2
      ```

      If the new `fat32` (`boot`) partition on the **Target** drive shares the same `UUID` as the old `boot` partition, it should be safe for you to just delete the old `boot` partition from the **Source** drive using the **KDE Partition Manager** app (make sure to apply the changes after selecting the **Delete** option).

9. Update the system GRUB:

   - With the `root` partition still mounted to the mounting point (i.e. `/mnt`), check the system's `fstab` file to find out where the `fat32` (`boot`) partition should be mounted to:

      ```sh
      sudo cat /mnt/etc/fstab
      ```

      For example:

      ```
        UUID=A7F3-C2E5                              /boot/efi           vfat    noatime                                                                                                                                  0 2
      ```

      In this sample `boot` partition, it is intended to be mounted to `/boot/efi` on the `root` partition.

   - Mount the `boot` partition (i.e. `/dev/nvme0n1p1`) to its intended mountpoint (i.e. `/boot/efi`) on the `root` partition we have mounted (i.e. `/mnt`):

      ```sh
      sudo mount /dev/nvme0n1p1 /mnt/boot/efi
      ```

   - Mount essential system directories and `chroot` into the `root` partition of the **Target** drive to access it as if we have booted into it:

      ```sh
      sudo mount --bind /dev /mnt/dev
      sudo mount --bind /proc /mnt/proc
      sudo mount --bind /sys /mnt/sys
      sudo chroot /mnt
      ```

   - Create a backup of the system's existing GRUB config:

      ```sh
      sudo cp /mnt/boot/grub/grub.cfg /mnt/boot/grub/grub.cfg.bak
      ```

   - [Regenerate a new GRUB config](grub.md#generate-grub-config) to override the old, outdated one on the system.

   - Reboot your computer without the Live USB Stick and **Source** drive attached to confirm that the new GRUB config works, and that the cloned desktop on your brand new **Target** drive is all set.

---

## Mounting a Secondary Internal Disk

### Description

This details how we could add a secondary internal drive to our computer.

> [!CAUTION]  
> This guide will lead you to wipe the secondary drive clean, make sure that you have backed up all the data you need from the secondary drive before proceeding!

### Steps

1. Launch the **KDE Partition Manager** application.

> [!NOTE]  
> Make sure that the secondary drive has been physically installed to the PC.

2. Locate the secondary drive within the list of available **Devices**.

3. Remove any existing partitions on the secondary drive by clicking on each partition and selecting the **Delete** option at the top.

4. Select an `unallocated` partition and click the **New** button at the top to create a new partition:

   - Set the **File system** (i.e. `btrfs`).

   - Give it a **Label** (i.e. `data`).

   - Set the **Size**.

   - Click the **OK** button.

   - Click the **Apply** button at the top to apply the changes.

5. Once we have prepared our drive's partition, create a mounting point for the new secondary drive (i.e. `/mnt/data`):

   ```sh
   sudo mkdir /mnt/data
   ```

6. Identify the new partition we have created and will be mounting, and take note of its `UUID` value:

   ```sh
   sudo blkid
   ```

   Sample output:

   ```
   /dev/nvme1n1p1: LABEL="data" UUID="586e85aa-3a23-4ec4-a159-c25a5f15df20" UUID_SUB="8cd35ec7-e2a2-4a86-8a39-a2e129f88200" BLOCK_SIZE="4096" TYPE="btrfs" PARTUUID="c708eb71-46b7-4de7-b396-abc55a0bfc5d"
   ```

   In this example, the `UUID` of the new partition is `586e85aa-3a23-4ec4-a159-c25a5f15df20`.

7. Register our secondary drive to the `fstab` file.

   Edit the `fstab` file:

   ```sh
   sudo nano /etc/fstab
   ```

   Add the following entry, with the new partition's `UUID` value (i.e. `586e85aa-3a23-4ec4-a159-c25a5f15df20`):

   ```
   # data
   UUID=586e85aa-3a23-4ec4-a159-c25a5f15df20   /mnt/data           btrfs   defaults                                                                                                            0 0
   ```

   > [!WARNING]  
   > In addition to replacing the `UUID` value, make sure to also replace `/mnt/data` with the path to your actual mounting point!

8. Reload our daemon so that our new `fstab` is recognised:

   ```sh
   sudo systemctl daemon-reload
   ```

9. Try and mount our drive to its mounting point (i.e. `/mnt/data`):

   ```sh
   sudo mount /mnt/data
   ```

10. If it has mounted successfully, we likely still are not able to write to it as the mounting point is owned by the `root` user.

      Change the ownership of the mounting point of the new partition (i.e. `/mnt/data`) to make it writable by our user:

      ```sh
      sudo chown $USER: /mnt/data
      ```

      The secondary drive should now be automatically mounted upon boot and available under the **Devices** section in our **Dolphin** file explorer application (as well as in a shell session through its mounting point).
