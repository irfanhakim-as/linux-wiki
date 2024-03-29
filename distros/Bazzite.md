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
	- [Default Application](#default-application)
	- [Plasma Discover Software Installation and Update](#plasma-discover-software-installation-and-update)
	- [Plasma Desktop Quality of Life Improvements](#plasma-desktop-quality-of-life-improvements)
	- [Plasma Desktop Theme Customisations](#plasma-desktop-theme-customisations)
	- [Mounting Remote Directory](#mounting-remote-directory)
	- [Remote Access](#remote-access)
	- [EmuDeck](#emudeck)
	- [Custom Emulator Configurations](#custom-emulator-configurations)
	- [Custom Game Emulation Configurations](#custom-game-emulation-configurations)
	- [Install Applications/Libraries via Distrobox](#install-applicationslibraries-via-distrobox)
	- [Wake on LAN or Wireless](#wake-on-lan-or-wireless)
		- [References](#references-4)
	- [Make Flatpak Apps Respect KDE Theme](#make-flatpak-apps-respect-kde-theme)

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

## [Default Application](../topics/plasma-desktop.md#default-application)

From Desktop mode, this details on how to configure default applications of various types on KDE Plasma.

---

## [Plasma Discover Software Installation and Update](../topics/plasma-discover.md#software-installation-and-update)

This details how to install desktop applications and update them using the Plasma Discover application.

---

## [Plasma Desktop Quality of Life Improvements](../topics/plasma-desktop.md#quality-of-life-improvements)

This details on some things that could be done to improve the experience of using the desktop mode.

---

## [Plasma Desktop Theme Customisations](../topics/plasma-desktop.md#theme-customisations)

This details some customisation options for the Plasma desktop.

---

## [Mounting Remote Directory](../topics/mounting-remote-dir.md)

This details on how we can mount a remote directory, should we want to.

> [!NOTE]  
> It's recommended to replace the mounting point in the referenced guide with a directory in our home folder (i.e. `/home/deck/mynas`) to avoid potential issues with Bazzite's immutability.

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

This details how we can install certain applications or libraries not present in Bazzite via Distrobox.

---

## Wake on LAN or Wireless

This details on how to enable, setup and use Wake on LAN (WoL) or Wake on Wireless (WoWLAN) on our system.

### References

- [Wake on LAN](../topics/wol.md)
- [Wake on Wireless](../topics/wowlan.md)

---

## [Make Flatpak Apps Respect KDE Theme](../topics/flatpak.md#respect-kde-theme)

This solves the issue of (some) Flatpak apps not looking native in KDE, and defaulting to a GTK theme instead.
