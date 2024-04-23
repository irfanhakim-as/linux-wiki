# Yay

## Description

Yet Another Yogurt - An AUR Helper Written in Go.

> [!NOTE]  
> Parts of this guide uses `pacman` commands.

## Directory

- [Yay](#yay)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Installation](#installation)
    - [Description](#description-1)
    - [References](#references-1)
    - [Steps](#steps)
  - [Usage](#usage)
    - [Description](#description-2)
    - [Install](#install)
    - [Update](#update)
    - [Uninstall](#uninstall)
    - [Query](#query)

## References

- [Yay](https://github.com/Jguer/yay)
- [AUR helpers](https://wiki.archlinux.org/title/AUR_helpers)

---

## Installation

### Description

This details how to install Yay, a very necessary tool for installing AUR packages on Arch Linux based systems.

### References

- [Installation](https://github.com/Jguer/yay#installation)
- [First Use](https://github.com/Jguer/yay#first-use)

### Steps

1. Install `git` and the `base-devel` package group:

    ```sh
    sudo pacman -S --needed git base-devel
    ```

2. Clone the `yay` `git` repository to the home directory:

    ```sh
    git -C ~ clone https://aur.archlinux.org/yay.git
    ```

3. Enter the `yay` directory:

    ```sh
    cd ~/yay
    ```

4. Install `yay`:

    ```sh
    makepkg -si
    ```

5. Remove the `yay` directory:

    ```sh
    rm -rf ~/yay
    ```

6. For initial use post-installation, do the following:

    Generate a development package database for `*-git` packages that were installed without `yay`:

    ```sh
    yay -Y --gendb
    ```

    Check for development package updates:

    ```sh
    yay -Syu --devel
    ```

    Make development package updates permanently enabled (`yay` and `yay -Syu` will then always check dev packages):

    ```sh
    yay -Y --devel --save
    ```

---

## Usage

> [!IMPORTANT]  
> If you are running on a distribution that is unable to use `pacman` or `yay` (i.e. Immutable systems, non-Arch Linux systems), [install](#installation) and use `yay` on an Arch Linux based container through [Distrobox](distrobox.md).

> [!NOTE]  
> Replace `<package>` with the actual name of the package you wish to search, install, or update.

### Description

This details how to use `yay` to search, install, update, or uninstall packages on Arch Linux.

### Install

1. To install a package:

    ```sh
    yay -S <package>
    ```

    Add the `--noconfirm` flag to skip any prompts for input.

    Add the `--needed` flag to skip the installation if the package is already installed.

2. To install multiple packages, simply append the package names to the same command:

    ```sh
    yay -S <package1> <package2> <package3>
    ```

### Update

1. To update a package:

    ```sh
    yay -Syu <package>
    ```

2. To update all packages:

    ```sh
    yay -Syu
    ```

### Uninstall

1. To uninstall a package:

    ```sh
    yay -Rns <package>
    ```

2. To uninstall orphaned packages:

    ```sh
    sudo pacman -Rns (pacman -Qtdq)
    ```

### Query

1. To search for a package:

    ```sh
    yay -Ss <package>
    ```
