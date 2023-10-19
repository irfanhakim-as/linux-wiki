# Gaming

## Description

This details all matters pertaining PC gaming.

## Directory

- [Gaming](#gaming)
  - [Description](#description)
  - [Directory](#directory)
  - [Setup](#setup)
    - [Description](#description-1)
    - [References](#references)
    - [Steps](#steps)

---

## Setup

### Description

This guide goes through setting up packages and configuration options that could help improve our PC gaming experience.

### References

- [Gaming #101](https://discovery.endeavouros.com/gaming/gaming-101/2022/01)
- [Increasing The Maximum Number Of Memory Map Areas A Process May Have](https://github.com/ValveSoftware/Proton/wiki/Requirements#increasing-the-maximum-number-of-memory-map-areas-a-process-may-have)

### Steps

1. Install Steam:

    ```sh
    yay -S steam
    ```

2. Install Vulkan:

    ```sh
    yay -S vulkan-icd-loader lib32-vulkan-icd-loader
    ```

3. Install NVIDIA specific Vulkan:

    ```sh
    yay -S nvidia-utils lib32-nvidia-utils
    ```

4. Install GameMode:

    ```sh
    yay -S gamemode lib32-gamemode
    ```

5. Install MangoHud:

    ```sh
    yay -S mangohud lib32-mangohud
    ```

6. If a Ryzen CPU is in use (at least for Zen 3), `zenpower3` is needed to get CPU wattage readings:

    ```sh
    yay -S zenpower3-dkms
    ```

7. To enable GameMode and MangoHud in a Steam Game, add this to the game's **Launch Options** (in the game's Steam **Properties**):

    ```sh
    gamemoderun mangohud %command%
    ```

8. Install ProtonUp-Qt:

    ```sh
    yay -S protonup-qt
    ```

    After installing ProtonUp-Qt, launch it and proceed to install the latest **Proton-GE** to the correct Steam directory.

9. Increase the maximum number of memory map areas a process may have, some modern games require more than the kernel's default of `65530`.

    Check the current value:

    ```sh
    sysctl vm.max_map_count
    ```

    Set a higher value with:

    ```sh
    sudo sysctl vm.max_map_count=2147483642
    ```

    Make that increased value persistent across reboots by creating a `/etc/sysctl.d/99-max-map-count.conf` file with content:

    ```conf
    vm.max_map_count = 2147483642
    ```
