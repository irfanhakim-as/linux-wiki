# Back In Time

## Description

It is an easy-to-use backup tool for files and folders. It runs on GNU Linux and provides a command line tool `backintime` and a Qt5 GUI `backintime-qt` both written in Python3.

> [!IMPORTANT]  
> This guide is INCOMPLETE and this software is not necessarily endorsed!

## Directory

- [Back In Time](#back-in-time)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Setup](#setup)
    - [Description](#description-1)
    - [References](#references-1)
    - [Steps](#steps)

## References

- [Back In Time](https://github.com/bit-team/backintime)

---

## Setup

### Description

This details how to install and setup Back In Time as a backup solution used with a Samba share.

### References

- [Enable symlink following](https://wiki.archlinux.org/title/samba#Enable_symlink_following)
- [Unable to start backup](https://github.com/bit-team/backintime/issues/1253#issuecomment-1126770876)

### Steps

1. Install the `backintime` package using `yay`:

    ```sh
    yay -S backintime
    ```

2. Install the `encfs` package for enabling encryption:

    ```sh
    yay -S encfs
    ```

3. Enable symlink following to our Samba share.

    Create a `/etc/samba/smb.conf` file:

    ```sh
    sudo nano /etc/samba/smb.conf
    ```

    Add the following lines to the `smb.conf` configuration file:

    ```sh
    [global]
    follow symlinks = yes
    wide links = yes
    unix extensions = no
    ```
