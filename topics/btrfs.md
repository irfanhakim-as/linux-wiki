# Btrfs

## Description

Btrfs is a modern copy on write (COW) file system for Linux aimed at implementing advanced features while also focusing on fault tolerance, repair and easy administration.

## Directory

- [Btrfs](#btrfs)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Timeshift with Btrfs](#timeshift-with-btrfs)
    - [Description](#description-1)
    - [References](#references-1)
    - [Steps](#steps)
    - [Notes](#notes)
  - [Balance Btrfs Volumes](#balance-btrfs-volumes)
    - [Description](#description-2)
    - [Steps](#steps-1)
  - [Swap](#swap)
    - [Description](#description-3)
    - [References](#references-2)
    - [Enable Swap](#enable-swap)
    - [Disable Swap](#disable-swap)

## References

- [Btrfs](https://wiki.archlinux.org/title/btrfs)

---

## Timeshift with Btrfs

### Description

Timeshift for Linux is an application that provides functionality similar to the System Restore feature in Windows and the Time Machine tool in macOS. This details how to setup and use Timeshift with Btrfs.

### References

- [Endeavour OS: Snapshotting with Timeshift](https://youtu.be/7wtxnlWwP7w)
- [No space left, despite having 200GB free space (BTRFS install)](https://forum.endeavouros.com/t/no-space-left-despite-having-200gb-free-space-btrfs-install/42875)

### Steps

1. [Install](yay.md#install) the `timeshift` package using `yay`.

2. [Install](yay.md#install) the `timeshift-autosnap` package using `yay` to automatically create a snapshot every pre-upgrade.

3. [Install](yay.md#install) the `grub-btrfs` package using `yay` to allow booting into snapshots through Grub.

4. Complete the setup through the Timeshift wizard:

   - Authenticate (as it requires `sudo`).

   - Select **BTRFS** as **Snapshot Type**.

   - Select the main **btrfs** partition as the **Snapshot Location**.

   - Select the desired **Snapshot Levels**. Default options are fine.

   - Leave the **Include @home subvolume in backups** option unchecked.

   - Click **Finish**.

5. Create the first snapshot by clicking the **Create** button.

6. [Start and Enable](autostart.md#start-and-enable-service) the system's `cron` service (i.e. `cronie.service`) so that scheduled backups work.

7. [Regenerate a new GRUB config](grub.md#generate-grub-config) so that `grub-btrfs` works as intended.

### Notes

- `timeshift-autosnap` should only keep 3 older snapshots by default according to its config, `/etc/timeshift-autosnap.conf`.

- If it is not working reliably, it is recommended for you to use the Timeshift desktop application to delete older snapshots manually from time to time.

---

## Balance Btrfs Volumes

### Description

If you are using a Btrfs filesystem, it is recommended for you to "balance" your Btrfs volumes on a monthly basis in order to ensure that the free space available on your device is properly unallocated.

> [!WARNING]  
> Leaving your Btrfs volume unbalanced for too long might cause you `No space left` errors in the long run.

### Steps

1. [Install](yay.md#install) the `btrfs-assistant` application using `yay`.

2. Launch the `btrfs-assistant` application. You will be asked to authenticate (as it requires `root` permissions).

3. Click the **Start** button in the **Balance** section to balance your Btrfs volumes.

---

## Swap

### Description

This guide covers topics pertaining to the addition or removal of swap files as virtual memory on a system running BTRFS.

### References

- [Swap](https://wiki.archlinux.org/title/Swap)
- [BTRFs and swap](https://forum.endeavouros.com/t/btrfs-and-swap/44656/6)
- [Swap file](https://wiki.archlinux.org/title/Btrfs#Swap_file)

### Enable Swap

This details how to add and enable a swap file on a system running BTRFS:

1. First, verify that swap is currently disabled on the system:

   - First method:

      ```sh
      inxi -j
      ```

      Sample output:

      ```
        Swap:
          Alert: No swap data was found.
      ```

   - Second method:

      ```sh
      swapon --show
      ```

      This command should not return any output.

2. Ensure there is not a BTRFS subvolume for the swap file already:

    ```sh
    sudo btrfs subvolume list /
    ```

    Sample output:

    ```
      ID 257 gen 5349724 top level 5 path @home
      ID 258 gen 5349702 top level 5 path @cache
      ID 259 gen 5349717 top level 5 path @log
      ID 457 gen 5349724 top level 5 path @
    ```

3. Determine the UUID of the BTRFS filesystem on the system:

    ```sh
    sudo btrfs filesystem show /
    ```

    Sample output:

    ```
      Label: 'endeavouros'  uuid: bzxd1bo8-9nnb-ddet-qykk-qjdgr9yytybg
              Total devices 1 FS bytes used 290.02GiB
              devid    1 size 446.15GiB used 315.07GiB path /dev/sdb2
    ```

    Based on this sample output, the UUID of the BTRFS filesystem is `bzxd1bo8-9nnb-ddet-qykk-qjdgr9yytybg`.

4. Create a BTRFS subvolume to store the swap file:

   - Mount the BTRFS filesystem root temporarily to a mountpoint (i.e. `/mnt`):

      ```sh
      sudo mount UUID=<uuid> /mnt
      ```

      Replace `<uuid>` with the UUID of the BTRFS filesystem (i.e. `bzxd1bo8-9nnb-ddet-qykk-qjdgr9yytybg`). For example:

      ```sh
      sudo mount UUID=bzxd1bo8-9nnb-ddet-qykk-qjdgr9yytybg /mnt
      ```

      This is done so we could access the top level where other BTRFS subvolumes are created on the system.

   - Create the swap BTRFS subvolume on the mountpoint (i.e. `/mnt`):

      ```sh
      sudo btrfs subvolume create /mnt/@swap
      ```

   - Ensure the swap BTRFS subvolume has been created:

      ```sh
      sudo btrfs subvolume list / | grep swap
      ```

      Sample output:

      ```
      ID 260 gen 344318 top level 5 path @swap
      ```

   - Unmount the BTRFS filesystem root from the mountpoint (i.e. `/mnt`):

      ```sh
      sudo umount /mnt
      ```

5. Mount the swap BTRFS subvolume on the system (temporarily) and create the swap file:

   - Create a directory where the swap BTRFS subvolume should be mounted to (i.e. `/swap`):

      ```sh
      sudo mkdir /swap
      ```

   - Mount the swap BTRFS subvolume to the designated mountpoint (i.e. `/swap`):

      ```sh
      sudo mount -o subvol=/@swap,noatime UUID=<uuid> /swap
      ```

      Replace `<uuid>` with the UUID of the BTRFS filesystem (i.e. `bzxd1bo8-9nnb-ddet-qykk-qjdgr9yytybg`). For example:

      ```
      sudo mount -o subvol=/@swap,noatime UUID=bzxd1bo8-9nnb-ddet-qykk-qjdgr9yytybg /swap
      ```

      Verify that it's mounted:

      ```
        TARGET SOURCE            FSTYPE OPTIONS
        /swap  /dev/sdb2[/@swap] btrfs  rw,noatime,compress=zstd:3,ssd,discard=async,space_cache=v2,subvolid=260,subvol=/@swap
      ```

   - Create the appropriately sized swap file on the mountpoint (i.e. `/swap`):

      ```sh
      sudo btrfs filesystem mkswapfile --size <size>g --uuid clear /swap/swapfile
      ```

      Replace `<size>` with the desired size of the swap file in gigabytes. If in doubt, allocate the size of your total system memory, or half of it. For example, for 16GB of swap:

      ```sh
      sudo btrfs filesystem mkswapfile --size 16g --uuid clear /swap/swapfile
      ```

   - Activate the swap file (i.e. `/swap/swapfile`) as swap space on the system:

      ```sh
      sudo swapon /swap/swapfile
      ```

6. Verify that swap has been enabled on the system:

   - First method:

      ```sh
      inxi -j
      ```

      Sample output:

      ```
        Swap:
          ID-1: swap-1 type: file size: 16 GiB used: 10.2 MiB (0.1%)
            file: /swap/swapfile
      ```

   - Second method:

      ```sh
      swapon --show
      ```

      Sample output:

      ```
        NAME           TYPE SIZE  USED PRIO
        /swap/swapfile file  16G 10.5M   -2
      ```

7. Mount the swap BTRFS subvolume on the system and activate the swap file on boot automatically:

   - Update the system's `fstab` file:

      ```sh
      sudo nano /etc/fstab
      ```

   - Add the following line to the `fstab` file, with the rest of the existing entries, to mount the swap BTRFS subvolume on boot to the designated mountpoint (i.e. `/swap`):

      ```diff
        UUID=<uuid> /var/log       btrfs   subvol=/@log,noatime,compress=zstd 0 0
      + UUID=<uuid> /swap          btrfs   subvol=/@swap,noatime              0 0
      ```

      Replace `<uuid>` with the UUID of the BTRFS filesystem (i.e. `bzxd1bo8-9nnb-ddet-qykk-qjdgr9yytybg`). For example:

      ```
      UUID=bzxd1bo8-9nnb-ddet-qykk-qjdgr9yytybg /swap          btrfs   subvol=/@swap,noatime              0 0
      ```

   - Add the following line to the `fstab` file to activate the swap file we had created as swap space on boot (i.e. `/swap/swapfile`):

      ```diff
        UUID=bzxd1bo8-9nnb-ddet-qykk-qjdgr9yytybg /swap          btrfs   subvol=/@swap,noatime              0 0
      + /swap/swapfile                            swap           swap    defaults
      ```

      Sample entry:

      ```
      /swap/swapfile                            swap           swap    defaults
      ```

   - Upon next boot, the swap BTRFS subvolume will be mounted and the swap file will be activated accordingly.

### Disable Swap

This details how to disable and remove a swap device on a system running BTRFS:

1. First, verify that swap is indeed currently enabled on the system:

   - First method:

        ```sh
        inxi -j
        ```

        Sample output:

        ```sh
        Swap:
        ID-1: swap-1 type: file size: 512 MiB used: 511.8 MiB (100.0%)
            file: /swap/swapfile
        ```

   - Second method:

        ```sh
        swapon --show
        ```

        Sample output:

        ```sh
        NAME           TYPE SIZE   USED PRIO
        /swap/swapfile file 512M 511.8M   -2
        ```

    > [!NOTE]  
    > Take note of the swap device name such as in this sample being `/swap/swapfile`.

2. Disable the swap device (i.e. `/swap/swapfile`):

    ```sh
    swapoff /swap/swapfile
    ```

3. Unmount the swap volume (i.e. `/swap`) so it can be deleted:

    ```sh
    sudo umount /swap
    ```

4. Delete the `@swap` BTRFS subvolume using the **Btrfs Assistant** application:

   - Launch the **Btrfs Assistant** application. [Install](yay.md#install) the `btrfs-assistant` package using `yay` if you do not have it already.

   - Navigate to the **Subvolumes** tab.

   - From the list of subvolumes, locate and highlight the `@swap` subdirectory by selecting it.

   - Click the **Delete** button.

   - When prompted to confirm, click the **Yes** button.

5. Remove or comment entries in the system's `fstab` file relating to the swap device or subvolume:

   - Edit the `fstab` file:

        ```sh
        sudo nano /etc/fstab
        ```

   - Remove or comment any entries relating to the swap device or subvolume like so:

        ```sh
        #UUID=bzxd1bo8-9nnb-ddet-qykk-qjdgr9yytybg   /swap               btrfs   subvol=/@swap,noatime                                                                                               0 0
        #/swap/swapfile                              swap                swap    defaults                                                                                                            0 0
        ```

6. Restart the system and reuse the same step to verify that swap has been disabled.
