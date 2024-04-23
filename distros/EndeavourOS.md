# EndeavourOS

## Description

EndeavourOS is an Arch-based distro that provides an Arch experience without the hassle of installing it manually for both x86_64 and ARM systems. After installation, you’re provided with a lightweight and almost barebones environment ready to be explored with your terminal, along with our home-built Welcome App as a powerful guide to help you along.

## Directory
- [EndeavourOS](#endeavouros)
	- [Description](#description)
	- [Directory](#directory)
	- [References](#references)
	- [Yay Installation](#yay-installation)
	- [Install Discover and add Flatpak](#install-discover-and-add-flatpak)
		- [References](#references-1)
	- [Python/Pip Installation](#pythonpip-installation)
	- [Recommended Software](#recommended-software)
	- [Fish Shell](#fish-shell)
		- [References](#references-2)
	- [Remote Access](#remote-access)
	- [Enable Bluetooth](#enable-bluetooth)
	- [Dual-Boot Bluetooth](#dual-boot-bluetooth)
	- [VM Software Setup](#vm-software-setup)
	- [Optimising Windows VM](#optimising-windows-vm)
	- [Timeshift with Btrfs](#timeshift-with-btrfs)
	- [Balance Btrfs Volumes](#balance-btrfs-volumes)
	- [GRUB Dual Booting](#grub-dual-booting)
	- [GRUB Theme Customisation](#grub-theme-customisation)
	- [Setup Docker](#setup-docker)
	- [Setup Podman](#setup-podman)
	- [Better Fonts](#better-fonts)
		- [References](#references-3)
	- [Plasma Desktop Quality of Life Improvements](#plasma-desktop-quality-of-life-improvements)
	- [Default Application](#default-application)
	- [Set Alacritty as Default Terminal](#set-alacritty-as-default-terminal)
	- [Add Colour Profile to Monitor](#add-colour-profile-to-monitor)
	- [Plasma Desktop Theme Customisations](#plasma-desktop-theme-customisations)
	- [Plank Dock](#plank-dock)
	- [Gaming Setup](#gaming-setup)
	- [GreenWithEnvy Setup for NVIDIA](#greenwithenvy-setup-for-nvidia)
	- [Discord Screen Sharing with Audio](#discord-screen-sharing-with-audio)
	- [Custom Steam Game Configurations](#custom-steam-game-configurations)
	- [Plasma Desktop Widgets](#plasma-desktop-widgets)
	- [Make Flatpak Apps Respect KDE Theme](#make-flatpak-apps-respect-kde-theme)
	- [Silent Startup Configurations](#silent-startup-configurations)
	- [Wallpaper Engine Integration with KDE Plasma](#wallpaper-engine-integration-with-kde-plasma)
	- [Razer Peripheral Support](#razer-peripheral-support)
	- [Wake on LAN or Wireless](#wake-on-lan-or-wireless)
		- [References](#references-4)
	- [Backing up with Vorta](#backing-up-with-vorta)
	- [Thunderbird Configuration](#thunderbird-configuration)
	- [Discord Troubleshooting](#discord-troubleshooting)
	- [Migrating (Firefox) to Flatpak](#migrating-firefox-to-flatpak)
	- [EmuDeck](#emudeck)
	- [Recommended Global Flatpak Permissions](#recommended-global-flatpak-permissions)
	- [Using a Touchpad](#using-a-touchpad)
		- [References](#references-5)
	- [Generate GPG Key and Use with Git](#generate-gpg-key-and-use-with-git)
		- [References](#references-6)
	- [Desktop Auto Login](#desktop-auto-login)
	- [KDE Wallet](#kde-wallet)
		- [References](#references-7)
	- [Distrobox Installation and Usage](#distrobox-installation-and-usage)
		- [References](#references-8)
	- [Install Applications/Libraries via Distrobox](#install-applicationslibraries-via-distrobox)
	- [VS Code Integration with Distrobox](#vs-code-integration-with-distrobox)
	- [Deb Package Installation](#deb-package-installation)
	- [Discover Torrents using qBittorrent](#discover-torrents-using-qbittorrent)
	- [Cloning a Disk](#cloning-a-disk)
	- [Mounting a Secondary Internal Disk](#mounting-a-secondary-internal-disk)
	- [Fix Kwallet Error in Visual Studio Code](#fix-kwallet-error-in-visual-studio-code)
	- [Miniconda Environments](#miniconda-environments)
	- [XP-Pen](#xp-pen)
	- [OBS Studio](#obs-studio)
		- [References](#references-9)
	- [Magewell Capture Device on OBS](#magewell-capture-device-on-obs)

## References

- [EndeavourOS](https://endeavouros.com)

---

## [Yay Installation](../topics/yay.md#installation)

This details how to install Yay, a very necessary tool for installing AUR packages on Arch Linux based systems.

---

## Install Discover and add Flatpak

This installs the Discover app store, Flatpak, and adds the Flathub repository.

### References

- [Install Discover and Flatpak](../topics/plasma-discover.md#installation)
- [Add Flathub Repository](../topics/plasma-discover.md#add-flathub-repository)

---

## [Python/Pip Installation](../topics/python.md#installation)

This guide details on how to install both `python`, the programming language, and `pip`, Python's package manager.

---

## Recommended Software

This list contains applications that may not be bundled with EndeavourOS, but are recommended.

[Yay/Pacman](../topics/yay.md#install) packages:

```
partitionmanager
chntpw # required by bt-dualboot
game-devices-udev
htop
python-eduvpn-client
openvpn
anydesk-bin
helm
notable-insiders-bin
firefox-developer-edition
kalendar
cyberdropdownloader
helm-docs
git-lfs
bluez-hid2hci
cloudflared
plasma-systemmonitor
traceroute
unrar
unzip
wget
which
```

[Flatpak](../topics/flatpak.md#install) packages:

```
com.borgbase.Vorta
com.calibre_ebook.calibre
com.discordapp.Discord
com.github.Eloston.UngoogledChromium
com.github.Matoking.protontricks
com.github.joseexposito.touche
com.github.tchx84.Flatseal
com.github.xournalpp.xournalpp
com.google.Chrome
com.heroicgameslauncher.hgl
com.leinardi.gwe
com.microsoft.Edge
com.obsproject.Studio
com.slack.Slack
com.spotify.Client
com.system76.Popsicle
com.ticktick.TickTick
com.visualstudio.code
dev.vencord.Vesktop
fr.handbrake.ghb
io.github.jonmagon.kdiskmark
io.github.mimbrero.WhatsAppDesktop
io.gitlab.librewolf-community
io.mpv.Mpv
it.mijorus.gearlever
net.davidotek.pupgui2
org.audacityteam.Audacity
org.bunkus.mkvtoolnix-gui
org.filezillaproject.Filezilla
org.gimp.GIMP
org.inkscape.Inkscape
org.kde.audiotube
org.kde.filelight
org.kde.kasts
org.kde.kclock
org.kde.kcolorchooser
org.kde.kdenlive
org.kde.krita
org.libreoffice.LibreOffice
org.mozilla.Thunderbird
org.mozilla.firefox
org.prismlauncher.PrismLauncher
org.qbittorrent.qBittorrent
org.raspberrypi.rpi-imager
org.signal.Signal
org.telegram.desktop
tv.plex.PlexDesktop
```

[Pip](../topics/python.md#pip-usage) packages:

```
bt-dualboot
```

---

## Fish Shell

This details the installation of the Fish shell, making it the default shell for the user, and setting an ideal configuration or profile for the Fish shell.

### References

- [Fish Setup](../topics/fish.md#setup)
- [Fish Configuration](../topics/fish.md#configuration)

---

## [Remote Access](../topics/remote-access.md)

This details how we can enable remote access into our system from other devices in the same network or externally.

---

## [Enable Bluetooth](../topics/bluetooth.md#enable-bluetooth)

EndeavourOS does not enable Bluetooth by default due to security reasons. This details how to enable Bluetooth on our system.

---

## [Dual-Boot Bluetooth](../topics/bluetooth.md#dual-boot-bluetooth)

This details how to fix issues with using Bluetooth devices in a dual-boot setup.

---

## [VM Software Setup](../topics/virtual-machine.md#vm-software-setup)

This details how to setup Virt-manager, a software that allows creating and managing VMs.

---

## [Optimising Windows VM](../topics/virtual-machine.md#optimising-windows-vm)

This details some steps that can be done on a Windows VM through VirtManager in order to make the experience a little better.

---

## [Timeshift with Btrfs](../topics/btrfs.md#timeshift-with-btrfs)

Timeshift for Linux is an application that provides functionality similar to the System Restore feature in Windows and the Time Machine tool in macOS. This details how to setup and use Timeshift with Btrfs.

---

## [Balance Btrfs Volumes](../topics/btrfs.md#balance-btrfs-volumes)

If you are using a Btrfs filesystem, it is recommended for you to "balance" your Btrfs volumes on a monthly basis in order to ensure that the free space available on your device is properly unallocated.

---

## [GRUB Dual Booting](../topics/grub.md#dual-booting)

This details how we can enable dual booting into Windows or another Linux install.

---

## [GRUB Theme Customisation](../topics/grub.md#theme-customisation)

This details how to change the theme/appearance of the GRUB bootloader.

---

## [Setup Docker](../topics/docker.md#setup)

This details how to install and set up Docker for use by `${USER}` without needing `sudo` (not rootless).

---

## [Setup Podman](../topics/podman.md#linux)

This details the installation and setup of Podman on Linux as an alternative to Docker.

---

## Better Fonts

This details several configuration options for our desktop to have and use better looking fonts. This also includes Emoji, Microsoft Fonts, and Apple Fonts support.

### References

- [Fonts Installation](../topics/fonts.md#Installation)
- [Fonts Configuration](../topics/fonts.md#Configuration)

---

## [Plasma Desktop Quality of Life Improvements](../topics/plasma-desktop.md#quality-of-life-improvements)

This details on some things that could be done to improve the experience of using the desktop mode.

---

## [Default Application](../topics/plasma-desktop.md#default-application)

This details on how to configure default applications of various types on KDE Plasma.

---

## [Set Alacritty as Default Terminal](../topics/alacritty.md#set-as-default-terminal)

This installs and sets up Alacritty as the default terminal.

---

## [Add Colour Profile to Monitor](../topics/display.md#add-colour-profile)

This details how to add and use a colour profile with our monitor.

---

## [Plasma Desktop Theme Customisations](../topics/plasma-desktop.md#theme-customisations)

This adds more task switchers to KDE settings, including thumbnails/thumbnails grid

---

## [Plank Dock](../topics/plank.md)

This installs and sets up Plank as the dock. This also supports a dual monitor setup.

> [!NOTE]  
> You may skip this if you wish to use the default KDE panel as the dock. Steps for setting this up is included in the [Floating Dock](../topics/plasma-desktop.md#floating-dock) guide.

---

## [Gaming Setup](../topics/gaming.md#setup)

This guide goes through setting up packages and configuration options that could help improve our PC gaming experience.

---

## [GreenWithEnvy Setup for NVIDIA](../topics/nvidia.md#greenwithenvy)

This installs GreenWithEnvy, A system utility for controlling NVIDIA GPUs. The most important thing about GreenWithEnvy is the ability to control the GPU's fan profile, essential to GPU temps during gaming.

---

## [Discord Screen Sharing with Audio](../topics/discord.md#screen-sharing-with-audio)

The official Discord client does not support screen sharing with audio on Linux. This is a workaround to enable screen sharing with audio in Discord on Linux using a custom Discord client.

---

## [Custom Steam Game Configurations](../topics/gaming.md#custom-game-configurations)

This details any workarounds required for games that either do not work out of the box or perform poorly on Steam (Runtime).

---

## [Plasma Desktop Widgets](../topics/plasma-desktop.md#widgets)

This details some widgets we could add to our desktop for added functionality.

---

## [Make Flatpak Apps Respect KDE Theme](../topics/flatpak.md#respect-kde-theme)

This solves the issue of (some) Flatpak apps not looking native in KDE, and defaulting to a GTK theme instead.

---

## [Silent Startup Configurations](../topics/autostart.md#silent-startup-configurations)

This details known configurations for certain applications on how to have them autostart silently.

---

## [Wallpaper Engine Integration with KDE Plasma](../topics/wallpaper-engine.md#integration-with-kde-plasma)

This details the use of Wallpaper Engine wallpapers in KDE Plasma.

---

## [Razer Peripheral Support](../topics/razer.md#peripheral-support)

This details on how to setup and configure Razer Peripherals.

---

## Wake on LAN or Wireless

This details on how to enable, setup and use Wake on LAN (WoL) or Wake on Wireless (WoWLAN) on our system.

### References

- [Wake on LAN](../topics/wol.md)
- [Wake on Wireless](../topics/wowlan.md)

---

## [Backing up with Vorta](../topics/vorta.md)

This sets up Vorta as our home directory backup solution.

1. The **Repository** we'll be using is a secondary drive mounted to our system (i.e. `/mnt/data`):

	```
	/mnt/data/System/Backups/Snapshots/mycomputer
	```

	You can change this to any directories on any drives or Samba Share mountpoint you may have.

2. The **Exclude Patterns** we'll be using are:

    ```
    *[Cc]ache*/*
    *[Cc]aches*/*
    */.thumbnails/*
    */.local/share/[Tt]rash*
    *.backup*
    *~
    *.dropbox*
    /proc/*
    /sys/*
    /dev/*
    /run/*
    /etc/mtab
    /var/cache/*
    */lost+found/*
    /tmp/*
    /var/tmp/*
    /var/backups/*
    .Private
	~/Downloads/Torrent/Downloads/*
	~/Videos/Screen Recording/*
	~/Videos/Handbrake/*
    ```

    Add any additional directories or files you wish to exclude from the backup.

Everything else is set according to the referenced guide.

---

## [Thunderbird Configuration](../topics/thunderbird.md#configuration)

This details how to configure Thunderbird including its default sort order and sort type.

---

## [Discord Troubleshooting](../topics/discord.md#troubleshooting)

This details several troubleshooting steps and workarounds for specific issues with the official Discord client on Linux.

---

## [Migrating (Firefox) to Flatpak](../topics/flatpak.md#migrating-to-flatpak)

This details how to migrate your configurations and data from _standard_ packages to Flatpaks, such as Mozilla Firefox installed by the distro.

---

## [EmuDeck](../topics/emudeck.md)

This details how to install, setup, and maintain EmuDeck on our system.

---

## [Recommended Global Flatpak Permissions](../topics/flatpak.md#recommended-global-permissions)

This details how to set global permissions for Flatpak apps and the recommended permissions to set. This should fix issues such as custom cursor icons not being used, and files not being able to be read or written in Flatpak apps to/from a remote directory.

---

## Using a Touchpad

This details on how to configure and use a trackpad such as the Apple Magic Trackpad 2 with macOS-like gestures on X11.

### References

- [Touchpad Configuration](../topics/touchpad.md#touchpad-configuration)
- [macOS-like Gestures](../topics/touchpad.md#macos-like-gestures)
- [Smooth Scrolling in Mozilla Applications](../topics/touchpad.md#smooth-scrolling-in-mozilla-applications)

---

## Generate GPG Key and Use with Git

This details how to generate a GPG key and enforce automatic signing for all our commits and tags in Git and GitHub/GitLab.

### References

- [Generate GPG Key](../topics/gpg.md#generate-gpg-key)
- [Sign Git Commits](../topics/gpg.md#sign-git-commits)

---

## [Desktop Auto Login](../topics/plasma-desktop.md#auto-login)

This guides how to enable auto login to the desktop for our user.

---

## KDE Wallet

This details how to how to setup and create a default KDE Wallet and set it to auto unlock with our desktop at the expense of security.

### References

- [Setup](../topics/kwallet.md#setup)
- [Auto Unlock](../topics/kwallet.md#auto-unlock)

---

## Distrobox Installation and Usage

This details how we can install, setup, and use Distrobox.

### References

- [Installation](../topics/distrobox.md#installation)
- [Usage](../topics/distrobox.md#usage)

---

## [Install Applications/Libraries via Distrobox](../topics/distrobox.md#software-installation)

This details how we can install certain applications or libraries not present in your system via Distrobox.

---

## [VS Code Integration with Distrobox](../topics/distrobox.md#vs-code-integration)

This allows attaching to a Distrobox Container from within VS Code (on the host system) like you would on Windows with WSL.

---

## [Deb Package Installation](../topics/deb.md#package-installation)

This details how to install deb packages on Arch Linux based systems.

---

## [Discover Torrents using qBittorrent](../topics/qbittorrent.md#discover-torrents)

This guide details on how we could look for torrent files from qBittorrent directly using Jackett.

---

## [Cloning a Disk](../topics/partitionmanager.md#cloning-a-disk)

This guide details on how we could clone a disk using KDE Partition Manager.

---

## [Mounting a Secondary Internal Disk](../topics/partitionmanager.md#mounting-a-secondary-internal-disk)

This details how we could add a secondary internal drive to our computer.

---

## [Fix Kwallet Error in Visual Studio Code](../topics/kwallet.md#fix-error-with-visual-studio-code)

This guide details on how we could solve the **You're running in a KDE environment but the OS keyring is not available for encryption. Ensure you have kwallet running.** error when launching Visual Studio Code.

---

## [Miniconda Environments](../topics/python.md#miniconda-environments)

This guide details on how we could install, setup, and use Conda to create `python` environments of various `python` versions.

---

## [XP-Pen](../topics/graphics-tablet.md#xp-pen)

This briefs how to set up an XP-Pen drawing tablet on Linux and addresses an issue with using it on a multi-monitor setup.

---

## OBS Studio

This details how to set up and configure OBS Studio for recording of all purposes including gaming and have separate audio tracks for each application.

### References

- [Setup](../topics/obs.md#setup)
- [Capturing Steam Games](../topics/obs.md#capturing-steam-games)
- [Separate Audio Tracks by Application](../topics/obs.md#separate-audio-tracks-by-application)

---

## [Magewell Capture Device on OBS](../topics/obs.md#magewell-usb-capture-hdmi-4k-plus)

This details the recommended configuration for the Magewell USB Capture HDMI 4K Plus on OBS.
