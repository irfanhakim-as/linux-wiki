# SteamOS

## Description

SteamOS is a Linux distribution developed by [Valve](https://www.valvesoftware.com). SteamOS 3 is based on the [Arch Linux](https://archlinux.org) distribution with [KDE Plasma](https://kde.org/plasma-desktop).

## Directory
- [SteamOS](#steamos)
	- [Description](#description)
	- [Directory](#directory)
	- [References](#references)
	- [Setup](#setup)
		- [Description](#description-1)
		- [References](#references-1)
		- [Update Hostname](#update-hostname)
		- [Increase VRAM Size](#increase-vram-size)
		- [Remote Desktop](#remote-desktop)
		- [Create User Password](#create-user-password)
		- [Recommended Software Installation](#recommended-software-installation)
		- [Default Applications](#default-applications)
	- [Enabling Remote Access](#enabling-remote-access)
	- [Add Flathub Repository](#add-flathub-repository)
	- [ProtonUp-Qt](#protonup-qt)
	- [CryoUtilities](#cryoutilities)
		- [References](#references-2)
	- [EmuDeck](#emudeck)
	- [Custom Game Emulation Configurations](#custom-game-emulation-configurations)
	- [Custom Emulator Configurations](#custom-emulator-configurations)
	- [Undo CryoUtilities Sync Game Data](#undo-cryoutilities-sync-game-data)
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

## References

- [SteamOS (Legacy)](https://store.steampowered.com/steamos)
- [Steam Deck](https://www.steamdeck.com)

---

## Setup

### Description

This details how to setup SteamOS on initial installation/boot.

### References

- [Adjusting VRAM](https://youtu.be/7RPAxT7HJ7Q?t=332)

### Update Hostname

Change the hostname of the Steam Deck via Gaming mode.

1. In Gaming mode, open the **Steam** menu by clicking the <kbd>STEAM</kbd> button.

2. Click the **Settings** menu item.

3. Click the **System** tab.

4. Under the **About** section, click the button corresponding to the **Hostname**.

5. Add your desired hostname for the Steam Deck in the provided text field.

6. Click the **Change & Restart** button.

### Increase VRAM Size

Get into the BIOS and change the UMA Frame Buffer Size from 1GB to 4GB.

1. Turn off your Steam Deck.

2. Hold the <kbd>+</kbd> (Volume Up) button and the <kbd>Power</kbd> button simultaneously until the boot chime is heard.

3. After the Steam logo appears and disappears, you will be given access to 4 menu options. Select the **Setup Utility** option.

4. Click the **Advanced** tab.

5. Locate the **UMA Frame Buffer Size** option and change it from the default `1GB` value to `4GB`.

6. Press the <kbd>Select</kbd> button to save the changes and exit.

### Remote Desktop

Get into desktop mode and use the Discover app to install the AnyDesk app, and set it to autostart.

1. In Gaming mode, open the **Steam** menu by clicking the <kbd>STEAM</kbd> button.

2. Click the **Power** menu item.

3. Select the **Switch to Desktop** option.

4. Search and [install](../topics/plasma-discover.md#software-installation-and-update) the `AnyDesk` app using the **Discover** app.

5. Once installed, click the **Launch** button in the top right.

6. In the **AnyDesk** app, open the **General** hamburger menu in the top right.

7. Click **Settings**.

8.  Go to the **Security** section.

9.  Check the **Enable unattended access** option.

10. Click the **Set password...** button, add a secure password accordingly, and click **OK**.

11. Close the **Settings** tab and take note of your Steam Deck's AnyDesk address under **Your Address**. You can now remote into your Steam Deck from other devices using the AnyDesk app using this address and the password you had set.

12. Set the AnyDesk app to [autostart](../topics/autostart.md#add-application-to-autostart) each time the Steam Deck is in Desktop mode.

### Create User Password

Set up a `sudo` password for the `deck` user.

1. Enter Desktop mode.

2. Open the **Konsole** app.

3. Run the following command and follow the instructions to set a password for the `deck` user:

	```sh
	passwd
	```

### Recommended Software Installation

Open up the Discover app and [install](../topics/plasma-discover.md#software-installation-and-update) some essential apps (as user):

- Firefox
- Plex
- Discord
- Spotify
- Google Chrome
- OBS Studio
- discord-screenaudio
- KDiskMark
- WhatsApp Desktop
- LibreOffice
- Signal Desktop

### Default Applications

Set the [default Web browser application](../topics/plasma-desktop.md#default-application) to Firefox instead of Google Chrome.

---

## [Enabling Remote Access](../topics/enabling-remote-access.md)

This details how we can enable remote access into our Steam Deck from other devices in the same network via SSH.

---

## [Add Flathub Repository](../topics/plasma-discover.md#add-flathub-repository)

SteamOS already comes with access to Flathub system-wide, follow this guide to add the Flathub repository specifically for the user.

---

## [ProtonUp-Qt](../topics/protonup-qt.md)

This details the installation of ProtonUp-Qt and GE-Proton.

---

## [CryoUtilities](../topics/cryoutilities.md)

This details the installation and the setup steps for CryoUtilities in order to optimise our Steam Deck's performance.

### References

- [CryoUtilities Installation](../topics/cryoutilities.md#installation)
- [CryoUtilities Setup](../topics/cryoutilities.md#setup)

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

---

## [Plasma Desktop Quality of Life Improvements](../topics/plasma-desktop.md#quality-of-life-improvements)

This details on some things that could be done to improve the experience of using the desktop mode.

---

## [Plasma Desktop Theme Customisations](../topics/plasma-desktop.md#theme-customisations)

This details some customisation options for the Plasma desktop.

---

## [Distrobox Installation](../topics/distrobox.md#installation)

This details some customisation options for the Plasma desktop.

---

## [Install Applications/Libraries via Distrobox](../topics/distrobox.md#software-installation)

This details how we can install certain applications or libraries not present in SteamOS via Distrobox.
