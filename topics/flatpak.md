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
  - [Make Flatpak Apps Use KDE File Picker](#make-flatpak-apps-use-kde-file-picker)
    - [Description](#description-3)
    - [References](#references-3)
  - [Recommended Global Permissions](#recommended-global-permissions)
    - [Description](#description-4)
    - [Steps](#steps-1)

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

2. Override permissions to use the Breeze theme for both System and User Flatpaks:

    ```sh
    sudo flatpak override --system --filesystem=xdg-config/gtk-3.0:ro --filesystem=xdg-config/gtkrc-2.0:ro --filesystem=xdg-config/gtk-4.0:ro --filesystem=xdg-config/gtkrc:ro --env "GTK_THEME=Breeze"
    flatpak override --user --filesystem=xdg-config/gtk-3.0:ro --filesystem=xdg-config/gtkrc-2.0:ro --filesystem=xdg-config/gtk-4.0:ro --filesystem=xdg-config/gtkrc:ro --env "GTK_THEME=Breeze"
    ```

---

## Make Flatpak Apps Use KDE File Picker

### Description

This makes Flatpak apps use Dolphin as the File Picker and not Nautilus (GTK).

### References

- [Make Flatpak Apps Use KDE File Picker](plasma-desktop.md#make-flatpak-apps-use-kde-file-picker)

---

## Recommended Global Permissions

### Description

This details how to set global permissions for Flatpak apps and the recommended permissions to set. This should fix issues such as custom cursor icons not being used, and files not being able to be read or written in Flatpak apps to/from a remote directory.

> [!IMPORTANT]  
> The **Flatseal** Flatpak app is required for this guide.

### Steps

1. Launch the **Flatseal** app.

2. On Flatseal, click the **All Applications** menu item.

3. In the All Applications view, scroll down to the **Filesystem** section.

4. Under **Other files**, click the **Add folder** icon and add in the following paths to the (existing) list:

   - xdg-videos:rw
   - xdg-music:rw
   - xdg-documents:rw
   - xdg-download:rw
   - xdg-pictures:rw
   - xdg-config/fontconfig:ro
   - ~/.icons:ro
   - /mnt/mynas:rw

  > [!WARNING]  
  > Replace `/mnt/mynas` with the path of your remote directory if you have one, else exclude it.

  > [!TIP]  
  > It is highly recommended to have all user fonts installed to the `~/.local/share/fonts` directory so our Flatpak apps can see/use them.

  > [!NOTE]  
  > The `xdg-config/fontconfig:ro` override allows Flatpak apps to utilise the font configurations we have done using the `~/.config/fontconfig/fonts.conf` file.

5. After doing this, simply restart any running Flatpak apps for these overrides to apply.
