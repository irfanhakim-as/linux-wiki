# Bazzite

## Description

Bazzite is an OCI image that serves as an alternative operating system for the [Steam Deck](https://www.steamdeck.com), and a ready-to-game SteamOS-like for desktop computers and living room home theatre PCs.

## Directory

- [Bazzite](#bazzite)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Installation](#installation)
    - [Description](#description-1)
    - [References](#references-1)
    - [Steps](#steps)
  - [Toggle Wayland](#toggle-wayland)
    - [Description](#description-2)
    - [References](#references-2)
    - [Steps](#steps-1)
  - [Update](#update)
    - [Description](#description-3)
    - [References](#references-3)
    - [Steps](#steps-2)
  - [Fish Shell](#fish-shell)
    - [References](#references-4)
    - [Notes](#notes)
  - [Default Applications](#default-applications)
  - [Plasma Discover Usage](#plasma-discover-usage)
  - [Plasma Desktop Quality of Life Improvements](#plasma-desktop-quality-of-life-improvements)
  - [Plasma Desktop Theme Customisations](#plasma-desktop-theme-customisations)
  - [Mounting Remote Directory](#mounting-remote-directory)
    - [Notes](#notes-1)
  - [Remote Access](#remote-access)
  - [EmuDeck](#emudeck)
  - [Custom Emulator Configurations](#custom-emulator-configurations)
  - [Custom Game Emulation Configurations](#custom-game-emulation-configurations)
  - [Install Applications/Libraries via Distrobox](#install-applicationslibraries-via-distrobox)
  - [Wake on LAN or Wireless](#wake-on-lan-or-wireless)
    - [References](#references-5)
  - [Make Flatpak Apps Respect KDE Theme](#make-flatpak-apps-respect-kde-theme)
  - [Backing up with Vorta](#backing-up-with-vorta)
    - [References](#references-6)
    - [Notes](#notes-2)
  - [KDE Connect](#kde-connect)
  - [Link's Awakening DX HD](#links-awakening-dx-hd)
  - [Ocarina of Time](#ocarina-of-time)
  - [Majora's Mask](#majoras-mask)
  - [Wayland](#wayland)
    - [References](#references-7)

## References

- [Bazzite](https://github.com/ublue-os/bazzite)
- [Universal Blue Discourse Documentation](https://universal-blue.discourse.group/docs)

---

## Installation

### Description

This details how to install Bazzite and some things that need to be done.

### References

- [Installing Bazzite and Initial Setup](https://universal-blue.discourse.group/docs?topic=30)

### Steps

1. Follow the referenced **Installing Bazzite and Initial Setup** guide for Bazzite OS installation. Do note that an internet connection is needed.

2. When given the choice (_in GRUB_) upon attempting to boot into the installer, choose the option to install `bazzite-deck` for a Steam Deck-like experience.

3. Upon the initial boot into the desktop, before proceeding with Bazzite's **First Boot Setup**, [generate a GPG Key](../topics/gpg.md#generate-gpg-key) first.

4. Once a GPG key has successfully been generated, proceed with the first boot setup.

5. During the first boot setup, simply follow all the prompts, and select any applications you may wish to install. I recommend:

	- EmuDeck
	- DeckyLoader
	- LibreOffice
	- Thunderbird
	- VLC
	- Google Chrome

6. By default, Bazzite should run in a Wayland session. If you wish for Bazzite to run in an X.Org/X11 session by default, you can toggle this by running the following command:

	```sh
	ujust _toggle_wayland
	```

7. Once you're done, you can now reboot - which will then boot you into Steam's **Gaming Mode**.

8. Go through the setup on Gaming mode, I also recommend changing your hostname (device name) through the **Settings** while you're in Gaming mode.

9. In Gaming mode, you have access to the **Steam Menu** via the <kbd>Ctrl + 1</kbd> key, and the **Quick Access Menu** via the <kbd>Ctrl + 2</kbd> key.

10. After a reboot, if you have more things to setup in **Desktop Mode**, head to **Power** in the Steam menu and click the **Switch to Desktop** option.

---

## Toggle Wayland

### Description

Bazzite defaults to a Wayland session, this details how to toggle between a Wayland and X.Org/X11 session.

### References

- [Use X11 for Steam Deck images instead of Wayland](https://universal-blue.discourse.group/docs?topic=37#use-x11-for-steam-deck-images-instead-of-wayland-12)

### Steps

To toggle between a Wayland and X.Org/X11 session, simply run the following command:

```sh
ujust _toggle_wayland
```

---

## Update

### Description

This details how to update and maintain a Bazzite system.

### References

- [Update your system](https://universal-blue.org/cheatsheet/just/#update-your-system)

### Steps

1. To update the system, simply run the following command:

	```sh
	just update
	```

	This simple command will update the system, update the Flatpak apps, as well as Distrobox containers like so:

	```sh
	rpm-ostree update
	flatpak update -y
	distrobox upgrade -a
	```

2. If a major upgrade is required (i.e. Bazzite goes through an overhaul or if something is broken), perform a rebase with the following command:

	```sh
	rpm-ostree rebase ostree-image-signed:docker://ghcr.io/ublue-os/bazzite-deck:latest
	```

	> [!NOTE]  
	> This rebase is for the `bazzite-deck` image (i.e. for Steam Deck/HTPC devices). Replace the image name with the appropriate Bazzite image of your choosing.

3. Reboot the system after the update or rebase is complete.

---

## Fish Shell

This details on how to make Fish the default shell for the user, and setting an ideal configuration or profile for the Fish shell.

### References

- [Fish Make Default](../topics/fish.md#make-default)
- [Fish Configuration](../topics/fish.md#configuration)

### Notes

- Since Bazzite is immutable, some of the dependencies required for the recommended configuration that were not preinstalled must either be installed manually (i.e. by downloading and installing their binary release from their source) or through [Distrobox](../topics/distrobox.md#software-installation) using an Arch Linux based container with [`yay`](../topics/yay.md#installation) installed.

- Opting for `podman` over `docker` as the default container runtime is highly recommended for immutable systems due to its rootless nature.

- In your Fish `config.fish` file, you may comment the entire `# Package manager` block since it does not apply for the Bazzite system.

---

## [Default Applications](../topics/plasma-desktop.md#default-applications)

From Desktop mode, this details on how to configure default applications of various types on KDE Plasma.

---

## [Plasma Discover Usage](../topics/plasma-discover.md#usage)

This details how to use the Plasma Discover application to search, install, update, or uninstall packages graphically.

---

## [Plasma Desktop Quality of Life Improvements](../topics/plasma-desktop.md#quality-of-life-improvements)

This details on some things that could be done to improve the experience of using the desktop mode.

---

## [Plasma Desktop Theme Customisations](../topics/plasma-desktop.md#theme-customisations)

This details some customisation options for the Plasma desktop.

---

## [Mounting Remote Directory](../topics/samba.md#mounting-remote-directory)

This details how to mount a remote directory to our local machine using Samba.

### Notes

- It's _potentially_ recommended to use a path within our user directory as the mounting point for the remote directory to avoid potential issues with the system's immutability. If you still wish to mount it outside of the user directory, be sure to only mount it from within `/mnt`.

---

## [Remote Access](../topics/remote-access.md)

This details how we can enable remote access into our system from other devices in the same network or externally.

---

## [EmuDeck](../topics/emudeck.md)

This details how to install, setup, and maintain EmuDeck on Bazzite.

---

## [Custom Emulator Configurations](../topics/emulation.md#custom-emulator-configurations)

This details on certain configuration options for several emulators.

---

## [Custom Game Emulation Configurations](../topics/emulation.md#custom-game-emulation-configurations)

This details on certain configuration options or fixes for several games of various emulation systems.

---

## [Install Applications/Libraries via Distrobox](../topics/distrobox.md#software-installation)

This details how we can install certain applications or libraries not present in your system via Distrobox.

---

## Wake on LAN or Wireless

This details on how to enable, setup and use Wake on LAN (WoL) or Wake on Wireless (WoWLAN) on our system.

### References

- [Enable Wake on LAN](../topics/wol.md#enable-wake-on-lan)
- [Trigger a Wake on LAN](../topics/wol.md#trigger-a-wake-on-lan)
- [Enable Wake on Wireless](../topics/wowlan.md#enable-wake-on-wireless)
- [Trigger a Wake on Wireless](../topics/wowlan.md#trigger-a-wake-on-wireless)

---

## [Make Flatpak Apps Respect KDE Theme](../topics/flatpak.md#respect-kde-theme)

This solves the issue of (some) Flatpak apps not looking native in KDE, and defaulting to a GTK theme instead.

---

## Backing up with Vorta

This details installing and setting up Vorta to have it backup our personal files, and restoring them when needed.

### References

- [Vorta Setup](../topics/vorta.md#setup)
- [Vorta Usage](../topics/vorta.md#usage)

### Notes

- These are our source folders and files to backup specific to the Bazzite system:

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

## [KDE Connect](../topics/kde-connect.md#setup)

This details installing and setting up KDE Connect on your system as a means to share files and other data wirelessly between devices on the same network.

---

## [Link's Awakening DX HD](../topics/gaming.md#links-awakening-dx-hd)

This details how to install and run the Link's Awakening DX HD _port_.

---

## [Ocarina of Time](../topics/gaming.md#ocarina-of-time)

This details how to install and run the Ocarina of Time PC _port_, Ship of Harkinian.

---

## [Majora's Mask](../topics/gaming.md#ocarina-of-time)

This details how to install and run the Majora's Mask PC _port_, 2 Ship 2 Harkinian.

---

## Wayland

This details specific configurations, fixes, and tips for systems running on Wayland.

### References

- [Fix Keys Activating When Switching Tasks](../topics/wayland.md#fix-keys-activating-when-switching-tasks)
