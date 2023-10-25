# SteamOS

## Description

SteamOS is a Linux distribution developed by [Valve](https://www.valvesoftware.com). SteamOS 3 is based on the [Arch Linux](https://archlinux.org) distribution with [KDE Plasma](https://kde.org/plasma-desktop).

## Directory
- [SteamOS](#steamos)
	- [Description](#description)
	- [Directory](#directory)
	- [References](#references)
	- [PS3 Emulation Setup](#ps3-emulation-setup)
	- [Custom Game Emulation Configurations](#custom-game-emulation-configurations)
	- [Custom Emulator Configurations](#custom-emulator-configurations)
	- [Undo CryoUtilities Sync Game Data](#undo-cryoutilities-sync-game-data)
	- [Backing up with Vorta](#backing-up-with-vorta)
	- [Add Non-Steam Services](#add-non-steam-services)
	- [Applying Translation Patches to ROMs](#applying-translation-patches-to-roms)
	- [Fixing DRM issues with Google Chrome](#fixing-drm-issues-with-google-chrome)
	- [Install Git LFS](#install-git-lfs)
	- [Better Fonts](#better-fonts)
		- [References](#references-1)
	- [Convert XCI Switch Games to NSP](#convert-xci-switch-games-to-nsp)
	- [Wake on LAN or Wireless](#wake-on-lan-or-wireless)
		- [References](#references-2)

## References

- [SteamOS (Legacy)](https://store.steampowered.com/steamos)
- [Steam Deck](https://www.steamdeck.com)

---

## [PS3 Emulation Setup](../topics/emudeck.md#ps3-emulation-setup)

This details how to setup our PS3 emulator, RPCS3, and add/setup PS3 games using EmuDeck.

---

## [Custom Game Emulation Configurations](../topics/emulation.md#custom-game-emulation-configurations)

This details on certain configuration options or fixes for several games of various emulation systems.

---

## [Custom Emulator Configurations](../topics/emulation.md#custom-emulator-configurations)

This details on certain configuration options for several emulators.

---

## [Undo CryoUtilities Sync Game Data](../topics/cryoutilities.md#undo-sync-game-data)

To save storage space, game data can be moved to the SD card, and symlinked to the Deck's SSD. This procedure is called "Sync Game Data". This may cause issues for some games however, and this guide will undo the process for a particular game after having done it using the CryoUtilities programme.

---

## [Backing up with Vorta](../topics/vorta.md)

This backs up directories deemed to be important for our games using Vorta.

1. The **Repository** we'll be using is a Samba Share mountpoint:

	```
	/home/deck/mynas/System/Backups/Snapshots/steamdeck
	```

	You can change this to any directories on any drives you may have.

2. These are our **Source Folders and Files** configuration for the Steam Deck:

	```
	/home/deck/.config
	/home/deck/.local/share/Steam/steamapps/common/Stardew Valley
	/home/deck/.local/share/Steam/steamapps/compatdata
	/home/deck/.var/app/io.github.shiiion.primehack/data/dolphin-emu/GC
	/home/deck/.var/app/io.github.shiiion.primehack/data/dolphin-emu/StateSaves
	/home/deck/.var/app/io.github.shiiion.primehack/data/dolphin-emu/Wii
	/home/deck/.var/app/org.citra_emu.citra/data/citra-emu/sdmc
	/home/deck/.var/app/org.citra_emu.citra/data/citra-emu/states
	/home/deck/.var/app/org.DolphinEmu.dolphin-emu/data/dolphin-emu/GC
	/home/deck/.var/app/org.DolphinEmu.dolphin-emu/data/dolphin-emu/StateSaves
	/home/deck/.var/app/org.DolphinEmu.dolphin-emu/data/dolphin-emu/Wii
	/home/deck/.var/app/org.libretro.RetroArch/config/retroarch/saves
	/home/deck/.var/app/org.libretro.RetroArch/config/retroarch/states
	/home/deck/.var/app/org.ppsspp.PPSSPP/config/ppsspp/PSP/PPSSPP_STATE
	/home/deck/.var/app/org.ppsspp.PPSSPP/config/ppsspp/PSP/SAVEDATA
	/home/deck/emudeck
	/home/deck/homebrew
	/home/deck/Pictures/Screenshots
	/run/media/mmcblk0p1/Emulation/roms/wiiu/mlc01/usr/save
	/run/media/mmcblk0p1/Emulation/saves/duckstation
	/run/media/mmcblk0p1/Emulation/saves/MAME
	/run/media/mmcblk0p1/Emulation/saves/pcsx2
	/run/media/mmcblk0p1/Emulation/saves/ryujinx
	/run/media/mmcblk0p1/Emulation/saves/scummvm
	/run/media/mmcblk0p1/Emulation/storage/rpcs3/dev_hdd0/home/00000001/savedata
	/run/media/mmcblk0p1/Emulation/storage/yuzu/nand/user/save
	```

Everything else is set according to the referenced guide.

---

## [Add Non-Steam Services](../topics/steam.md#add-non-steam-services)

This details how to add non-Steam services based on Google Chrome, to Steam so it can be accessed in gaming mode.

---

## [Applying Translation Patches to ROMs](../topics/emulation.md#applying-translation-patches-to-roms)

This details on how you can apply translation patches to your supported ROMs.

---

## [Fixing DRM issues with Google Chrome](../topics/drm.md#fixing-drm-issues-with-google-chrome)

Note that this issue is a bug, and this guide is simply a workaround. It's likely that if the issue gets fixed, we can either ignore this workaround or revert it if it's already been implemented as it might disrupt or cause issues when attempting to update Google Chrome in the future.

---

## [Install Git LFS](../topics/git.md#git-lfs)

Git LFS is needed to acquire files from git repositories that requires LFS. This details how we could set it up without root privileges.

---

## Better Fonts

This details several configuration options for our desktop to have and use better looking fonts. This also includes Emoji, Microsoft Fonts, and Apple Fonts support.

### References

- [Fonts Installation](../topics/fonts.md#Installation)
- [Fonts Configuration](../topics/fonts.md#Configuration)

---

## [Convert XCI Switch Games to NSP](../topics/emulation.md#convert-xci-switch-games-to-nsp)

This details how we can convert `.xci` Nintendo Switch games to `.nsp`.

---

## Wake on LAN or Wireless

This details on how to enable, setup and use Wake on LAN (WoL) or Wake on Wireless (WoWLAN) on our system.

### References

- [Wake on LAN](../topics/wol.md)
- [Wake on Wireless](../topics/wowlan.md)
