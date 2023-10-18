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
	- [Plasma Discover Software Installation and Update](#plasma-discover-software-installation-and-update)
	- [Plasma Desktop Quality of Life Improvements](#plasma-desktop-quality-of-life-improvements)
	- [Plasma Desktop Theme Customisations](#plasma-desktop-theme-customisations)
	- [Mounting Remote Directory](#mounting-remote-directory)
	- [Enabling Remote Access](#enabling-remote-access)
	- [EmuDeck](#emudeck)
	- [Emulator BIOS and ROMS](#emulator-bios-and-roms)
	- [PS3 Emulation Setup](#ps3-emulation-setup)
	- [Custom Emulator Configurations](#custom-emulator-configurations)
	- [Custom Game Emulation Configurations](#custom-game-emulation-configurations)
	- [Install Applications/Libraries via Distrobox](#install-applicationslibraries-via-distrobox)

## References

- [Bazzite](https://github.com/ublue-os/bazzite)

---

## Installation

### Description

This details how to install Bazzite and some things that need to be done.

### References

- [Installing Bazzite and Initial Setup](https://universal-blue.org/images/bazzite/installation)

### Steps

1. Follow the referenced **Installing Bazzite and Initial Setup** guide for Bazzite OS installation. Do note that an internet connection is needed.

2. When given the choice (_in GRUB_) upon attempting to boot into the installer, choose the option to install `bazzite-deck` for a Steam Deck-like experience.

3. Upon the initial boot into the desktop, before proceeding with Bazzite's **First Boot Setup**, create a GPG key first:

   - Launch the **Konsole** app.

   - Run the following command to generate a GPG key:

		```sh
		gpg --full-gen-key
		```

   - Leave most of the prompts/values at the default, except when it asks for your:
     - Real name (i.e. `user`)
     - Email (i.e. `user@example.org`)
     - Passphrase (make this the same as your user password)

4. Once a GPG key has successfully been generated, proceed with the first boot setup.

5. During the first boot setup, simply follow all the prompts, and select any applications you may wish to install. I recommend:
	- EmuDeck
	- DeckyLoader
	- LibreOffice
	- Thunderbird
	- VLC
	- Google Chrome

6. Once you're done, you can now reboot - which will then boot you into Steam's **Gaming Mode**.

7. Go through the setup on Gaming mode, I also recommend changing your hostname (device name) through the **Settings** while you're in Gaming mode.

8. In Gaming mode, you have access to the **Steam Menu** via the <kbd>Ctrl + 1</kbd> key, and the **Quick Access Menu** via the <kbd>Ctrl + 2</kbd> key.

9. After a reboot, if you have more things to setup in **Desktop Mode**, head to **Power** in the Steam menu and click the **Switch to Desktop** option.

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

It's recommended to replace the mounting point in the referenced guide with a directory in our home folder (i.e. `/home/deck/mynas`).

---

## [Enabling Remote Access](../topics/enabling-remote-access.md)

This details how we can enable remote access into our Bazzite system from other devices in the same network.

---

## [EmuDeck](../topics/emudeck.md)

This details how to install, setup, and maintain EmuDeck on Bazzite.

---

## [Emulator BIOS and ROMS](../topics/emudeck.md#bios-and-roms)

This details how to setup BIOS/ROM files for each emulator in EmuDeck.

---

## [PS3 Emulation Setup](../topics/emudeck.md#ps3-emulation-setup)

This details how to setup our PS3 emulator, RPCS3, and add/setup PS3 games (i.e. Demon's Souls) using EmuDeck.

---

## [Custom Emulator Configurations](../topics/emulation.md#custom-emulator-configurations)

This details on certain configuration options for several emulators.

---

## [Custom Game Emulation Configurations](../topics/emulation.md#custom-game-emulation-configurations)

This details on certain configuration options or fixes for several games of various emulation systems.

---

## [Install Applications/Libraries via Distrobox](../topics/distrobox.md#software-installation)

This details how we can install certain applications or libraries not present in Bazzite via Distrobox.
