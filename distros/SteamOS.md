# SteamOS

## Description

SteamOS is a Linux distribution developed by [Valve](https://www.valvesoftware.com). SteamOS 3 is based on the [Arch Linux](https://archlinux.org) distribution with [KDE Plasma](https://kde.org/plasma-desktop).

## Directory
- [SteamOS](#steamos)
	- [Description](#description)
	- [Directory](#directory)
	- [References](#references)
	- [Initial Setup](#initial-setup)
		- [Description](#description-1)
		- [Update Hostname](#update-hostname)
		- [Create User Password](#create-user-password)
		- [Remote Access](#remote-access)
		- [Recommended Software Installation](#recommended-software-installation)
		- [Default Application](#default-application)
	- [Add Flathub Repository](#add-flathub-repository)
	- [ProtonUp-Qt](#protonup-qt)
		- [References](#references-1)
	- [CryoUtilities](#cryoutilities)
		- [References](#references-2)
	- [CryoUtilities Undo Sync Game Data](#cryoutilities-undo-sync-game-data)
	- [EmuDeck](#emudeck)
	- [Custom Game Emulation Configurations](#custom-game-emulation-configurations)
	- [Custom Emulator Configurations](#custom-emulator-configurations)
	- [Backing up with Vorta](#backing-up-with-vorta)
	- [Add Non-Steam Services](#add-non-steam-services)
	- [Applying Translation Patches to ROMs](#applying-translation-patches-to-roms)
	- [Fixing DRM issues with Google Chrome](#fixing-drm-issues-with-google-chrome)
	- [Install Git LFS](#install-git-lfs)
	- [Better Fonts](#better-fonts)
		- [References](#references-3)
	- [Convert XCI Switch Games to NSP](#convert-xci-switch-games-to-nsp)
	- [Wake on LAN or Wireless](#wake-on-lan-or-wireless)
		- [References](#references-4)
	- [Plasma Desktop Quality of Life Improvements](#plasma-desktop-quality-of-life-improvements)
	- [Plasma Desktop Theme Customisations](#plasma-desktop-theme-customisations)
	- [Distrobox Installation](#distrobox-installation)
	- [Install Applications/Libraries via Distrobox](#install-applicationslibraries-via-distrobox)
	- [Make Flatpak Apps Respect KDE Theme](#make-flatpak-apps-respect-kde-theme)
	- [Link's Awakening DX HD](#links-awakening-dx-hd)

## References

- [SteamOS (Legacy)](https://store.steampowered.com/steamos)
- [Steam Deck](https://www.steamdeck.com)

---

## Initial Setup

### Description

This details how to setup SteamOS on initial installation/boot.

### Update Hostname

From Gaming mode, update the hostname of the Steam Deck.

1. Open the **Steam** menu by clicking the <kbd>STEAM</kbd> button.

2. Click the **Settings** menu item.

3. Click the **System** tab.

4. Under the **About** section, click the button corresponding to the **Hostname**.

5. Add your desired hostname for the Steam Deck in the provided text field.

6. Click the **Change & Restart** button.

### Create User Password

From Desktop mode, set up a `sudo` password for the `deck` user.

1. Launch the **Konsole** app.

2. Run the following command and follow the instructions to set a password for the `deck` user:

	```sh
	passwd
	```

### [Remote Access](../topics/remote-access.md)

From Desktop mode, this details how we can enable remote access into our system from other devices in the same network or externally.

### Recommended Software Installation

From Desktop mode, launch the Discover application and [install](../topics/plasma-discover.md#software-installation-and-update) some essential apps (as user):

- Firefox
- Plex
- Discord
- Spotify
- Google Chrome
- OBS Studio
- Vesktop
- KDiskMark
- WhatsApp Desktop
- LibreOffice
- Signal Desktop

### [Default Application](../topics/plasma-desktop.md#default-application)

From Desktop mode, this details on how to configure default applications of various types on KDE Plasma.

---

## [Add Flathub Repository](../topics/plasma-discover.md#add-flathub-repository)

SteamOS already comes with access to Flathub system-wide, follow this guide to add the Flathub repository specifically for the user.

---

## ProtonUp-Qt

This details the installation of ProtonUp-Qt and GE-Proton, as well as how to update GE-Proton for your installed games down the line.

### References

- [ProtonUp-Qt Setup](../topics/protonup-qt.md#setup)
- [ProtonUp-Qt Update GE-Proton](../topics/protonup-qt.md#update-ge-proton)

---

## CryoUtilities

This details the installation and the setup steps for CryoUtilities in order to optimise our Steam Deck's performance.

### References

- [CryoUtilities Installation](../topics/cryoutilities.md#installation)
- [CryoUtilities Setup](../topics/cryoutilities.md#setup)

---

## [CryoUtilities Undo Sync Game Data](../topics/cryoutilities.md#undo-sync-game-data)

To save storage space, game data can be moved to the SD card, and symlinked to the Deck's SSD. This procedure is called "Sync Game Data". This may cause issues for some games however, and this guide will undo the process for a particular game after having done it using the CryoUtilities programme.

---

## [EmuDeck](../topics/emudeck.md)

This details how to install, setup, and maintain EmuDeck on SteamOS.

---

## [Custom Game Emulation Configurations](../topics/emulation.md#custom-game-emulation-configurations)

This details on certain configuration options or fixes for several games of various emulation systems.

---

## [Custom Emulator Configurations](../topics/emulation.md#custom-emulator-configurations)

This details on certain configuration options for several emulators.

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

---

## [Plasma Desktop Quality of Life Improvements](../topics/plasma-desktop.md#quality-of-life-improvements)

This details on some things that could be done to improve the experience of using the desktop mode.

---

## [Plasma Desktop Theme Customisations](../topics/plasma-desktop.md#theme-customisations)

This details some customisation options for the Plasma desktop.

---

## [Distrobox Installation](../topics/distrobox.md#installation)

This details how we can install and setup Distrobox.

---

## [Install Applications/Libraries via Distrobox](../topics/distrobox.md#software-installation)

This details how we can install certain applications or libraries not present in your system via Distrobox.

---

## [Make Flatpak Apps Respect KDE Theme](../topics/flatpak.md#respect-kde-theme)

This solves the issue of (some) Flatpak apps not looking native in KDE, and defaulting to a GTK theme instead.

---

## [Link's Awakening DX HD](../topics/gaming.md#links-awakening-dx-hd)

This details how to install and run the Link's Awakening DX HD _port_.
