# Emulation

## Description

This guide focuses on general emulation topics.

> [!NOTE]  
> Parts of this guide may assume that your emulation setup was done using [EmuDeck](emudeck.md).

## Directory

- [Emulation](#emulation)
  - [Description](#description)
  - [Directory](#directory)
  - [Custom Emulator Configurations](#custom-emulator-configurations)
    - [Description](#description-1)
    - [References](#references)
    - [Nintendo GameCube](#nintendo-gamecube)
      - [Add GameCube Boot Logo](#add-gamecube-boot-logo)
      - [Disable On-Screen Messages](#disable-on-screen-messages)
    - [PS2](#ps2)
      - [Add PS2 Boot Logo](#add-ps2-boot-logo)
      - [Make Fullscreen](#make-fullscreen)
      - [Hide OSD Messages](#hide-osd-messages)
  - [Custom Game Emulation Configurations](#custom-game-emulation-configurations)
    - [Description](#description-2)
    - [Demon's Souls (PS3)](#demons-souls-ps3)

---

## Custom Emulator Configurations

### Description

This details on certain configuration options for several emulators.

### References

- [Steam Deck Emulation Starter Guide - Nintendo GameCube](https://retrogamecorps.com/2022/10/16/steam-deck-emulation-starter-guide/#GameCube)

### Nintendo GameCube

This process adds in the GameCube boot logo every time we start a game, as well as remove the Dolphin emulator's on-screen messages. This guide assumes you have set up GameCube via EmuDeck.

#### Add GameCube Boot Logo

1. Acquire the GameCube BIOS and rename it (if haven't already) to `IPL.bin` (md5sum: `fae2b558ffc344467170520d62177e5c`).

2. Copy the BIOS file to the following directory (assuming our user is `deck`):

    ```sh
    cp IPL.bin /home/deck/.var/app/org.DolphinEmu.dolphin-emu/data/dolphin-emu/GC/USA/IPL.bin
    ```

3. Launch the Dolphin emulator.

4. Go to **Options** > **Configuration** > **GameCube** and uncheck the box that says **Skip Main Menu**.

5. To avoid stretched images during the boot animation, go to **Options** > **Graphic Settings** > **Hacks** and turn **Immediately Present XFB** off (default).

#### Disable On-Screen Messages

1. Launch the Dolphin emulator.

2. Go to **Options** > **Configuration** > **Interface** and uncheck the **Show On-Screen Display Messages** option.

### PS2

This process customises some PCSX2 configurations such as adding in the PS2 boot logo every time we start a game and hiding on-screen display messages. This guide assumes you have set up PCSX2 via EmuDeck.

#### Add PS2 Boot Logo

1. Launch the PCSX2 emulator.

2. Go to **Settings** > **BIOS Settings** and uncheck the entry that says **Fast Boot**.

> [!WARNING]  
> Doing this will not bypass the BIOS/region check, which means some games may not be able to launch if you're missing a BIOS file or the game's region is incompatible. For these games, you may need to leave the Fast Boot option enabled.

#### Make Fullscreen

PCSX2 should already launch in fullscreen automatically, but if it does not:

1. Go to **Settings** > **Interface Settings**.

2. Locate the **Game Display** section and check the **Start Fullscreen** option.

#### Hide OSD Messages

1. Go to **Settings** > **Interface Settings**.

2. Locate the **On-Screen Display** section and uncheck the **Show Messages** option.

---

## Custom Game Emulation Configurations

### Description

This details on certain configuration options or fixes for several games of various emulation systems.

### Demon's Souls (PS3)

Black screen fix:

1. Right click the game on RPCS3.

2. Click **Create Custom Game Configuration**.

3. Click the **GPU** tab.

4. In the **Additional Settings** section, select the **Write Color Buffers** checkbox.

5. Click **Apply**, **Save custom configuration**, and **Close**.
