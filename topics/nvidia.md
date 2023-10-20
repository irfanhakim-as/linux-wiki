# Nvidia

## Description

Nvidia is a software and fabless company which designs graphics processing units (GPUs), application programming interface (APIs) for data science and high-performance computing as well as system on a chip units (SoCs) for the mobile computing and automotive market.

## Directory

- [Nvidia](#nvidia)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [GreenWithEnvy](#greenwithenvy)
    - [Description](#description-1)
    - [References](#references-1)
    - [Steps](#steps)

## References

- [Nvidia](https://www.nvidia.com)

---

## GreenWithEnvy

### Description

This details setting up GreenWithEnvy, a system utility for controlling NVIDIA GPUs.

### References

- [GreenWithEnvy](https://gitlab.com/leinardi/gwe)

### Steps

1. Install GreenWithEnvy as a Flatpak:

    ```sh
    flatpak install --user com.leinardi.gwe
    ```

2. Set it to autostart hidden in the system tray:

    - Add GreenWithEnvy to the list of [autostart](autostart.md#add-application-to-autostart) applications.

    - Update its **Arguments** as the following:

        ```sh
        run --branch=stable --arch=x86_64 --command=/app/bin/gwe --file-forwarding com.leinardi.gwe --hide-window @@u %U @@
        ```

3. TODO: Configure the fan profile
