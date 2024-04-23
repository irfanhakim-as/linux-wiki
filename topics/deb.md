# Deb

## Description

deb is the format, as well as filename extension of the software package format for the Debian Linux distribution and its derivatives.

## Directory

- [Deb](#deb)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Package Installation](#package-installation)
    - [Description](#description-1)
    - [References](#references-1)
    - [Steps](#steps)

## References

- [deb (file format)](https://en.wikipedia.org/wiki/Deb_(file_format))

---

## Package Installation

### Description

This details how to install deb packages on Arch Linux based systems.

> [!IMPORTANT]  
> This guide is targeted at Arch Linux based systems.

### References

- [Convert deb package](https://unix.stackexchange.com/a/457734)

### Steps

> [!CAUTION]  
> Installing deb packages in an Arch Linux based system is not recommended!

1. [Install](yay.md#install) the `debtap` package using `yay`.

2. Update the `debtap` database:

    ```sh
    sudo debtap -u
    ```

3. Convert the deb package to a format that is installable by `pacman`.

    Assuming the deb package name is `package_name.deb`:

    ```sh
    debtap package_name.deb
    ```

4. By the end of the conversion, there should be a `pkg` file of the converted package.

    Assuming the resulting `pkg` file is `package_name.pkg`, install it using `pacman`:

    ```sh
    sudo pacman -U package_name.pkg
    ```

5. If you wish to uninstall the package, use the following command:

    ```sh
    sudo pacman -R package_name
    ```

    This assumes that the package name is `package_name`.
