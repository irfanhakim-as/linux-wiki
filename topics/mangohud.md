# MangoHud

## Description

A Vulkan and OpenGL overlay for monitoring FPS, temperatures, CPU/GPU load and more.

## Directory

- [MangoHud](#mangohud)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Setup](#setup)
    - [Description](#description-1)
    - [Steps](#steps)

## References

- [MangoHud](https://github.com/flightlessmango/MangoHud)

---

## Setup

### Description

This details the installation and basic configuration of MangoHud.

### Steps

1. [Install](yay.md#install) **MangoHud** (`mangohud lib32-mangohud`) using `yay`.

2. Configure the MangoHud overlay:

   - Create the configuration directory:

        ```sh
        mkdir -p ~/.config/MangoHud
        ```

   - Create the configuration file:

        ```sh
        nano ~/.config/MangoHud/MangoHud.conf
        ```

   - Copy the content of the sample [MangoHud.conf](../attachments/MangoHud.conf) file and paste it into the configuration file.

   - Make your own modifications and add in your own values to the configuration file as you see fit, then save the file.

3. Enable MangoHud for a Steam game by adding `mangohud` to the game's **Launch Options** on Steam. For example:

    ```sh
    mangohud %command%
    ```
