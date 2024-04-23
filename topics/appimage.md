# AppImage

## Description

AppImage (formerly known as klik and PortableLinuxApps) is a format for distributing portable software on Linux without needing superuser permissions to install the application.

## Directory

- [AppImage](#appimage)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Software Installation](#software-installation)
    - [Description](#description-1)
    - [References](#references-1)
    - [Steps](#steps)

## References

- [AppImage](https://appimage.org)

---

## Software Installation

### Description

This details on how to install AppImage software using Gear Lever.

### References

- [Gear Lever](https://github.com/mijorus/gearlever)

### Steps

1. Download the `AppImage` file of the software you want to install from the software's website directly. A list of apps in AppImage format can be found [here](https://appimage.github.io/apps).

2. Launch the **Gear Lever** app. [Install](flatpak.md#install) the **Gear Lever** (`it.mijorus.gearlever`) app as a Flatpak first if you haven't already.

3. Click the **+ Open** button on the top left corner of the app.

4. In the **Open File** dialog (File picker), navigate to the directory where you downloaded the `AppImage` file, select the file and click the **Open** button.

5. Next to the **Please, verify the source of this app before opening it** message, click the **Unlock** button.

6. Click the **Move to the app menu** button to finish the installation.

7. To uninstall the software, simply select the application from the **Installed applications** list within the **Gear Lever** app and click the **Remove** button.
