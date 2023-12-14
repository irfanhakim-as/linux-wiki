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
  - [Link's Awakening DX HD](#links-awakening-dx-hd)
    - [Description](#description-3)
    - [References](#references-2)
    - [Steps](#steps-1)

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

---

## Link's Awakening DX HD

### Description

This details how to install and run the Link's Awakening DX HD _port_.

> [!NOTE]  
> Parts of this guide assumes that you are using the KDE Plasma desktop environment.

### References

- [Link's Awakening DX HD](https://linksawakeningdxhd.itch.io/links-awakening-dx-hd)
- [How to play Link's Awakening DX HD on Steam Deck](https://overkill.wtf/how-to-play-legend-of-zelda-links-awakening-dx-native-pc-port-on-steam-deck)

### Steps

1. [Install and setup](./protontricks.md#installation) the **Protontricks** Flatpak if you haven't already as it will be required.

2. Visit the [Link's Awakening DX HD](https://linksawakeningdxhd.itch.io/links-awakening-dx-hd) page on a web browser.

3. Click the **Download** button to download the game.

    > [!NOTE]  
    > If you receive a "This Page Has Been Quarantined" warning message, expand the **I understand the risks, let me download anyway...** section and click the **Download** button from there.

4. Unzip the downloaded file:

   - Launch the **Dolphin** application.

   - Navigate to where the game's zip file was downloaded to i.e. the **Downloads** directory.

   - Select and right click the zip file.

   - Hover over the **Extract** section, and select the **Extract archive here** option.

5. Delete the zip file as it is no longer needed.

6. Move the extracted game folder (i.e. **Links Awakening DX HD**) to a suitable directory (i.e. `~/Games`).

    Create the destination directory beforehand if it does not yet exist:

    ```sh
    mkdir -p ~/Games
    ```

7. In the **Links Awakening DX HD** folder, select and right click the **Link's Awakening DX HD.exe** file.

8. Select the **Add to Steam** context menu option.

    > [!NOTE]  
    > If the **Add to Steam** context menu option is not available to you (i.e. on non-SteamOS distros), you will need to add the `.exe` file to Steam manually.

9.  Launch the **Steam** application.

10. Find the **Link's Awakening DX HD.exe** application from the **Library** section.

11. Select and right click the application.

12. Click the **Properties** context menu option.

13. In the newly opened **Properties** window:

    - Navigate to the **Shortcut** section.

    - Update the name of the application to `Link's Awakening DX HD`.

    - Navigate to the **Compatibility** section.

    - Check the **Force the use of a specific Steam Play compatibility tool** checkbox.

    - Select **Proton Experimental** from the dropdown menu.

14. Close the **Properties** window.

15. Launch the game from Steam by hitting the **Play** button.

16. When met with an error message saying that _the `.NET` runtime needs to be installed_, proceed to download the `.NET` installer.

17. Once the `.NET` installer has been downloaded through your default browser, select and right click the `.NET` installer from your **Downloads** directory using **Dolphin**.

18. Select the **Open with Protontricks** context menu option.

19. In the newly opened **Protontricks** application, locate and select the **Non-Steam shortcut: Link's Awakening DX HD: RANDOM_NUMBER** menu item.

20. Click the **OK** button.

21. When prompted to install the `.NET` **Windows Desktop Runtime**, click the **Install** button.

22. Once the installation is done, you may delete the downloaded `.NET` installer file and launch the game from Steam.

    > [!NOTE]  
    > You may also make optional aesthetic changes to the game on Steam such as adding custom artwork (i.e. using [SteamGridDB](./decky-loader.md#plugin-installation) on a SteamOS based distro).
