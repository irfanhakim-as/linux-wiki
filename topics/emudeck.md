# Emudeck

## Description

EmuDeck is a collection of scripts that allows you to autoconfigure your Steam Deck or any other Linux Distro, it creates your roms directory structure and downloads all of the needed Emulators for you along with the best configurations for each of them.

## Directory

- [Emudeck](#emudeck)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Installation](#installation)
    - [Description](#description-1)
    - [Steps](#steps)
  - [Setup](#setup)
    - [Description](#description-2)
    - [Steps](#steps-1)
  - [Update Emulators](#update-emulators)
    - [Description](#description-3)
    - [Steps](#steps-2)
  - [BIOS and ROMS](#bios-and-roms)
    - [Description](#description-4)
    - [References](#references-1)
    - [Note](#note)
    - [PS1](#ps1)
    - [PS2](#ps2)
    - [Nintendo Switch](#nintendo-switch)
    - [Sega CD](#sega-cd)
    - [Sega Saturn](#sega-saturn)
    - [Sega Dreamcast](#sega-dreamcast)
    - [Nintendo DS](#nintendo-ds)
    - [Xbox](#xbox)
    - [Nintendo Gameboys](#nintendo-gameboys)
    - [Arcade/MAME](#arcademame)
    - [Others](#others)
      - [Xbox 360](#xbox-360)
      - [Nintendo 3DS](#nintendo-3ds)
      - [Nintendo 64](#nintendo-64)
      - [Nintendo GameCube](#nintendo-gamecube)
      - [Nintendo Entertainment System (NES)](#nintendo-entertainment-system-nes)
      - [Super Nintendo (SNES)](#super-nintendo-snes)
      - [Nintendo Wii](#nintendo-wii)
      - [Nintendo Wii U](#nintendo-wii-u)
    - [Sega 32X](#sega-32x)
    - [Sega Game Gear](#sega-game-gear)
    - [Sega Genesis](#sega-genesis)
    - [Sega Master System](#sega-master-system)
    - [PS3](#ps3)
    - [PSP](#psp)
  - [PS3 Emulation Setup](#ps3-emulation-setup)
    - [Description](#description-5)
    - [References](#references-2)
    - [Steps](#steps-3)

## References

- [EmuDeck](https://github.com/dragoonDorise/EmuDeck)
- [EmuDeck wiki](https://emudeck.github.io)

---

## Installation

### Description

This guides us how to install EmuDeck.

### Steps

1. On the desktop, click on the **EmuDeck** icon to run the installer.

2. Choose **Advanced Installation** and follow all the installation prompts throughout the installation, make changes according to your specific needs.

3. When selecting emulators to be installed, I recommend also selecting **MAME** in addition to the other emulators selected by default.

4. Do note where EmuDeck has installed your emulation setup - if it's installed on your disk locally, likely it'd be at `~/Emulation`.

---

## Setup

### Description

This guides us how to setup EmuDeck post-installation.

### Steps

1. After installation, I recommend heading to the **Cloud Services Manager** section:

   - Click **Change Settings** and click **OK**.

   - Select `com.google.Chrome` and click **OK**.

   - Select **Manage Cloud Services** and click **OK**.

   - Check all online services you wish included on your machine, especially in Gaming mode (Steam). I recommend:
     - `Discord.sh`
     - `Netflix.sh`
     - `Spotify.sh`
     - `YouTube.sh`

   - Click **OK**.

   - Note that once done, you will need to head over to **Google Chrome** and log into your accounts for each of these services that have been enabled.

   - I also highly recommend installing [Ublock Origin](https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm) on Google Chrome for circumventing ads on YouTube.

2. We also need to run **Steam ROM Manager** once to add our emulators, tools, or ROMS to our Steam library:

   - Click **Steam ROM Manager** in EmuDeck.

   - When provided the option to **Close Steam/Steam Input**, click **Yes**.

   - In the **Parsers** section of the Steam ROM Manager, click the **Toggle Parsers** option to deselect all that have been selected.

   - Manually select:
     - `EmulationStationDE`
     - `Emulators`
     - `Cloud Services`

   - Click **Preview** and then **Parse** to let it parse for you based on your selection.

   - Once it's done, click **Save to Steam** for it to add these apps it had found to your Steam library.

   - Wait for it to complete, then close the Steam ROM Manager once it's done.

3. To use our emulators, we will need to have the right BIOS for some emulators, and maybe even configure some specifically - which will be detailed in a different section.

    To check our BIOS:

   - Click on the **BIOS Checker** in EmuDeck.

   - BIOS files that appear to be missing will be highlighted in red in the **Bios files checker** list.

   - Acquire your BIOS files and add them accordingly.

   - Each time you do, click the **Check Again** button to ensure that EmuDeck is detecting them.

   - For more info on the BIOS files you need, check the [BIOS and ROMS](#bios-and-roms) section.

---

## Update Emulators

### Description

This guides us how to update our emulators on EmuDeck.

### Steps

To maintain/update our emulators, use the **Manage Emulators** functionality:

- Click **Manage Emulators** in EmuDeck.

- Click **Update your Emulators**.

- To update emulators based on Flatpak, click **Update Flatpaks**.

- To update emulators based on AppImages or Binaries, click **Update AppImages and Binaries**.

- Once it's clicked, make your selection of what emulators you wish to update, then click **OK**.

- Wait for the emulator(s) to finish updating, then you can close the app.

---

## BIOS and ROMS

### Description

This details how to setup BIOS/ROM files for each emulator in EmuDeck.

### References

- [Steam Deck Emulation Starter Guide](https://retrogamecorps.com/2022/10/16/steam-deck-emulation-starter-guide)
- [EmuDeck Cheat Sheet](https://emudeck.github.io/cheat-sheet)

### Note

This guide assumes your EmuDeck installation folder, `EMUDECK_FOLDER`, being `~/Emulation`.

> [!IMPORTANT]  
> Make sure to enable the **Show Hidden Files** option in the **Dolphin** file manager app before proceeding!

### [PS1](https://emudeck.github.io/cheat-sheet/#sony-cheat-sheet)

Put the following BIOS files in `EMUDECK_FOLDER/bios`:

- scph5500.bin (md5sum: `8dd7d5296a650fac7319bce665a6a53c`)
- scph5501.bin (md5sum: `490f666e1afb15b7362b406ed1cea246`)
- scph5502.bin (md5sum: `32736f17079d0b2b7024407c39bd3050`)

Put the following ROM files in `EMUDECK_FOLDER/roms/psx`:

- *.chd
- *.m3u

For multi-disc games managed using `.m3u` files:

- Add `.chd` ROMs to `EMUDECK_FOLDER/roms/psx/.multidisc/GAME_NAME`
- Create `GAME_NAME.m3u` file at `EMUDECK_FOLDER/roms/psx` to point to the individual ROMs. An example:

	```
	./.multidisc/GAME_NAME/GAME_NAME (Disc 1).chd
	./.multidisc/GAME_NAME/GAME_NAME (Disc 2).chd
	./.multidisc/GAME_NAME/GAME_NAME (Disc 3).chd
	```

### [PS2](https://emudeck.github.io/cheat-sheet/#sony-cheat-sheet)

Put the following BIOS files in `EMUDECK_FOLDER/bios`:

- SCPH-70012_BIOS_V12_USA_200.bin (md5sum: `d333558cc14561c1fdc334c75d5f37b7`)
- SCPH-70012_BIOS_V12_USA_200.mec (md5sum: `3faf7c064a4984f53e2ef5e80ed543bc`)
- SCPH-70012_BIOS_V12_USA_200.nvm (md5sum: `96eb2436e1f6be60ab897ecbab72f407`)

Put the following ROM files in `EMUDECK_FOLDER/roms/ps2`:

- *.chd

### [Nintendo Switch](https://emudeck.github.io/cheat-sheet/#nintendo-cheat-sheet)

Put the following firmware files in `EMUDECK_FOLDER/bios/yuzu/firmware`:

- Content of `Firmware 16.0.0.zip`

Put the following key files in `EMUDECK_FOLDER/bios/yuzu/keys`:

- Content of `Keys 16.0.0.zip` (a single `prod.keys` file)

Put the following ROM (game) files in `EMUDECK_FOLDER/roms/switch`:

- *.nsp

For Update and DLC `.nsp` files, place them in a folder created by you (i.e. `~/Downloads/Games/Emulation/switch/roms`) and install them to their corresponding game in **Yuzu** directly using the **Install files to NAND** option. Once they've been installed, you can delete the Update/DLC files from your computer.

### [Sega CD](https://emudeck.github.io/cheat-sheet/#sega-cheat-sheet)

Put the following BIOS files in `EMUDECK_FOLDER/bios`:

- bios_CD_E.bin (md5sum: `e66fa1dc5820d254611fdcdba0662372`)
- bios_CD_J.bin (md5sum: `278a9397d192149e84e820ac621a8edd`)
- bios_CD_U.bin (md5sum: `854b9150240a198070150e4566ae1290`)

Put the following ROM files in `EMUDECK_FOLDER/roms/segacd`:

- *.chd

### [Sega Saturn](https://emudeck.github.io/cheat-sheet/#sega-cheat-sheet)

Put the following BIOS files in `EMUDECK_FOLDER/bios`:

- mpr-17933.bin (md5sum: `3240872c70984b6cbfda1586cab68dbe`)
- sega_101.bin (md5sum: `85ec9ca47d8f6807718151cbcca8b964`)

Put the following ROM files in `EMUDECK_FOLDER/roms/saturn`:

- *.chd

### [Sega Dreamcast](https://emudeck.github.io/cheat-sheet/#sega-cheat-sheet)

Put the following BIOS files in `EMUDECK_FOLDER/bios/dc` (create the `dc` folder first):

- dc_boot.bin (md5sum: `e10c53c2f8b90bab96ead2d368858623`)

Put the following ROM files in `EMUDECK_FOLDER/roms/dreamcast`:

- *.chd

### [Nintendo DS](https://emudeck.github.io/cheat-sheet/#nintendo-cheat-sheet)

Put the following BIOS files in `EMUDECK_FOLDER/bios`:

- bios7.bin (md5sum: `df692a80a5b1bc90728bc3dfc76cd948`)
- bios9.bin (md5sum: `a392174eb3e572fed6447e956bde4b25`)
- firmware.bin (md5sum: `93276d8629990f50a90950ea083ab348`)

Put the following ROM files in `EMUDECK_FOLDER/roms/dreamcast`:

- *.nds

### [Xbox](https://emudeck.github.io/cheat-sheet/#microsoft-cheat-sheet)

Put the following BIOS files in `EMUDECK_FOLDER/bios`:

- Complex_4627v1.03.bin (md5sum: `21445c6f28fca7285b0f167ea770d1e5`)
- mcpx_1.0.bin (md5sum: `d49c52a4102f6df7bcf8d0617ac475ed`)

Put the following ROM files in `EMUDECK_FOLDER/roms/xbox`:

- *.iso (xiso formatted)

### [Nintendo Gameboys](https://emudeck.github.io/cheat-sheet/#nintendo-cheat-sheet)

They're not really required, but the following `gb`, `gba`, and `gbc` BIOS files could be added to `EMUDECK_FOLDER/bios`:

- gb_bios.bin (md5sum: `32fbbd84168d3482956eb3c5051637f5`)
- gba_bios.bin (md5sum: `a860e8c0b6d573d191e4ec7db1b1e4f6`)
- sgb_bios.bin (md5sum: `d574d4f9c12f305074798f54c091a8b4`)
- gbc_bios.bin (md5sum: `dbfce9db9deaa2567f6a84fde55f9680`)

Put `gb`, `gba`, and `gbc` ROM files in `EMUDECK_FOLDER/roms/gb`, `EMUDECK_FOLDER/roms/gba`, and `EMUDECK_FOLDER/roms/gbc` respectively:

- *.zip

### [Arcade/MAME](https://emudeck.github.io/cheat-sheet/#arcade-and-mame-related-emulation-cheat-sheet)

Put the following BIOS files in `EMUDECK_FOLDER/bios`:

- neogeo.zip (md5sum: `d4c3b4014bbbd00c5ad1b81bf38228b0`)

> [!NOTE]  
> To link a file using Dolphin, drag the source file to the destination folder while pressing <kbd>Ctrl + Shift</kbd>.

Link/copy the following BIOS files from `EMUDECK_FOLDER/bios` to `EMUDECK_FOLDER/bios/mame` (create `mame` folder first) and `EMUDECK_FOLDER/roms/arcade`:

- neogeo.zip (md5sum: `d4c3b4014bbbd00c5ad1b81bf38228b0`)

Put the following ROM files in `EMUDECK_FOLDER/roms/arcade`:

- *.zip (for best compatibility, must be from a MAME ROM collection of the same version as MAME installed by EmuDeck)

### Others

The following emulators either may not require BIOS files to work, or has a slightly different setup.

#### [Xbox 360](https://emudeck.github.io/cheat-sheet/#microsoft-cheat-sheet)

Put the following ROM files in `EMUDECK_FOLDER/roms/xbox360/roms`:

- *.iso

#### [Nintendo 3DS](https://emudeck.github.io/cheat-sheet/#nintendo-cheat-sheet)

> [!WARNING]  
> If your ROMs have not been decrypted, you will need to add the `aes_keys.txt` BIOS file to `EMUDECK_FOLDER/bios/citra/keys`!

Put the following ROM files in `EMUDECK_FOLDER/roms/3ds`:

- *.3ds (preferably decrypted)

#### [Nintendo 64](https://emudeck.github.io/cheat-sheet/#nintendo-cheat-sheet)

Put the following ROM files in `EMUDECK_FOLDER/roms/n64`:

- *.zip (preferably `BigEndian` ROMs)

#### [Nintendo GameCube](https://emudeck.github.io/cheat-sheet/#nintendo-cheat-sheet)

Put the following ROM files in `EMUDECK_FOLDER/roms/gamecube`:

- *.rvz

#### [Nintendo Entertainment System (NES)](https://emudeck.github.io/cheat-sheet/#nintendo-cheat-sheet)

Put the following ROM files in `EMUDECK_FOLDER/roms/nes`:

- *.zip (Headered ROMs)

#### [Super Nintendo (SNES)](https://emudeck.github.io/cheat-sheet/#nintendo-cheat-sheet)

Put the following ROM files in `EMUDECK_FOLDER/roms/snes`:

- *.zip

#### [Nintendo Wii](https://emudeck.github.io/cheat-sheet/#nintendo-cheat-sheet)

Put the following ROM files in `EMUDECK_FOLDER/roms/wii`:

- *.rvz

#### [Nintendo Wii U](https://emudeck.github.io/cheat-sheet/#nintendo-cheat-sheet)

Put the following ROM files in `EMUDECK_FOLDER/roms/wiiu/roms`:

- *.wua

### [Sega 32X](https://emudeck.github.io/cheat-sheet/#sega-cheat-sheet)

Put the following ROM files in `EMUDECK_FOLDER/roms/sega32x`:

- *.zip

### [Sega Game Gear](https://emudeck.github.io/cheat-sheet/#sega-cheat-sheet)

Put the following ROM files in `EMUDECK_FOLDER/roms/gamegear`:

- *.zip

### [Sega Genesis](https://emudeck.github.io/cheat-sheet/#sega-cheat-sheet)

Put the following ROM files in `EMUDECK_FOLDER/roms/genesis`:

- *.zip

### [Sega Master System](https://emudeck.github.io/cheat-sheet/#sega-cheat-sheet)

Put the following ROM files in `EMUDECK_FOLDER/roms/mastersystem`:

- *.zip

### [PS3](https://emudeck.github.io/cheat-sheet/#sony-cheat-sheet)

> [!WARNING]  
> PS3 Firmware/ROMs requires direct installation in the emulator, RPCS3, and is discussed in the [PS3 Emulation Setup](#ps3-emulation-setup) section.

Put the following ROM files in `EMUDECK_FOLDER/roms/ps3`:

- *.desktop

### [PSP](https://emudeck.github.io/cheat-sheet/#sony-cheat-sheet)

Put the following ROM files in `EMUDECK_FOLDER/roms/psp`:

- *.iso

---

## PS3 Emulation Setup

### Description

This details how to setup our PS3 emulator, RPCS3, and add/setup PS3 games using EmuDeck.

### References

- [Getting Started with RPCS3](https://github.com/dragoonDorise/EmuDeck/wiki/rpcs3#getting-started-with-rpcs3)
- [Special game installation considerations - Sony PlayStation 3](https://gitlab.com/es-de/emulationstation-de/-/blob/master/USERGUIDE.md#sony-playstation-3)

### Steps

1. Download PS3 BIOS, `PS3UPDAT.PUP` (md5sum: `05fe32f5dc8c78acbcd84d36ee7fdc5b`):

   - Visit https://www.playstation.com/en-us/support/hardware/ps3/system-software on our browser.

   - Click **Update using a computer**.

   - Click **Download PS3 Update**.

   - Click **Allow download** if prompted.

2. Install BIOS in RPCS3:

   - Launch RPCS3.

   - Click **File** > **Install Firmware**.

   - Select the **PS3UPDAT.PUP** BIOS file.

   - Wait for it to finish installing.

3. Install game (`pkg`) in RPCS3:

   - Launch RPCS3.

   - Click **File** > **Install Packages/Raps/Edats**.

   - Select the game's **.pkg** file.

   - Click **File** > **Install Packages/Raps/Edats**.

   - Select the game's **.rap** file.

4. Prepare shortcut for launching the game using EmulationStation:

   - In RPCS3, select the desired game.

   - Right click the game, click **Create Shortcut** > **Create Desktop Shortcut**.

   - Move the **.desktop** file created from the **Desktop** to **EMUDECK_FOLDER/roms/ps3**.

   - Right click the file and click **Open with Kate** to edit the file using Kate.

   - Edit the file as follows:
     - Edit the `Exec=` line and replace `"/app/bin/rpcs3" --no-gui` with `"/usr/bin/flatpak" run net.rpcs3.RPCS3 --no-gui`.
     - Remove one `%` on each side of `"%%RPCS3_GAMEID%%:<yourgameID>"` as such: `"%RPCS3_GAMEID%:<yourgameID>"`.

   - Test the **.desktop** file by launching it.

    If in doing so you get an `Invalid file or folder` error message, try checking the `<yourgameID>` and make sure that it matches the ID of the game folder installed by RPCS3 under `EMUDECK_FOLDER/storage/rpcs3/dev_hdd0/game/`. If it does not, edit the `"%RPCS3_GAMEID%:<yourgameID>"` line with the correct game ID.
