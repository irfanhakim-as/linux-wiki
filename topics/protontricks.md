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

1. [Install](flatpak.md#install) the **Protontricks** (`com.github.Matoking.protontricks`) app as a Flatpak.

2. By default, Protontricks will only have access to your Steam library.

    To allow it access to additional directories (i.e. `/run/media` so it has access to your external drive/SD card on a Steam Deck), you will need to [add the following permission override](./flatpak.md#add-permission-overrides):

    - Select the **Protontricks** application.

    - Under **Other files** in the **Filesystem** section, add and expose the intended path(s) (i.e. `/run/media`).

    - Close the **Flatseal** application.

3. Launch the **Protontricks** application to start using it.
