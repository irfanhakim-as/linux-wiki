# Protontricks

## Description

A wrapper that runs Winetricks commands for Proton enabled games among other useful features, requires Winetricks.

## Directory

- [Protontricks](#protontricks)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Installation](#installation)
    - [Description](#description-1)
    - [References](#references-1)
    - [Steps](#steps)

## References

- [Protontricks](https://github.com/Matoking/protontricks)

---

## Installation

### Description

This details how to install and setup Protontricks.

### References

- [Installation](https://github.com/Matoking/protontricks#installation)

### Steps

1. [Install](./plasma-discover.md#software-installation-and-update) the [Protontricks](https://flathub.org/apps/com.github.Matoking.protontricks) Flatpak (as a user).

2. By default, Protontricks will only have access to your Steam library.

    To allow it access to additional directories (i.e. `/run/media` so it has access to your external drive/SD card on a Steam Deck), you will need to [add the following permission override](./flatpak.md#add-permission-overrides):

    - Select the **Protontricks** application.

    - Under **Other files** in the **Filesystem** section, add and expose the intended path (i.e. `/run/media`).

    - Close the **Flatseal** application.

3. Launch the **Protontricks** application to start using it.
