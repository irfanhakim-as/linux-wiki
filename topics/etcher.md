# BalenaEtcher

## Description

This is a brief description of the topic.

## Directory

- [BalenaEtcher](#balenaetcher)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Installation](#installation)
    - [Description](#description-1)
    - [Steps](#steps)
  - [Flashing an ISO](#flashing-an-iso)
    - [Description](#description-2)
    - [Steps](#steps-1)

## References

- [Etcher](https://github.com/balena-io/etcher)
- [balenaEtcher](https://etcher.balena.io)

---

## Installation

### Description

This details how to install BalenaEtcher as an AppImage.

### Steps

1. Head to BalenaEtcher's [**Download Etcher**](https://etcher.balena.io/#download-etcher) section on their website.

2. Click the **Download** link corresponding to the **Etcher for Linux x64 (64-bit) (AppImage)** asset, this will download an `AppImage` file with a name similar to `balenaEtcher-<version_number>-x64.AppImage`.

3. Install the `balenaEtcher-<version_number>-x64.AppImage` file using [Gear Lever](../topics/appimage.md#software-installation).

---

## Flashing an ISO

### Description

This details how to use BalenaEtcher to flash an ISO file to a USB drive.

### Steps

> [!IMPORTANT]  
> Please ensure that the USB drive you wish to flash to has enough storage capacity to hold the ISO file.

1. Launch the **BalenaEtcher** app.

2. Click the **Flash from file** button.

3. In the **Portal** dialog (File picker), navigate to the directory where you downloaded the ISO file, select the file and click the **Open** button.

4. Click the **Select target** button.

5. Select the checkbox corresponding to the USB drive you wish to flash to and click the **Select** button.

> [!CAUTION]  
> The flashing process will wipe the USB drive clean!

6. Click the **Flash!** button and wait for the flashing process to complete.
