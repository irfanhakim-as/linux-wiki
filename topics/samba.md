# Samba

## Description

Samba is a free software re-implementation of the SMB networking protocol, and was originally developed by Andrew Tridgell.

## Directory

- [Samba](#samba)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Installation](#installation)
    - [Description](#description-1)
    - [References](#references-1)
    - [Steps](#steps)
  - [Mounting Remote Directory](#mounting-remote-directory)
    - [Description](#description-2)
    - [References](#references-2)
    - [Steps](#steps-1)
  - [Unmounting a Mounted Directory](#unmounting-a-mounted-directory)
    - [Description](#description-3)
    - [References](#references-3)
    - [Steps](#steps-2)
  - [Sharing a Directory Remotely](#sharing-a-directory-remotely)
    - [Description](#description-4)
    - [References](#references-4)
    - [Steps](#steps-3)

## References

- [Samba](https://wiki.archlinux.org/title/samba)

---

## Installation

### Description

This details how to install Samba on a Linux system.

### References

- [Installation](https://wiki.archlinux.org/title/Samba#Installation)

### Steps

1. [Install](yay.md#install) the `samba` package using your package manager (i.e. `yay`) - this will automatically install other dependencies such as `smbclient` and `cifs-utils`.

---

## Mounting Remote Directory

### Description

This details how to mount a remote Samba share to our local machine.

### References

- [Automatic mounting: As mount entry](https://wiki.archlinux.org/title/samba#As_mount_entry)
- [Use of the x-systemd.automount mount option in /etc/fstab](https://www.suse.com/support/kb/doc/?id=000020402)
- [systemd.mount](https://www.freedesktop.org/software/systemd/man/latest/systemd.mount.html)
- [Mounting SMB Shares with Systemd](https://www.reddit.com/r/SteamDeck/comments/ymjnjy/mounting_smb_shares_with_systemd)

### Steps

1. Ensure that all necessary packages are [installed](#installation).

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

5. Add our mount configuration for the remote directory using the system's `fstab` file:

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

6. **Alternatively**, if using `fstab` is not a lasting option such as on immutable systems like [SteamOS](../distros/SteamOS.md) or [Bazzite](../distros/Bazzite.md), we could add our mount configuration using `systemd` mount units instead:

   - Get the numerical value of our user ID (UID):

        ```sh
        id -u
        ```

        Sample UID output:

        ```sh
          1000
        ```

   - Get the numerical value of our group ID (GID):

        ```sh
        id -g
        ```

        Sample GID output:

        ```sh
          1000
        ```

   - The name of the mount unit file to create, which requires corresponding to the intended mountpoint (i.e. `/mnt/mynas`):

        ```sh
        systemd-escape --path "<mountpoint>" --suffix=mount
        ```

        For example:

        ```sh
        systemd-escape --path "/mnt/mynas" --suffix=mount
        ```

        Sample output:

        ```
          mnt-mynas.mount
        ```

   - Add our intended mount options to the mount unit file:

     - Create the mount unit file (i.e. `mnt-mynas.mount`):

        ```sh
        sudo nano /etc/systemd/system/'<mount-unit-file>'
        ```

        For example:

        ```sh
        sudo nano /etc/systemd/system/'mnt-mynas.mount'
        ```

     - Add the following configuration to the file:

        ```ini
        [Unit]
        Description=Mount Samba share
        After=network-online.target
        Wants=network-online.target

        [Mount]
        What=//<nas-host>/<nas-share>
        Where=<mountpoint>
        Type=cifs
        Options=_netdev,nofail,mfsymlinks,credentials=/home/<user>/.config/smb/.smbcreds,vers=3.0,uid=<uid>,gid=<gid>,iocharset=utf8

        [Install]
        WantedBy=multi-user.target
        ```

        Replace the following placeholders with your own values accordingly:

        - `<nas-host>`: The hostname or IP address of the remote Samba server (i.e. `mynas`)
        - `<nas-share>`: The remote directory on the Samba server (i.e. `mydir`)
        - `<mountpoint>`: The intended mountpoint of the remote directory (i.e. `/mnt/mynas`)
        - `<user>`: The username of the user that is mounting the remote directory (i.e. `myuser`)
        - `<uid>`: The numerical value of the user's UID (i.e. `1000`)
        - `<gid>`: The numerical value of the user's GID (i.e. `1000`)

        Feel free to also omit or add to these sample mount options depending on your needs.

     - Sample mount unit file configuration:

        ```ini
        [Unit]
        Description=Mount Samba share
        After=network-online.target
        Wants=network-online.target

        [Mount]
        What=//mynas/mydir
        Where=/mnt/mynas
        Type=cifs
        Options=_netdev,nofail,mfsymlinks,credentials=/home/myuser/.config/smb/.smbcreds,vers=3.0,uid=1000,gid=1000,iocharset=utf8

        [Install]
        WantedBy=multi-user.target
        ```

7. Reload the `systemd` manager configuration for our configuration to be recognised:

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

9. **Alternatively**, enable and start the mount unit file (i.e. `mnt-mynas.mount`) to mount the remote directory immediately and on boot:

    ```sh
    sudo systemctl enable --now '<mount-unit-file>'
    ```

    For example:

    ```sh
    sudo systemctl enable --now 'mnt-mynas.mount'
    ```

---

## Unmounting a Mounted Directory

### Description

This details how to unmount a remote directory from our local machine.

### References

- [Automatic mounting: As mount entry](https://wiki.archlinux.org/title/samba#As_mount_entry)

### Steps

1. Depending on how you have [mounted the remote directory](#mounting-remote-directory), unmount it from your system:

   - If you had mounted it using the `mount` command, unmount the remote storage from the mountpoint (i.e. `/mnt/mynas`) using `umount`:

        ```sh
        sudo umount <mountpoint>
        ```

        For example:

        ```sh
        sudo umount /mnt/mynas
        ```

        If you receive an error message such as the target being busy, add the `--lazy` flag to the same command to force the unmount:

        ```sh
        sudo umount --lazy <mountpoint>
        ```

   - **Alternatively**, if you had mounted it using a `systemd` mount unit file (i.e. `mnt-mynas.mount`), unmount the remote storage by stopping the mount unit:

        ```sh
        sudo systemctl stop '<mount-unit-file>'
        ```

        For example:

        ```sh
        sudo systemctl stop 'mnt-mynas.mount'
        ```

2. Prevent the remote directory from being automatically mounted from the next boot, again, depending on how you have [mounted the remote directory](#mounting-remote-directory):

   - If you had made your mount configuration using the `fstab` file, remove it from the file:

        ```sh
        sudo nano /etc/fstab
        ```

        Remove the line that corresponds to the remote directory by deleting it or commenting it out. For example:

        ```diff
          # example.org
        - //mynas/mydir    /mnt/mynas    cifs    _netdev,nofail,mfsymlinks,credentials=/home/deck/.config/smb/.smbcreds,vers=3.0,uid=1000,gid=1000,iocharset=utf8    0 0
        + #//mynas/mydir    /mnt/mynas    cifs    _netdev,nofail,mfsymlinks,credentials=/home/deck/.config/smb/.smbcreds,vers=3.0,uid=1000,gid=1000,iocharset=utf8    0 0
        ```

   - **Alternatively**, if you had made your mount configuration using a `systemd` mount unit file (i.e. `mnt-mynas.mount`), disable the mount unit and delete its corresponding file:

        ```sh
        sudo systemctl disable '<mount-unit-file>' && sudo rm /etc/systemd/system/'<mount-unit-file>'
        ```

        For example:

        ```sh
        sudo systemctl disable 'mnt-mynas.mount' && sudo rm /etc/systemd/system/'mnt-mynas.mount'
        ```

3. Reload the `systemd` manager configuration for our configuration changes to be recognised:

    ```sh
    sudo systemctl daemon-reload
    ```

---

## Sharing a Directory Remotely

### Description

This details how to share a local directory remotely as a Samba share.

### References

- [Advanced configuration](https://wiki.archlinux.org/title/Samba#Advanced_configuration)

### Steps

1. Ensure that all necessary packages are [installed](#installation).

2. Create a basic Samba configuration to start with if one does not exist yet:

   - Create the Samba configuration file:

     ```sh
     sudo nano /etc/samba/smb.conf
     ```

   - Add and save the following configuration to the file:

     ```ini
     [global]
       follow symlinks = yes
       wide links = yes
       unix extensions = no
     ```

3. Prepare the directory that is to be shared on the system, if not already:

     ```sh
     mkdir -p <share-directory-path>
     ```

     For example, create a directory (i.e. `myshare`) on a mounted external storage (i.e. `/run/media/myuser/external-storage`):

     ```sh
     mkdir -p /run/media/myuser/external-storage/myshare
     ```

4. Create a configuration file dedicated to configuring the Samba share:

   - Create the Samba share configuration file (i.e. `myshare.conf`):

     ```sh
     sudo nano /etc/samba/<share-config-file>
     ```

     For example:

     ```sh
     sudo nano /etc/samba/myshare.conf
     ```

   - Add and save the following configuration to the Samba share configuration file:

     ```ini
     [<share-name>]
       path = <share-directory-path>
       browseable = yes
       writable = yes
       guest ok = no
       read only = no
     ```

     For example:

     ```ini
     [myshare]
       path = /run/media/myuser/external-storage/myshare
       browseable = yes
       writable = yes
       guest ok = no
       read only = no
     ```

     Feel free to update the Samba share configuration according to your needs.

   - Update the system's Samba configuration file to include the new Samba share configuration file we had just created:

     ```sh
     sudo nano /etc/samba/smb.conf
     ```

     Add the following line to the existing configuration:

     ```diff
       [global]
         follow symlinks = yes
         wide links = yes
         unix extensions = no
     +   include = <share-config-file-path>
     ```

     For example:

     ```ini
     [global]
       follow symlinks = yes
       wide links = yes
       unix extensions = no
       include = /etc/samba/myshare.conf
     ```

5. Since the Samba share was configured to require an authenticated user, create a Samba user credentials for an existing user on the system (i.e. `myuser`):

     ```sh
     sudo smbpasswd -a <username>
     ```

     For example:

     ```sh
     sudo smbpasswd -a myuser
     ```

     Set a secure password for the Samba share user when prompted.

6. Finally, start and enable the Samba service to apply the configuration changes we had made:

     ```sh
     sudo systemctl enable --now smb.service
     ```

     or restart it if it is already running:

     ```sh
     sudo systemctl restart smb.service
     ```
