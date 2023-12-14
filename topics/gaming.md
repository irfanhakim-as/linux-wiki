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
  - [Custom Game Configurations](#custom-game-configurations)
    - [Description](#description-2)
    - [References](#references-1)
    - [Notes](#notes)
    - [Elden Ring](#elden-ring)
    - [Eastward](#eastward)
    - [Witcher 3 and Cyberpunk 2077](#witcher-3-and-cyberpunk-2077)

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

8. Install [ProtonUp-Qt and GE-Proton](./protonup-qt.md#setup).

9. Install [Protontricks](./protontricks.md#installation).

10. Increase the maximum number of memory map areas a process may have, some modern games require more than the kernel's default of `65530`.

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

---

## Custom Game Configurations

### Description

This details any workarounds required for games that either do not work out of the box or perform poorly on Steam (Runtime).

### References

- [If you're using an older Nvidia GPU and experiencing poor performance in Elden Ring through Proton, try this!](https://www.reddit.com/r/linux_gaming/comments/t834b0/if_youre_using_an_older_nvidia_gpu_and)
- [VKD3D-Proton - Environment variables](https://github.com/HansKristian-Work/vkd3d-proton#environment-variables)

### Notes

Generally, all Steam games are run with this **launch option** (on Steam) in order to get better performance with GameMode, and PC stats with MangoHud:

```sh
gamemoderun mangohud %command%
```

A few games however, *seems* to perform worse with GameMode, if that is the case, simply omit `gamemoderun` from the launch option command above.

### Elden Ring

- Adding the following environment variable `VKD3D_FEATURE_LEVEL=12_0` to the game's launch option fixes the white screen crash on launch:

    ```sh
    VKD3D_FEATURE_LEVEL=12_0 VKD3D_CONFIG=no_upload_hvv gamemoderun mangohud %command%
    ```

    > [!NOTE]  
    > Adding `VKD3D_CONFIG=no_upload_hvv` may/not improve game performance on NVIDIA GPUs.

- Fix controller issues with these steps in the **Steam** app:

  - Click **Steam** in the toolbar

  - Click **Settings**

  - Click **Controller**

  - Click **Desktop Configuration**

  - Select **Browse Configs**

  - Click **Templates**

  - Select **Gamepad**

  - Hit **Apply**

### Eastward

- Run the game with OpenGL.

### Witcher 3 and Cyberpunk 2077

- Skip the GOG/RED launcher when launching the game using the `--launcher-skip` flag:

    ```sh
    gamemoderun mangohud %command% --launcher-skip
    ```

- To use DX11 instead of DX12 for better performance on Witcher 3, edit the `launcher-configuration.json` file found in the game's folder and update the `fallback` value to `DirectX 11`:

    ```json
    "fallback": "DirectX 11"
    ```
