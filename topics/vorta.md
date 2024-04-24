# Vorta

> [!NOTE]  
> This topic mostly or entirely pertains to Vorta version `0.9` and may not have been updated for newer versions.

## Description

Vorta is a backup client for macOS and Linux desktops. It integrates the mighty BorgBackup with your desktop environment to protect your data from disk failure, ransomware and theft.

## Directory

- [Vorta](#vorta)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Setup](#setup)
    - [Description](#description-1)
    - [References](#references-1)
    - [Installation](#installation)
    - [Configuration](#configuration)
  - [Usage](#usage)
    - [Description](#description-2)
    - [References](#references-2)
    - [Create a Backup](#create-a-backup)
    - [Mount an Archive](#mount-an-archive)
    - [Restore Files](#restore-files)

## References

- [Vorta](https://github.com/borgbase/vorta)

---

## Setup

### Description

This details installing and setting up Vorta to have it backup our personal files.

### References

- [Flathub - Vorta](https://flathub.org/apps/com.borgbase.Vorta)

### Installation

1. [Install](flatpak.md#install) the **Vorta** (`com.borgbase.Vorta`) app as a Flatpak.

### Configuration

1. Launch the **Vorta** app.

2. Set the repository to store our backups.

    - Click on the **Repository** tab.

    - Click the **+** button and select the **New Repository...** option.

    - In the **Add New Repository** window:

      - Fill in the following fields in the **General** tab:

        - **Repository URL**: Add in the full path to where you wish to store your backups.
        - **Repository Name**: Add a descriptive name for the repository.
        - **Enter passphrase**: Add a secure passphrase to encrypt the repository.
        - **Confirm passphrase**: Confirm the passphrase provided.

      - In the **Advanced** tab:

        - **SSH Key**: Select an SSH key if you require using SSH to access the repository.
        - **Encryption**: Leave as default.
        - **Extra Borg Arguments**: Leave as default.

      - Click the **Add** button to finish adding the repository.

3. Set our source folders and files to backup.

    - Click on the **Sources** tab.

    - Click the **+** button and select the **Files** or **Folders** option.

    - Use the file browser portal to navigate and select the files or folders you wish to backup.

        > [!TIP]  
        > For the best protection, add your home directory as the sole source to have all your personal files backed up.

    - Click the **Open** or **OK** button each time you have selected a file or folder to add them to the backup list.

4. Manage things to exclude from the backup.

    - In the same **Sources** tab, click the **Manage Excluded Items...** button.

    - In the **Add patterns to exclude** window, click the **Raw** tab.

    - In the provided field, paste the following patterns to exclude:

        ```sh
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

        You may also add any other patterns or paths you wish to exclude from the backup to this list, one per line.

    - Click the **Close** button to finalise the exclusion list.

5. Set the backup schedule.

    - Click on the **Schedule** tab.

    - Expand the **Schedule** section and configure the following:

        - **Backup schedule**:

          - Manual only: `Unchecked`.
          - Backup periodically: `Checked`.
            - Interval: `3 Hours`.
          - Backup daily: `Unchecked`.
            - Time: `Empty`.

        - **Autopruning**:

          - Prune after each backup: `Checked`.

        - **Validation**:

          - Validate repository data: `Checked`.
            - Interval: `2 Weeks`.

        - **Missed backups**:

          - Run missed backups on startup or wakeup: `Checked`.

6. Configure the rest of the application settings.

    - Click on the **Settings/About** button.

    - Navigate to the **Settings** tab and configure the following:

      - **Information**:

        - Get statistics of file/folder when added: `Checked`.
        - Use the same unit of measurement for archive sizes: `Unchecked`.

      - **Notifications**:

        - Display notifications when background tasks fail: `Checked`.
        - Notify about successful background tasks: `Checked`.

      - **Security**:

        - Store repository passwords in system keychain, if available: `Checked`.
        - Try to replace file permissions when mounting an archive: `Unchecked`.

      - **Startup**:

        - Automatically start Vorta at login: `Checked`.
        - Show main window of Vorta on launch: `Unchecked`.

---

## Usage

### Description

This details using Vorta to backup our files and restore them when needed.

### References

- [Using Vorta](https://vorta.borgbase.com/usage)

### Create a Backup

1. Launch the **Vorta** app.

2. In the **Repository** tab, expand the **Repository** dropdown, and select the repository you wish to backup to.

3. Click the **Start Backup** button to begin the backup process.

4. Wait for the backup process to complete.

### Mount an Archive

1. Create a folder somewhere you wish to mount the archive to using your file browser or the following command:

    ```sh
    mkdir -p ~/vorta-mount
    ```

    In this example, the directory we have made as the mount point is `~/vorta-mount`.

2. In the **Archives** tab, select the archive you wish to mount.

3. Click the **Mount** button located on the right side of the app.

4. In the newly opened file browser portal, select the folder you have prepared as the mount point, and click the **OK** button.

5. Wait for the archive to be mounted to the folder you have selected.

    The archive is ready once the app shows the message, `Mounted successfully.`.

6. Once you are done with the archive, ensure that the mounted archive is selected in the **Archives** list, and click the **Unmount** button to safely unmount the archive.

    The app will show the message, `Un-mounted successfully.` once the archive has been unmounted.

### Restore Files

1. [Mount](#mount-an-archive) the archive you wish to restore files from.

2. Navigate to the mounted archive using your file browser.

3. Copy any files or folders you wish to restore from the mounted archive to their destination on your system.

4. Once you have restored all the files you need, unmount the archive.
