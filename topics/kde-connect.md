# KDE Connect

## Description

KDE Connect is a multi-platform application developed by KDE, which facilitates wireless communications and data transfer between devices over local networks.

## Directory

- [KDE Connect](#kde-connect)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Setup](#setup)
    - [Description](#description-1)
    - [References](#references-1)
    - [Installation](#installation)
    - [Configuration](#configuration)

## References

- [KDE Connect](https://kdeconnect.kde.org)

---

## Setup

### Description

This details installing and setting up KDE Connect on your system as a means to share files and other data wirelessly between devices on the same network.

### References

- [KDEConnect UserBase](https://userbase.kde.org/KDEConnect)

### Installation

1. [Install](yay.md#install) the `kdeconnect` package using `yay` if it is not already installed.

### Configuration

1. If you have a firewall set up, make sure to allow access to the ports used by KDE Connect.

   - If your system is using `firewalld`, which comes with a GUI app, `firewall-config`, proceed with the following steps:

     - Launch the **firewall-config** app.

     - Enter your password when prompted.

     - Once the app is open, expand the **Configuration** dropdown and select **Permanent**.

     - Click the **Zones** tab and select the zone you are using. By default, it is **public**.

     - Within the **Zones** page, click the **Services** tab.

     - Locate the **kdeconnect** service and check the box next to it.

     - Click the **Options** menu on top and select the **Reload Firewalld** option.

   - If you are using a different firewall setup:

     - Allow access to the following ports and protocol:

       - TCP: `1714-1764`
       - UDP: `1714-1764`

     - Restart your firewall service for the changes to take effect.

2. **Optional** Set the KDE Connect system tray icon to be always visible.

   - Right click on the **System Tray** on your default panel (taskbar) or application menu bar.

   - Select the **Configure System Tray...** option.

   - Click the **Entries** tab.

   - Locate the **KDE Connect** entry, expand its **Visibility** dropdown, and select the `Always shown` option.

   - Click **Apply** and **OK** to save the changes.
