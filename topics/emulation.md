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
    - [PS3](#ps3)
      - [Demon's Souls](#demons-souls)
    - [Nintendo Switch](#nintendo-switch)
      - [Pikmin 4](#pikmin-4)
  - [Applying Translation Patches to ROMs](#applying-translation-patches-to-roms)
    - [Description](#description-3)
    - [References](#references-1)
    - [Steps](#steps)
    - [Notes](#notes)
  - [Convert XCI Switch Games to NSP](#convert-xci-switch-games-to-nsp)
    - [Description](#description-4)
    - [References](#references-2)
    - [Steps](#steps-1)

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
> Doing this will not bypass the BIOS/region check, which means some games may not be able to launch if you're missing a BIOS file or the game's region is incompatible. For these games, you may need to leave the **Fast Boot** option enabled.

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

### PS3

This details additional configurations that may be required to fix or improve specific games on the RPCS3 emulator.

#### Demon's Souls

Black screen fix:

1. Right click the game on RPCS3.

2. Click **Create Custom Game Configuration**.

3. Click the **GPU** tab.

4. In the **Additional Settings** section, select the **Write Color Buffers** checkbox.

5. Click **Apply**, **Save custom configuration**, and **Close**.

### Nintendo Switch

This details additional configurations that may be required to fix or improve specific games on the Yuzu emulator.

To configure a particular game on Yuzu:

1. Launch the Yuzu app.

2. In the Games list/directory on Yuzu, highlight the game we wish to configure.

3. Right click on the highlighted game and select **Properties**.

In the **Properties** window, several tabs and settings can be found and configured on a per-game basis.

#### Pikmin 4

Pikmin 4 has some graphical glitches when exploring the underground/burrow (at the time of writing, **yuzu 1524**). This can be fixed by configuring the graphical accuracy level:

1. In the **Properties** window, navigate to the **Adv. Graphics** tab.

2. Locate the **Accuracy Level** setting, and select the **High** option.

3. Click the **OK** button to apply our changes.

---

## Applying Translation Patches to ROMs

### Description

This details on how you can apply translation patches to your supported ROMs.

### References

- [Apply ROM hacks and translations](https://emulation.gametechwiki.com/index.php/Apply_ROM_hacks_and_translations)

### Steps

1. Make sure you have your ROM, and download your translation patch file. Your translation patch file will normally detail on what exact ROM version you would need:

   - Game name
   - Region
   - Revision
   - Dump

2. If the game provides the _sum_ (i.e. `MD5`) of the ROM, you can check if it matches by running:

    ```sh
    md5sum <my_rom_name>
    ```

    Replace `<my_rom_name>` with the exact name of your ROM file.

3. Install a patching tool that is suitable for your translation patch file. In the case of `ips` and `bps` files, install **Flips** as a Flatpak.

    ```sh
    flatpak install --user com.github.Alcaro.Flips
    ```

4. In this example, we will assume these values:

   - ROM name: `Dragon Quest Monsters - Caravan Heart (Japan).gba`
   - Patch name: `Dragon Quest Monsters Caravan Heart.ips`

5. To apply the patch to the ROM:

   - Launch the **Flips** app.

   - Click **Apply Patch**.

   - Select your patch file (i.e. `Dragon Quest Monsters Caravan Heart.ips`).

   - Select your ROM (i.e. `Dragon Quest Monsters - Caravan Heart (Japan).gba`).

   - Name your output file (i.e. `Dragon Quest Monsters - Caravan Heart (Japan) [English].gba`).

   - Click **Save**.

Now you should have your output file that has been patched with the translation.

### Notes

- In some cases, there are translation files of different variants, **Full/Playable** and **Addendum**.

- The former version is expected to be applied to a supported ROM that they have specified.

- Meanwhile, the latter is expected to be applied to a ROM that has been patched with a specific **Full/Playable** patch. Apply these patches using **Flips** one by one.

---

## Convert XCI Switch Games to NSP

### Description

This details how we can convert `.xci` Nintendo Switch games to `.nsp`.

### References

- [4nxci](https://github.com/The-4n/4NXCI)
- [4nxci-git](https://aur.archlinux.org/packages/4nxci-git)

### Steps

1. Install `4nxci-git` from the `AUR` in your system or in an Arch Linux based [Distrobox](distrobox.md) container:

    ```sh
    yay -S 4nxci-git
    ```

2. **(Optional)** Create a dedicated working directory for converting `.xci` games for ease of use:

    ```sh
    mkdir xci-to-nsp
    ```

3. Move your `prod.keys` file to the working directory:

    ```sh
    mv prod.keys xci-to-nsp
    ```

4. Place your `.xci` game (i.e. `MyGame.xci`) to the working directory:

    ```sh
    mv MyGame.xci xci-to-nsp
    ```

5. Perform the conversion using `4nxci`:

    ```sh
    4nxci MyGame.xci -k prod.keys
    ```

    `4nxci` expects the `.xci` game file, while the `-k` flag expects the full path to our keys, `prod.keys`.

    You will get an `.nsp` game file of the `.xci` we had passed to `4nxci` to convert in the same working directory at the end.
