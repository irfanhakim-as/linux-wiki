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
    - [Default Applications](#default-applications)
  - [Fish Shell](#fish-shell)
    - [References](#references-1)
    - [Notes](#notes)
  - [Add Flathub Repository](#add-flathub-repository)
  - [ProtonUp-Qt](#protonup-qt)
    - [References](#references-2)
  - [CryoUtilities](#cryoutilities)
    - [References](#references-3)
  - [CryoUtilities Undo Sync Game Data](#cryoutilities-undo-sync-game-data)
  - [EmuDeck](#emudeck)
  - [Custom Game Emulation Configurations](#custom-game-emulation-configurations)
  - [Custom Emulator Configurations](#custom-emulator-configurations)
  - [Mounting Remote Directory](#mounting-remote-directory)
    - [Notes](#notes-1)
  - [Backing up with Vorta](#backing-up-with-vorta)
    - [References](#references-4)
    - [Notes](#notes-2)
  - [Add Web Apps to Steam](#add-web-apps-to-steam)
  - [Applying Translation Patches to ROMs](#applying-translation-patches-to-roms)
  - [Fixing DRM issues with Google Chrome](#fixing-drm-issues-with-google-chrome)
  - [Install Git LFS](#install-git-lfs)
  - [Better Fonts](#better-fonts)
    - [References](#references-5)
  - [Convert XCI Switch Games to NSP](#convert-xci-switch-games-to-nsp)
  - [Wake on LAN or Wireless](#wake-on-lan-or-wireless)
    - [References](#references-6)
  - [Plasma Desktop Quality of Life Improvements](#plasma-desktop-quality-of-life-improvements)
  - [Plasma Desktop Theme Customisations](#plasma-desktop-theme-customisations)
  - [Distrobox Installation and Usage](#distrobox-installation-and-usage)
    - [References](#references-7)
  - [Install Applications/Libraries via Distrobox](#install-applicationslibraries-via-distrobox)
  - [Make Flatpak Apps Respect KDE Theme](#make-flatpak-apps-respect-kde-theme)
  - [Link's Awakening DX HD](#links-awakening-dx-hd)
  - [KDE Connect](#kde-connect)
  - [Ocarina of Time](#ocarina-of-time)
  - [Majora's Mask](#majoras-mask)

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

From Desktop mode, [install](../topics/flatpak.md#install) some essential Flatpak apps for the current user (or system):

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

### [Default Applications](../topics/plasma-desktop.md#default-applications)

From Desktop mode, this details on how to configure default applications of various types on KDE Plasma.

---

## Fish Shell

This details on how to make Fish the default shell for the user, setting an ideal configuration or profile for the Fish shell, and installing the Fisher plugin manager.

### References

- [Fish Make Default](../topics/fish.md#make-default)
- [Fish Configuration](../topics/fish.md#configuration)
- [Fisher Plugin Manager](../topics/fish.md#fisher-plugin-manager)

### Notes

- Since SteamOS is immutable, some of the dependencies required for the recommended configuration that were not preinstalled must either be installed manually (i.e. by downloading and installing their binary release from their source) or through [Distrobox](../topics/distrobox.md#software-installation) using an Arch Linux based container with [`yay`](../topics/yay.md#installation) installed.

- Opting for `podman` over `docker` as the default container runtime is highly recommended for immutable systems due to its rootless nature.

- In your Fish `config.fish` file, you may comment the entire `# Package manager` block since it does not apply for the SteamOS system.

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

## [Mounting Remote Directory](../topics/samba.md#mounting-remote-directory)

This details how to mount a remote Samba share to our local machine.

### Notes

- It's _potentially_ recommended to use a path within our user directory as the mountpoint for the remote directory (i.e. `/home/deck/mynas`) to avoid potential issues with the system's immutability.

- Configurations made to the system's `fstab` file will not persist through (major) updates - use the `systemd` mount unit method instead to mount the remote storage.

- Changes made to the system's `hosts` file will not persist either - when referencing the remote storage server in your mount configuration, use its IP address instead of its hostname.

---

## Backing up with Vorta

This details installing and setting up Vorta to have it backup our personal files, and restoring them when needed.

### References

- [Vorta Setup](../topics/vorta.md#setup)
- [Vorta Usage](../topics/vorta.md#usage)

### Notes

- These are our source folders and files to backup specific to the Steam Deck:

	```sh
	~/.config
	~/.local/share/Steam/steamapps/common/Stardew Valley
	~/.local/share/Steam/steamapps/compatdata
	~/.local/share/Steam/steamapps/userdata
	~/.var/app/io.github.shiiion.primehack/data/dolphin-emu/GC
	~/.var/app/io.github.shiiion.primehack/data/dolphin-emu/StateSaves
	~/.var/app/io.github.shiiion.primehack/data/dolphin-emu/Wii
	~/.var/app/org.citra_emu.citra/data/citra-emu/sdmc
	~/.var/app/org.citra_emu.citra/data/citra-emu/states
	~/.var/app/org.DolphinEmu.dolphin-emu/data/dolphin-emu/GC
	~/.var/app/org.DolphinEmu.dolphin-emu/data/dolphin-emu/StateSaves
	~/.var/app/org.DolphinEmu.dolphin-emu/data/dolphin-emu/Wii
	~/.var/app/org.libretro.RetroArch/config/retroarch/saves
	~/.var/app/org.libretro.RetroArch/config/retroarch/states
	~/.var/app/org.ppsspp.PPSSPP/config/ppsspp/PSP/PPSSPP_STATE
	~/.var/app/org.ppsspp.PPSSPP/config/ppsspp/PSP/SAVEDATA
	~/Applications
	~/emudeck
	~/ES-DE
	~/homebrew
	~/Pictures/Screenshots
	/run/media/mmcblk0p1/Emulation/roms/wiiu/mlc01/usr/save
	/run/media/mmcblk0p1/Emulation/saves/duckstation
	/run/media/mmcblk0p1/Emulation/saves/MAME
	/run/media/mmcblk0p1/Emulation/saves/pcsx2
	/run/media/mmcblk0p1/Emulation/saves/ryujinx
	/run/media/mmcblk0p1/Emulation/saves/scummvm
	/run/media/mmcblk0p1/Emulation/storage/rpcs3/dev_hdd0/home/00000001/savedata
	/run/media/mmcblk0p1/Emulation/storage/yuzu/nand/user/save
	```

	This backs up some personal files and game-related files, including game saves and emulator configurations. Make necessary adjustments to the list based on your needs.

---

## [Add Web Apps to Steam](../topics/steam.md#add-web-apps-to-steam)

This details how to add web-based services to Steam so they can be accessed in gaming mode.

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

- [Enable Wake on LAN](../topics/wol.md#enable-wake-on-lan)
- [Trigger a Wake on LAN](../topics/wol.md#trigger-a-wake-on-lan)
- [Enable Wake on Wireless](../topics/wowlan.md#enable-wake-on-wireless)
- [Trigger a Wake on Wireless](../topics/wowlan.md#trigger-a-wake-on-wireless)

---

## [Plasma Desktop Quality of Life Improvements](../topics/plasma-desktop.md#quality-of-life-improvements)

This details on some things that could be done to improve the experience of using the desktop mode.

---

## [Plasma Desktop Theme Customisations](../topics/plasma-desktop.md#theme-customisations)

This details some customisation options for the Plasma desktop.

---

## Distrobox Installation and Usage

> [!NOTE]  
> As of SteamOS version 3.5, Distrobox (and Podman) should already be pre-installed by default.

This details how we can install, setup, and use Distrobox.

### References

- [Installation](../topics/distrobox.md#installation)
- [Usage](../topics/distrobox.md#usage)

---

## [Install Applications/Libraries via Distrobox](../topics/distrobox.md#software-installation)

This details how we can install certain applications or libraries not present in your system via Distrobox.

---

## [Make Flatpak Apps Respect KDE Theme](../topics/flatpak.md#respect-kde-theme)

This solves the issue of (some) Flatpak apps not looking native in KDE, and defaulting to a GTK theme instead.

---

## [Link's Awakening DX HD](../topics/gaming.md#links-awakening-dx-hd)

This details how to install and run the Link's Awakening DX HD _port_.

---

## [KDE Connect](../topics/kde-connect.md#setup)

This details installing and setting up KDE Connect on your system as a means to share files and other data wirelessly between devices on the same network.

---

## [Ocarina of Time](../topics/gaming.md#ocarina-of-time)

This details how to install and run the Ocarina of Time PC _port_, Ship of Harkinian.

---

## [Majora's Mask](../topics/gaming.md#ocarina-of-time)

This details how to install and run the Majora's Mask PC _port_, 2 Ship 2 Harkinian.
