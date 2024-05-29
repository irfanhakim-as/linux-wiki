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
  - [Ocarina of Time](#ocarina-of-time)
    - [Description](#description-4)
    - [References](#references-3)
    - [Steps](#steps-2)
  - [Majora's Mask](#majoras-mask)
    - [Description](#description-5)
    - [References](#references-4)
    - [Steps](#steps-3)

---

## Setup

### Description

This guide goes through setting up packages and configuration options that could help improve our PC gaming experience.

### References

- [Gaming #101](https://discovery.endeavouros.com/gaming/gaming-101/2022/01)
- [Increasing The Maximum Number Of Memory Map Areas A Process May Have](https://github.com/ValveSoftware/Proton/wiki/Requirements#increasing-the-maximum-number-of-memory-map-areas-a-process-may-have)

### Steps

1. [Install](yay.md#install) **Steam** (`steam`) using `yay`.

2. [Install](yay.md#install) **Vulkan** (`vulkan-icd-loader lib32-vulkan-icd-loader`) using `yay`.

3. [Install](yay.md#install) **Vulkan for NVIDIA** (`nvidia-utils lib32-nvidia-utils`) using `yay`.

4. [Install](yay.md#install) **GameMode** (`gamemode lib32-gamemode`) using `yay`.

5. Install and configure [MangoHud](mangohud.md#setup).

6. If a Ryzen CPU is in use (at least for Zen 3), [install](yay.md#install) the `zenpower3-dkms` package using `yay` to get CPU wattage readings.

7. To enable GameMode and MangoHud in a Steam Game, add this to the game's **Launch Options** (in the game's Steam **Properties**):

    ```sh
    gamemoderun mangohud %command%
    ```

8. Install [ProtonUp-Qt and GE-Proton](protonup-qt.md#setup).

9. Install [Protontricks](protontricks.md#installation).

10. Increase the maximum number of memory map areas a process may have, some modern games require more than the kernel's default of `65530`.

    - Check the current value:

        ```sh
        sysctl vm.max_map_count
        ```

    - Set a higher value with:

        ```sh
        sudo sysctl vm.max_map_count=2147483642
        ```

    - Make that increased value persistent across reboots by creating a `99-max-map-count.conf` configuration file:

        Create the file:

        ```sh
        sudo nano /etc/sysctl.d/99-max-map-count.conf
        ```

        Add the following value to the file:

        ```conf
        vm.max_map_count = 2147483642
        ```

        Save and exit the file.

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
    > Adding `VKD3D_CONFIG=no_upload_hvv` may or may not improve gaming performance on NVIDIA GPUs.

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

> [!NOTE]  
> Parts of this guide assumes that you are using the KDE Plasma desktop environment.

### Description

This details how to install and run the Link's Awakening DX HD _port_.

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

    > [!TIP]  
    > The **Add to Steam** context menu option may be under the **Actions** section in the right click context menu.

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

---

## Ocarina of Time

> [!NOTE]  
> Parts of this guide assumes that you are using the KDE Plasma desktop environment.

> [!IMPORTANT]  
> You will need the original ROM file to run the game, source them legally prior to following this guide.

### Description

This details how to install and run the Ocarina of Time PC _port_, Ship of Harkinian.

### References

- [Ship of Harkinian](https://www.shipofharkinian.com)
- [Shipwright](https://github.com/HarbourMasters/Shipwright)
- [How to Set Up Zelda: Ocarina of Time PC Port on Steam Deck](https://steamdeckhq.com/tips-and-guides/how-to-set-up-zelda-ocarina-of-time-pc-port-on-steam-deck)

### Steps

1. Visit the Ship of Harkinian latest [releases](https://github.com/HarbourMasters/Shipwright/releases/latest) page on a web browser.

2. Click and download the **SoH-MacReady-Foxtrot-Linux-Performance.zip** file from the list of **Assets**.

3. Unzip the downloaded file:

   - Launch the **Dolphin** application.

   - Navigate to where the game's zip file was downloaded to i.e. the **Downloads** directory.

   - Select and right click the zip file.

   - Hover over the **Extract** section, and select the **Extract archive here, autodetect subfolder** option.

4. Delete the zip file as it is no longer needed.

5. Move the extracted game folder (i.e. **SoH-MacReady-Foxtrot-Linux-Performance**) to a suitable directory (i.e. `~/Games`).

    Create the destination directory beforehand if it does not yet exist:

    ```sh
    mkdir -p ~/Games
    ```

6. Copy your legally obtained copy of the original **Ocarina of Time** ROM file (in a compatible format i.e. `.z64`) to the **SoH-MacReady-Foxtrot-Linux-Performance** folder.

    You should check the `SHA1` hash of the original ROM file to check that it is compatible with Ship of Harkinian:

    ```sh
    sha1sum <ROM_FILE>
    ```

    and verify that the `SHA1` hash matches with one of the ROM files listed in Ship of Harkinian's [list](https://raw.githubusercontent.com/HarbourMasters/Shipwright/develop/docs/supportedHashes.json).

    > [!NOTE]  
    > In our example, our ROM file has a `SHA1` sum of `cfbb98d392e4a9d39da8285d10cbef3974c2f012`.

7. Double click the **soh.appimage** file in the **SoH-MacReady-Foxtrot-Linux-Performance** folder to run it once for it to generate the necessary files.

    > [!WARNING]  
    > If you receive an error message stating `For Security reasons, launching executables is not allowed in this context` on the **Dolphin** app, follow the steps below to resolve it.

    To resolve the aforementioned error:

    - Click Dolphin's **Hamburger** menu.
    - Hover over the **Configure** section and select the **Configure Dolphin...** option.
    - In the **General** view, click the **Confirmations** tab.
    - Set the **When opening an executable file** option to `Always ask`.
    - Click the **Apply** button and **OK** to save your changes.
    - Retry running the **soh.appimage** file.
    - When prompted by Dolphin, click the **Execute** button, and then again click the **Continue** button.

8. Once the game has finished generating the necessary `OTR` files and the game has been launched in a new window, close the game by clicking the **X** button in the top right corner of the window.

9.  Right click the **soh.appimage** file and select the **Add to Steam** context menu option.

    > [!TIP]  
    > The **Add to Steam** context menu option may be under the **Actions** section in the right click context menu.

    > [!NOTE]  
    > If the **Add to Steam** context menu option is not available to you (i.e. on non-SteamOS distros), you will need to add the `.appimage` file to Steam manually.

10. Launch the **Steam** application.

11. Find the **soh.appimage** application from the **Library** section.

12. Select and right click the application.

13. Click the **Properties** context menu option.

14. In the newly opened **Properties** window:

    - Navigate to the **Shortcut** section.

    - Update the name of the application to `The Legend of Zelda: Ocarina of Time`.

15. Close the **Properties** window.

16. You have now completed the installation and may launch the game from Steam.

    > [!NOTE]  
    > You may also make optional aesthetic changes to the game on Steam such as adding custom artwork (i.e. using [SteamGridDB](./decky-loader.md#plugin-installation) on a SteamOS based distro).

---

## Majora's Mask

> [!NOTE]  
> Parts of this guide assumes that you are using the KDE Plasma desktop environment.

> [!IMPORTANT]  
> You will need the original ROM file to run the game, source them legally prior to following this guide.

### Description

This details how to install and run the Majora's Mask PC _port_, 2 Ship 2 Harkinian.

### References

- [2 Ship 2 Harkinian](https://github.com/HarbourMasters/2ship2harkinian)

### Steps

1. Visit the 2 Ship 2 Harkinian latest [releases](https://github.com/HarbourMasters/2ship2harkinian/releases/latest) page on a web browser.

2. Click and download the **2Ship-Rika-Alfa-Linux.zip** file from the list of **Assets**.

3. Unzip the downloaded file:

   - Launch the **Dolphin** application.

   - Navigate to where the game's zip file was downloaded to i.e. the **Downloads** directory.

   - Select and right click the zip file.

   - Hover over the **Extract** section, and select the **Extract archive here, autodetect subfolder** option.

4. Delete the zip file as it is no longer needed.

5. Move the extracted game folder (i.e. **2Ship-Rika-Alfa-Linux**) to a suitable directory (i.e. `~/Games`).

    Create the destination directory beforehand if it does not yet exist:

    ```sh
    mkdir -p ~/Games
    ```

6. Copy your legally obtained copy of the original **Majora's Mask** ROM file (in a compatible format i.e. `.z64`) to the **2Ship-Rika-Alfa-Linux** folder.

    You should check the `MD5` hash of the original ROM file to check that it is compatible with 2 Ship 2 Harkinian:

    ```sh
    md5sum <ROM_FILE>
    ```

    and verify that the `MD5` hash matches with a compatible ROM file.

    > [!NOTE]  
    > In our example, our ROM file has a `MD5` sum of `2a0a8acb61538235bc1094d297fb6556`.

7. Double click the **2ship.appimage** file in the **2Ship-Rika-Alfa-Linux** folder to run it once for it to generate the necessary files.

    > [!WARNING]  
    > If you receive an error message stating `For Security reasons, launching executables is not allowed in this context` on the **Dolphin** app, follow the steps below to resolve it.

    To resolve the aforementioned error:

    - Click Dolphin's **Hamburger** menu.
    - Hover over the **Configure** section and select the **Configure Dolphin...** option.
    - In the **General** view, click the **Confirmations** tab.
    - Set the **When opening an executable file** option to `Always ask`.
    - Click the **Apply** button and **OK** to save your changes.
    - Retry running the **2ship.appimage** file.
    - When prompted by Dolphin, click the **Execute** button, and then again click the **Continue** button.

8. Once the game has finished generating the necessary `OTR` files and the game has been launched in a new window, close the game by clicking the **X** button in the top right corner of the window.

9.  Right click the **2ship.appimage** file and select the **Add to Steam** context menu option.

    > [!TIP]  
    > The **Add to Steam** context menu option may be under the **Actions** section in the right click context menu.

    > [!NOTE]  
    > If the **Add to Steam** context menu option is not available to you (i.e. on non-SteamOS distros), you will need to add the `.appimage` file to Steam manually.

10. Launch the **Steam** application.

11. Find the **2ship.appimage** application from the **Library** section.

12. Select and right click the application.

13. Click the **Properties** context menu option.

14. In the newly opened **Properties** window:

    - Navigate to the **Shortcut** section.

    - Update the name of the application to `The Legend of Zelda: Majora's Mask`.

15. Close the **Properties** window.

16. You have now completed the installation and may launch the game from Steam.

    > [!NOTE]  
    > You may also make optional aesthetic changes to the game on Steam such as adding custom artwork (i.e. using [SteamGridDB](./decky-loader.md#plugin-installation) on a SteamOS based distro).
