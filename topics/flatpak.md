# Flatpak

## Description

Flatpak, formerly known as xdg-app, is a utility for software deployment and package management for Linux. It is advertised as offering a sandbox environment in which users can run application software in isolation from the rest of the system.

> [!NOTE]  
> Parts of this guide assumes that you are using the KDE Plasma desktop environment.

## Directory

- [Flatpak](#flatpak)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Setup](#setup)
    - [Description](#description-1)
    - [References](#references-1)
  - [Respect KDE Theme](#respect-kde-theme)
    - [Description](#description-2)
    - [References](#references-2)
    - [Steps](#steps)

## References

- [Flatpak](https://flatpak.org)

---

## Setup

### Description

This details how to install the Plasma Discover application and Flatpak, as well as how to add the Flathub repository so we have access to Flatpak applications.

### References

- [Discover and Flatpak Installation](plasma-discover.md#discover-and-flatpak-installation)
- [Add Flathub Repository](plasma-discover.md#add-flathub-repository)

---

## Respect KDE Theme

### Description

This solves the issue of (some) Flatpak apps not looking native in KDE, and defaulting to a GTK theme instead.

### References

- [Plasma consistent Flatpak theming](https://www.reddit.com/r/kde/comments/ujqih9/plasma_consistent_flatpak_theming)

### Steps

1. Install Breeze GTK theme as a Flatpak:

    ```sh
    flatpak install --user org.gtk.Gtk3theme.Breeze
    ```

2. Override permissions to use system theme:

    ```sh
    sudo flatpak override --system --filesystem=xdg-config/gtk-3.0:ro --filesystem=xdg-config/gtkrc-2.0:ro --filesystem=xdg-config/gtk-4.0:ro --filesystem=xdg-config/gtkrc:ro --env "GTK_THEME=Breeze"
    ```