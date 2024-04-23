# Vorta

## Description

Vorta is a backup client for macOS and Linux desktops. It integrates the mighty BorgBackup with your desktop environment to protect your data from disk failure, ransomware and theft.

## Directory

- [Vorta](#vorta)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Installation](#installation)
    - [Description](#description-1)
    - [References](#references-1)
    - [Steps](#steps)
  - [Setup](#setup)
    - [Description](#description-2)
    - [Steps](#steps-1)

## References

- [Vorta](https://github.com/borgbase/vorta)

---

## Installation

### Description

This installs Vorta as a Flatpak.

### References

- [Flathub - Vorta](https://flathub.org/apps/com.borgbase.Vorta)

### Steps

1. [Install](flatpak.md#install) the **Vorta** (`com.borgbase.Vorta`) app as a Flatpak.

---

## Setup

### Description

This sets up Vorta to its ideal configurations.

### Steps

1. Set the **Repository**. In this example we'll use a Samba Share mountpoint as the Vorta repository, but this can also be set to any directory on any drives in your system:

    ```
    /mnt/mynas/System/Backups/Snapshots/mycomputer
    ```

2. Set backup **Source Folders and Files** to our home directory:

    ```
    /home/${USER}
    ```

    Replace `${USER}` with your actual username.

3. Set **Exclude Patterns**:

    ```
    *[Cc]ache*/*
    *[Cc]aches*/*
    */.thumbnails/*
    */.local/share/[Tt]rash*
    *.backup*
    *~
    *.dropbox*
    /proc/*
    /sys/*
    /dev/*
    /run/*
    /etc/mtab
    /var/cache/*
    */lost+found/*
    /tmp/*
    /var/tmp/*
    /var/backups/*
    .Private
    ```

    Add any additional directories or files you wish to exclude from the backup (i.e. `~/Videos/Handbrake/*`).

4. Set **Exclude if Present**:

    ```
    .nobackup
    ```

5. Configure **Schedule**:

    ```
    ✅ Backup periodically every 3 hours
    ✅ Run missed backups on startup or wakeup
    ✅ Prune after each backup
    ✅ Validate repo data on a 2-week interval
    ```

6. Leave **Archives/Prune** options as default.

7. Leave **Misc** by default except these:

    ```
    ✅ Notify about successful background tasks
    ✅ Automatically start Vorta at login
    ❎ Open main window on startup
    ```
