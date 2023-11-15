# CryoUtilities

## Description

Scripts and utilities to improve performance and manage storage on the Steam Deck (May work with other Linux distros).

## Directory

- [CryoUtilities](#cryoutilities)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Installation](#installation)
    - [Description](#description-1)
    - [References](#references-1)
    - [Steps](#steps)
  - [Setup](#setup)
    - [Description](#description-2)
    - [References](#references-2)
    - [Steps](#steps-1)
  - [Undo Sync Game Data](#undo-sync-game-data)
    - [Description](#description-3)
    - [References](#references-3)
    - [Steps](#steps-2)
  - [Increase VRAM Size](#increase-vram-size)
    - [Description](#description-4)
    - [References](#references-4)
    - [Steps](#steps-3)

## References

- [CryoUtilities](https://github.com/CryoByte33/steam-deck-utilities)

---

## Installation

### Description

This details the installation steps for CryoUtilities.

### References

- [Install](https://github.com/CryoByte33/steam-deck-utilities#install)

### Steps

1. Download the installer to the `Desktop` directory:

    ```sh
    curl -L -o ~/Desktop/InstallCryoUtilities.desktop https://raw.githubusercontent.com/CryoByte33/steam-deck-utilities/main/InstallCryoUtilities.desktop
    ```

2. Double click the `InstallCryoUtilities.desktop` file on the desktop to run the installer.

3. When prompted with a Warning, click the **Continue** button.

4. When informed that CryoUtilities has been installed, click the **OK** button.

5. Delete the `Install Cryo Utilities` (`InstallCryoUtilities.desktop`) file from the `Desktop` directory.

---

## Setup

### Description

This details the setup steps for CryoUtilities in order to optimise our Steam Deck's performance.

### References

- [Usage](https://github.com/CryoByte33/steam-deck-utilities#usage)

### Steps

> [!IMPORTANT]  
> You must already have set a password for the `deck` user before running the CryoUtilities app.

1. From the `Desktop`, double click the **CryoUtilities** programme to launch the app.

2. When prompted with the **Disclaimer**, click the **Yes** button.

3. Enter your `sudo`/`deck` password in the provided field and click **Submit**.

4. In the **Swap** section:

    - Set the **Swap File** to `16GB` if you have the storage capacity, otherwise you can set it at a minimum of `4GB`.

    - Set the **Swappiness** to `1`.

5. In the **Memory** section:

    - Under **HugePages**, click the **Enable HugePages** button.

    - Under **Shared Memory in THP**, click the **Enable Shared Memory in THP** button.

    - Under **Compaction Proactiveness**, click the **Set Compaction Proactiveness** button.

    - Under **Huge Page Defragmentation**, click the **Disable Page Defragmentation** button.

    - Under **Page Lock Unfairness**, click the **Set Page Lock Unfairness** button.

6. In the **Storage** section, you'll have access to optional features including:

    - Sync Game Data: Use the **Sync** feature to move game data to the SD card and symlink it to the Deck's SSD.

    - Delete Game Data: Use the **Clean** feature to delete game data for selected games.

7. In the **VRAM** section, it recommends you to [set the **VRAM** (or **UMA Frame Buffer Size**) to `4GB`](#increase-vram-size) on the Steam Deck through the BIOS. You can do this at the end after closing the **CryoUtilities** app.

8. Close the **CryoUtilities** app.

---

## Undo Sync Game Data

### Description

To save storage space, game data can be moved to the SD card, and symlinked to the Deck's SSD. This procedure is called "Sync Game Data". This may cause issues for some games however, and this guide will undo the process for a particular game after having done it using the CryoUtilities programme.

### References

- [How to reverse cryoutilities sync function](https://www.reddit.com/r/SteamDeck/comments/11qx561/comment/jca9exv)

### Steps

1. Identify the game's Steam ID.

   - Look for the game on SteamDB and get the number at the end of the URL.
   - For example, the game, "Cozy Grove" has a URL of https://steamdb.info/app/1458100 on SteamDB.
   - In this case, the Steam ID is the number at the end, `1458100`.

2. Remove the link of the game's compatdata. Replace the game's Steam ID at the end accordingly.

    ```sh
    rm -i /home/deck/.local/share/Steam/steamapps/compatdata/1458100
    ```

3. Remove the link of the game's shadercache. Replace the game's Steam ID at the end accordingly.

    ```sh
    rm -i /home/deck/.local/share/Steam/steamapps/shadercache/1458100
    ```

4. Move the game's compatdata from the SD card to the SSD. Replace the game's Steam ID at the end accordingly.

    ```sh
    mv /run/media/mmcblk0p1/cryoutilities_steam_data/compatdata/1458100 /home/deck/.local/share/Steam/steamapps/compatdata/1458100
    ```

5. Move the game's shadercache from the SD card to the SSD. Replace the game's Steam ID at the end accordingly.

    ```sh
    mv /run/media/mmcblk0p1/cryoutilities_steam_data/shadercache/1458100 /home/deck/.local/share/Steam/steamapps/shadercache/1458100
    ```

---

## Increase VRAM Size

### Description

This details on how to increase the VRAM size for the integrated GPU on the Steam Deck.

> [!IMPORTANT]  
> This guide is intended only for the Steam Deck on SteamOS.

### References

- [Adjusting VRAM](https://youtu.be/7RPAxT7HJ7Q?t=332)

### Steps

1. Turn off your Steam Deck.

2. Hold the <kbd>+</kbd> (Volume Up) button and the <kbd>Power</kbd> button simultaneously until the boot chime is heard.

3. After the Steam logo appears and disappears, you will be given access to 4 menu options. Select the **Setup Utility** option.

4. Click the **Advanced** tab.

5. Locate the **UMA Frame Buffer Size** option and change it from the default `1GB` value to `4GB`.

6. Press the <kbd>Select</kbd> button to save the changes and exit.
