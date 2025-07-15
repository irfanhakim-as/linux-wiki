# Samba

## Description

Samba is a free software re-implementation of the SMB networking protocol, and was originally developed by Andrew Tridgell.

## Directory

- [Samba](#samba)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Mounting Remote Directory](#mounting-remote-directory)
    - [Description](#description-1)
    - [References](#references-1)
    - [Steps](#steps)
  - [Unmounting a Mounted Directory](#unmounting-a-mounted-directory)
    - [Description](#description-2)
    - [References](#references-2)
    - [Steps](#steps-1)

## References

- [Samba](https://wiki.archlinux.org/title/samba)

---

## Mounting Remote Directory

### Description

This details how to mount a remote Samba share to our local machine.

### References

- [Automatic mounting: As mount entry](https://wiki.archlinux.org/title/samba#As_mount_entry)
- [Use of the x-systemd.automount mount option in /etc/fstab](https://www.suse.com/support/kb/doc/?id=000020402)

### Steps

1. Ensure that all necessary packages are [installed](yay.md#install), including `cifs-utils`, `samba`, and `smbclient`.

    > [!NOTE]  
    > Installing `samba` will also install other required packages such as `cifs-utils` and `smbclient` automatically.

2. Create the directory that will be used as the mountpoint for the remote storage (i.e. `/mnt/mynas`):

    ```sh
    sudo mkdir -p <mountpoint>
    ```

    For example:

    ```sh
    sudo mkdir -p /mnt/mynas
    ```

3. Create our credentials file that will be used to access the remote directory (i.e. `.smbcreds`):

   - Pre-create the directory for the credentials file:

        ```sh
        mkdir -p ~/.config/smb
        ```

   - Write and save the credentials file:

        ```sh
        nano ~/.config/smb/.smbcreds
        ```

        Content of the credentials file:

        ```sh
        username=<nas-user>
        password=<nas-password>
        ```

        Replace the values with the credentials of the Samba share user accordingly.

   - Update the permissions of the credentials file to secure it:

        ```sh
        chmod 600 ~/.config/smb/.smbcreds
        ```

4. **(Optional)** Add the IP address of our remote server to our `/etc/hosts` file:

    ```sh
    sudo nano /etc/hosts
    ```

    Sample IP address entry:

    ```sh
    # example.org
    192.168.0.120      mynas
    ```

    Replace the IP address and the hostname of the remote Samba server accordingly.

5. Add our mounting options for the remote directory using the system's `fstab` file:

   - Declare the mounting options for the remote directory:

        ```sh
        fstab_line="//mynas/mydir   /mnt/mynas   cifs    _netdev,nofail,mfsymlinks,users,x-systemd.automount,credentials=${HOME}/.config/smb/.smbcreds,vers=3.0,uid=$(id -u),gid=$(id -g),iocharset=utf8   0 0"
        ```

        Meaning behind some of the included options:

        - `//mynas/mydir`: `mynas` denotes the sample hostname of the remote server, while `mydir` denotes the sample remote directory on the server.
        - `/mnt/mynas`: The sample directory that will be used as the mounting point.
        - `_netdev`: Indicates that the filesystem depends on network availability. It ensures that the mount attempt waits until the network is up.
        - `nofail`: Allows the boot process to continue even if this mount point fails. It prevents boot hang-ups in case the remote directory is unavailable.
        - `mfsymlinks`: Enables support for symbolic links in the CIFS/SMB share, allowing symbolic links on the remote system to be followed locally.
        - `users`: Allows non-root users to mount and unmount the filesystem.
        - `x-systemd.automount`: Automatically mounts the share when it is accessed, rather than at boot time. This helps avoid delays if the remote system isn't immediately available.

        Feel free to omit or add to these sample options depending on your needs.

   - Write the line to the `/etc/fstab` file:

        ```sh
        echo "${fstab_line}" | sudo tee -a /etc/fstab
        ```

6. Reload the `daemon` for it to recognise the changes made to our `fstab` file:

    ```sh
    sudo systemctl daemon-reload
    ```

8. Mount the remote directory to our mountpoint (i.e. `/mnt/mynas`) based on our `fstab` configuration:

    ```sh
    sudo mount <mountpoint>
    ```

    For example:

    ```sh
    sudo mount /mnt/mynas
    ```

---

## Unmounting a Mounted Directory

### Description

This details how to unmount a remote directory from our local machine.

### References

- [Automatic mounting: As mount entry](https://wiki.archlinux.org/title/samba#As_mount_entry)

### Steps

1. Unmount the remote directory from our local machine:

    ```sh
    sudo umount /mnt/mynas
    ```

    > [!IMPORTANT]  
    > This example assumes that the remote directory is mounted at `/mnt/mynas`. Update the path accordingly.

    If you receive an error message such as the target being busy, you can use the following command to force the unmount:

    ```sh
    sudo umount -l /mnt/mynas
    ```

    The `-l` flag stands for `lazy` and will force the detachment of the mount point.

2. If the previously mounted directory has been added as a mount entry in the `/etc/fstab` file, you can remove it by editing the file:

    ```sh
    sudo nano /etc/fstab
    ```

    Remove the line that corresponds to the mount point you wish to remove by deleting or commenting it out. For example:

    ```sh
    # example.org
    # //mynas/mydir    /mnt/mynas    cifs    _netdev,nofail,mfsymlinks,credentials=/home/deck/.config/smb/.smbcreds,vers=3.0,uid=1000,gid=1000,iocharset=utf8    0 0
    ```

    Save the file and exit the editor. This will prevent the mount point from being automatically mounted from the next boot.
