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

6. Start and enable the system's `cron` service (i.e. `cronie`) so that scheduled backups work:

    ```sh
    sudo systemctl enable --now cronie.service
    ```

7. Regenerate our Grub config so that `grub-btrfs` works as intended:

    ```sh
    sudo grub-mkconfig -o /boot/grub/grub.cfg
    ```

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
