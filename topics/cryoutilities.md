# CryoUtilities

## Description

Scripts and utilities to improve performance and manage storage on the Steam Deck (May work with other Linux distros).

## Directory

- [CryoUtilities](#cryoutilities)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Undo Sync Game Data](#undo-sync-game-data)
    - [Description](#description-1)
    - [References](#references-1)
    - [Steps](#steps)

## References

- [CryoUtilities](https://github.com/CryoByte33/steam-deck-utilities)

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
