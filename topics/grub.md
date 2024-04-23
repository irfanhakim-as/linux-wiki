# GRUB

## Description

GNU GRUB is a [Multiboot](https://www.gnu.org/software/grub/manual/multiboot/multiboot.html) boot loader. It was derived from GRUB, the **GRand Unified Bootloader**, which was originally designed and implemented by Erich Stefan Boleyn.

## Directory

- [GRUB](#grub)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Generate GRUB Config](#generate-grub-config)
    - [Description](#description-1)
    - [Steps](#steps)
  - [Dual Booting](#dual-booting)
    - [Description](#description-2)
    - [References](#references-1)
    - [Steps](#steps-1)
  - [Theme Customisation](#theme-customisation)
    - [Description](#description-3)
    - [References](#references-2)
    - [Steps](#steps-2)

## References

- [GNU GRUB](https://www.gnu.org/software/grub/index.html)

---

## Generate GRUB Config

### Description

This details how to generate a new GRUB config.

### Steps

Generate a new GRUB config:

```sh
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

---

## Dual Booting

### Description

This details how we can enable dual booting into Windows or another Linux install.

### References

- [Grub dual booting](https://discovery.endeavouros.com/grub-and-refind/grub-dual-booting/2021/07)

### Steps

1. [Install](yay.md#install) the `os-prober` package using `yay`.

2. Update the GRUB config `/etc/default/grub`:

    ```sh
    sudo nano /etc/default/grub
    ```

    Update the value of the following line from `true` to `false`:

    ```
    GRUB_DISABLE_OS_PROBER=false
    ```

3. [Regenerate a new GRUB config](#generate-grub-config).

---

## Theme Customisation

### Description

This details how to change the theme/appearance of the GRUB bootloader.

### References

- [Change grub theme](https://forum.endeavouros.com/t/change-grub-theme/535)
- [distro-grub-themes](https://github.com/AdisonCavani/distro-grub-themes#manual-installation)

### Steps

1. Clone the `distro-grub-themes` repository:

    ```sh
    git clone https://github.com/AdisonCavani/distro-grub-themes.git
    ```

2. Create the themes directory:

    ```sh
    sudo mkdir -p /boot/grub/themes
    ```

3. Copy the desired theme (i.e. `arch`) to the themes directory:

    ```sh
    sudo cp -r distro-grub-themes/customize/arch /boot/grub/themes
    ```

4. Update the GRUB config `/etc/default/grub`:

    ```sh
    sudo nano /etc/default/grub
    ```

    Add the following line to the config:

    ```sh
    GRUB_THEME="/boot/grub/themes/arch/theme.txt"
    ```

    > [!NOTE]  
    > Replace `arch` with the actual name of the theme you copied.

    Be sure to comment any other `GRUB_BACKGROUND` and `GRUB_THEME` lines to avoid conflicts.

5. [Regenerate a new GRUB config](#generate-grub-config).
